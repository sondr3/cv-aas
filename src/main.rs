use actix_web::{middleware, web, App, Error, HttpResponse, HttpServer};
use juniper::{
    graphiql::graphiql_source, http::GraphQLRequest, EmptyMutation, FieldResult, GraphQLEnum,
    GraphQLInputObject, GraphQLObject, RootNode,
};
use serde::Deserialize;
use std::{io, sync::Arc};

#[derive(Debug, Deserialize, GraphQLObject)]
#[graphql(description = "About me")]
struct Me {
    name: String,
    age: i32,
    about: String,
}

impl Me {
    fn new() -> Self {
        return serde_dhall::from_file("common.dhall").parse().unwrap();
    }
}

pub struct QueryRoot;

#[juniper::object]
impl QueryRoot {
    fn me() -> FieldResult<Me> {
        Ok(Me::new())
    }
}

pub type Schema = RootNode<'static, QueryRoot, EmptyMutation<()>>;

pub fn create_schema() -> Schema {
    Schema::new(QueryRoot {}, EmptyMutation::<()>::new())
}

async fn graphiql() -> HttpResponse {
    let html = graphiql_source("http://127.0.0.1:8080/graphql");
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
