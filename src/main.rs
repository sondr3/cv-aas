use actix_web::{middleware, App, HttpServer};
use cv_aas::graphql;
use std::io;

#[actix_rt::main]
async fn main() -> io::Result<()> {
    std::env::set_var("RUST_LOG", "actix_web=debug");
    env_logger::init();

    println!("Starting server on http://0.0.0.0:8080");

    // Start http server
    HttpServer::new(move || {
        App::new()
            .wrap(middleware::Logger::default())
            .configure(graphql::register)
    })
    .bind("0.0.0.0:8080")?
    .run()
    .await
}
