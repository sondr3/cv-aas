use actix_web::{middleware, web, App, HttpResponse, HttpServer, Result};
use cv_aas::{get_full_url, get_url, graphql, ENGLISH_RESUME, NORWEGIAN_RESUME};
use std::io;

async fn english_resume() -> Result<HttpResponse> {
    Ok(HttpResponse::Ok()
        .content_type("application/pdf")
        .body(ENGLISH_RESUME))
}

async fn norwegian_resume() -> Result<HttpResponse> {
    Ok(HttpResponse::Ok()
        .content_type("application/pdf")
        .body(NORWEGIAN_RESUME))
}

#[actix_rt::main]
async fn main() -> io::Result<()> {
    std::env::set_var("RUST_LOG", "actix_web=debug");
    env_logger::init();

    println!("Starting server on {}", get_full_url());

    // Start http server
    HttpServer::new(move || {
        App::new()
            .wrap(middleware::Logger::default())
            .configure(graphql::register)
            .route("/english", web::get().to(english_resume))
            .route("/engelsk", web::get().to(english_resume))
            .route("/norwegian", web::get().to(norwegian_resume))
            .route("/norsk", web::get().to(norwegian_resume))
    })
    .bind(get_url())?
    .run()
    .await
}
