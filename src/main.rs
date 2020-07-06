use actix_web::{middleware, web, App, Error, HttpResponse, HttpServer};
use juniper::{
    graphiql::graphiql_source, http::GraphQLRequest, FieldResult, GraphQLEnum, GraphQLObject,
    RootNode,
};
use serde::Deserialize;
use std::{io, sync::Arc};
use thiserror::Error;

#[derive(Debug, Deserialize, Error)]
enum Errors {
    #[error("Language {0} is not valid")]
    InvalidLanguage(String),
    #[error("Could not parse {0}")]
    ParseError(String),
    #[error("Could not find {0}")]
    NotFound(String),
}

#[derive(Debug, GraphQLEnum)]
#[graphql(name = "Languages", description = "Languages my CV exist in")]
enum Language {
    Norwegian,
    English,
}

#[derive(Debug, Deserialize, GraphQLEnum, Clone, PartialEq)]
#[graphql(description = "Social media I am on")]
enum SocialMedia {
    #[graphql(name = "LINKEDIN")]
    LinkedIn,
    #[graphql(name = "GITHUB")]
    GitHub,
    Website,
    Email,
    Phone,
}

#[derive(Debug, Deserialize, GraphQLObject, Clone)]
#[graphql(description = "Social media")]
struct Social {
    kind: SocialMedia,
    link: String,
}

#[derive(Debug, Deserialize, GraphQLObject, Clone)]
#[graphql(description = "Education")]
struct Education {
    title: String,
    university: String,
    institute: String,
    degree: String,
    start: i32,
    end: i32,
}

#[derive(Debug, Deserialize, GraphQLObject, Clone)]
#[graphql(description = "About me")]
struct Me {
    name: String,
    about: String,
    socials: Vec<Social>,
    education: Vec<Education>,
}

impl Me {
    fn new(language: Language) -> Result<Self, Errors> {
        match language {
            Language::Norwegian => read_language_configuration("norwegian"),
            Language::English => read_language_configuration("english"),
        }
    }

    fn social_media(&self, kind: &SocialMedia) -> &Social {
        self.socials
            .iter()
            .find(|e| e.kind == *kind)
            .expect("This should not fail")
    }
}

fn read_language_configuration(language: &str) -> Result<Me, Errors> {
    match serde_dhall::from_file(&format!("{}.dhall", language)).parse() {
        Ok(file) => Ok(file),
        Err(..) => Err(Errors::ParseError(format!("{}.dhall", language))),
    }
}

struct QueryRoot;

#[juniper::object(Context = Context)]
impl QueryRoot {
    fn me(language: Language, context: &Context) -> FieldResult<Me> {
        Ok(match language {
            Language::English => context.english.clone(),
            Language::Norwegian => context.norwegian.clone(),
        })
    }

    fn social_media(kind: SocialMedia, language: Language, context: &Context) -> &Social {
        match language {
            Language::English => context.english.social_media(&kind),
            Language::Norwegian => context.norwegian.social_media(&kind),
        }
    }
}

struct MutationRoot;

#[juniper::object(Context = Context)]
impl MutationRoot {}

type Schema = RootNode<'static, QueryRoot, MutationRoot>;

fn create_schema() -> Schema {
    Schema::new(QueryRoot {}, MutationRoot {})
}

#[derive(Debug, Clone)]
struct Context {
    english: Me,
    norwegian: Me,
}

impl juniper::Context for Context {}

async fn graphiql() -> HttpResponse {
    let html = graphiql_source("http://0.0.0.0:8080/graphql");
    HttpResponse::Ok()
        .content_type("text/html; charset=utf-8")
        .body(html)
}

async fn graphql(
    context: web::Data<Context>,
    schema: web::Data<Arc<Schema>>,
    data: web::Json<GraphQLRequest>,
) -> Result<HttpResponse, Error> {
    let res = data.execute(&schema, &context);
    let json = serde_json::to_string(&res).map_err(Error::from)?;

    Ok(HttpResponse::Ok()
        .content_type("application/json")
        .body(json))
}

#[actix_rt::main]
async fn main() -> io::Result<()> {
    std::env::set_var("RUST_LOG", "actix_web=debug");
    env_logger::init();

    // Create Juniper schema
    let schema = std::sync::Arc::new(create_schema());
    let context = Context {
        english: Me::new(Language::English).unwrap(),
        norwegian: Me::new(Language::Norwegian).unwrap(),
    };

    println!("Starting server on http://0.0.0.0:8080");

    // Start http server
    HttpServer::new(move || {
        App::new()
            .data(schema.clone())
            .data(context.clone())
            .wrap(middleware::Logger::default())
            .service(web::resource("/graphql").route(web::post().to(graphql)))
            .service(web::resource("/").route(web::get().to(graphiql)))
    })
    .bind("0.0.0.0:8080")?
    .run()
    .await
}
