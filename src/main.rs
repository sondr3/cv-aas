use actix_web::{middleware, App, HttpServer};
use cv_aas::graphql;
use cv_aas::{get_full_url, get_url, graphql, ENGLISH_RESUME, NORWEGIAN_RESUME};
use dotenv::dotenv;
use std::io;

#[actix_rt::main]
async fn main() -> io::Result<()> {
    dotenv().ok();
    std::env::set_var("RUST_LOG", "actix_web=debug");
    env_logger::init();

    println!("Starting server on {}", get_full_url());

    // Start http server
    HttpServer::new(move || {
        App::new()
            .wrap(middleware::Logger::default())
            .configure(graphql::register)
    })
    .bind(get_url())?
    .run()
    .await
}
