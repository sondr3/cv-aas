use actix_web::{middleware, web, App, Error, HttpResponse, HttpServer};
use juniper::{
    graphiql::graphiql_source, http::GraphQLRequest, EmptyMutation, FieldResult, GraphQLEnum,
    GraphQLObject, RootNode,
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

#[derive(Debug, Deserialize, GraphQLObject, Clone)]
#[graphql(description = "Social media")]
struct Social {
    title: String,
    link: String,
}

#[derive(Debug, Deserialize, GraphQLObject)]
#[graphql(description = "About me")]
struct Me {
    name: String,
    about: String,
    socials: Vec<Social>,
}

impl Me {
    fn new(language: &Language) -> Result<Self, Errors> {
        match language {
            Language::Norwegian => read_language_configuration("norwegian"),
            Language::English => read_language_configuration("english"),
        }
    }

    fn social_media(&self, name: &str) -> Option<&Social> {
        self.socials
            .iter()
            .find(|e| e.title.to_lowercase().contains(&name.to_lowercase()))
    }
}

fn read_language_configuration(language: &str) -> Result<Me, Errors> {
    match serde_dhall::from_file(&format!("{}.dhall", language)).parse() {
        Ok(file) => Ok(file),
        Err(..) => Err(Errors::ParseError(format!("{}.dhall", language))),
    }
}

pub struct QueryRoot;

#[juniper::object]
impl QueryRoot {
    fn me(language: Language) -> FieldResult<Me> {
        match Me::new(&language) {
            Ok(me) => Ok(me),
            Err(e) => Err(e.into()),
        }
    }

    fn social_media(name: String) -> FieldResult<Social> {
        let me = Me::new(&Language::English)?;
        match me.social_media(&name) {
            Some(social) => Ok(social.clone()),
            None => Err(Errors::NotFound(name).into()),
        }
    }
}

pub type Schema = RootNode<'static, QueryRoot, EmptyMutation<()>>;

pub fn create_schema() -> Schema {
    Schema::new(QueryRoot {}, EmptyMutation::<()>::new())
}

async fn graphiql() -> HttpResponse {
    let html = graphiql_source("http://0.0.0.0:8080/graphql");
    HttpResponse::Ok()
        .content_type("text/html; charset=utf-8")
        .body(html)
}

async fn graphql(
    st: web::Data<Arc<Schema>>,
    data: web::Json<GraphQLRequest>,
) -> Result<HttpResponse, Error> {
    let user = web::block(move || {
        let res = data.execute(&st, &());
        Ok::<_, serde_json::error::Error>(serde_json::to_string(&res)?)
    })
    .await?;
    Ok(HttpResponse::Ok()
        .content_type("application/json")
        .body(user))
}

#[actix_rt::main]
async fn main() -> io::Result<()> {
    std::env::set_var("RUST_LOG", "actix_web=debug");
    env_logger::init();

    // Create Juniper schema
    let schema = std::sync::Arc::new(create_schema());

    println!("Starting server on http://0.0.0.0:8080");

    // Start http server
    HttpServer::new(move || {
        App::new()
            .data(schema.clone())
            .wrap(middleware::Logger::default())
            .service(web::resource("/graphql").route(web::post().to(graphql)))
            .service(web::resource("/graphiql").route(web::get().to(graphiql)))
    })
    .bind("0.0.0.0:8080")?
    .run()
    .await
}
