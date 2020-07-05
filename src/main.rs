use actix_web::{middleware, web, App, Error, HttpResponse, HttpServer};
use juniper::graphiql::graphiql_source;
use juniper::http::GraphQLRequest;
use juniper::{FieldResult, GraphQLEnum, GraphQLInputObject, GraphQLObject, RootNode};
use std::io;
use std::sync::Arc;

#[derive(GraphQLObject)]
#[graphql(description = "About a person")]
struct Person {
    id: i32,
    name: String,
    age: i32,
    description: String,
}

pub struct QueryRoot;

#[juniper::object]
impl QueryRoot {
    fn person(id: i32) -> FieldResult<Person> {
        Ok(Person {
            id: id,
            name: "Sondre Nilsen".to_string(),
            age: 28,
            description: "Hello, world!".to_string(),
        })
    }
}

pub struct MutationRoot;

#[juniper::object]
impl MutationRoot {}

pub type Schema = RootNode<'static, QueryRoot, MutationRoot>;

pub fn create_schema() -> Schema {
    Schema::new(QueryRoot {}, MutationRoot {})
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
    std::env::set_var("RUST_LOG", "actix_web=info");
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
    .bind("127.0.0.1:8080")?
    .run()
    .await
}
