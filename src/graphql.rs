use crate::get_full_url;
use crate::models::{Language, Me, Social, SocialMedia};
use actix_web::{web, Error, HttpResponse};
use juniper::{graphiql::graphiql_source, http::GraphQLRequest, FieldResult, RootNode};
use std::sync::Arc;

pub struct QueryRoot;

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

    fn resume(language: Language) -> String {
        match language {
            Language::English => format!("{}/english", get_full_url()),
            Language::Norwegian => format!("{}/norwegian", get_full_url()),
        }
    }
}

pub struct MutationRoot;

#[juniper::object(Context = Context)]
impl MutationRoot {}

pub type Schema = RootNode<'static, QueryRoot, MutationRoot>;

pub fn create_schema() -> Schema {
    Schema::new(QueryRoot {}, MutationRoot {})
}

#[derive(Debug, Clone)]
pub struct Context {
    english: Me,
    norwegian: Me,
}

impl juniper::Context for Context {}

async fn graphiql() -> HttpResponse {
    let html = graphiql_source(&format!("{}/graphql", get_full_url()));
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

pub fn register(config: &mut web::ServiceConfig) {
    let schema = std::sync::Arc::new(create_schema());
    let context = Context {
        english: Me::new(Language::English).unwrap(),
        norwegian: Me::new(Language::Norwegian).unwrap(),
    };

    config
        .data(schema.clone())
        .data(context)
        .route("/", web::get().to(graphiql))
        .route("/graphql", web::post().to(graphql));
}
