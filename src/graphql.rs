use crate::get_full_url;
use crate::graphiql::graphiql_source;
use crate::models::{Language, Me, Social, SocialMedia};
use actix_web::{web, HttpResponse};
use async_graphql::{EmptyMutation, EmptySubscription, Object, Schema};
use async_graphql_actix_web::{Request, Response};

pub struct Queries;

#[Object]
impl Queries {
    async fn hello(&self, language: Language) -> String {
        match language {
            Language::English => "Hello! Welcome to my CV-as-a-service!".to_string(),
            Language::Norwegian => "Hei! Velkommen til min CV-as-a-service!".to_string(),
        }
    }

    async fn me(&self, language: Language) -> async_graphql::Result<Me> {
        Ok(Me::new(language)?)
    }

    async fn social_media(&self, kind: SocialMedia) -> Social {
        let me = Me::new(Language::English).unwrap();
        me.social_media(&kind).to_owned()
    }

    async fn resume(&self, language: Language) -> String {
        match language {
            Language::English => format!("{}/english", get_full_url()),
            Language::Norwegian => format!("{}/norwegian", get_full_url()),
        }
    }
}

async fn graphiql() -> HttpResponse {
    let html = graphiql_source(&format!("{}/graphql", get_full_url()));
    HttpResponse::Ok()
        .content_type("text/html; charset=utf-8")
        .body(html)
}

type CVSchema = Schema<Queries, EmptyMutation, EmptySubscription>;

async fn graphql(schema: web::Data<CVSchema>, req: Request) -> Response {
    schema.execute(req.into_inner()).await.into()
}

pub fn register(config: &mut web::ServiceConfig) {
    let schema = Schema::build(Queries, EmptyMutation, EmptySubscription).finish();
    config
        .data(schema)
        .route("/", web::get().to(graphiql))
        .route("/graphql", web::post().to(graphql));
}
