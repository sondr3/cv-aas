use crate::{
    get_full_url,
    graphiql::graphiql_source,
    models::{Language, Me, Social, SocialMedia},
};
use async_graphql::{EmptyMutation, EmptySubscription, Object, Schema};
use async_graphql_axum::{GraphQLRequest, GraphQLResponse};
use axum::{extract::Extension, response, response::IntoResponse};

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

type CVSchema = Schema<Queries, EmptyMutation, EmptySubscription>;

pub async fn graphql_handler(schema: Extension<CVSchema>, req: GraphQLRequest) -> GraphQLResponse {
    schema.execute(req.into_inner()).await.into()
}

pub async fn graphql_playground() -> impl IntoResponse {
    response::Html(graphiql_source("/graphql"))
}
