use async_graphql::{EmptyMutation, EmptySubscription, Schema};
use axum::{
    error_handling::HandleErrorLayer,
    http::header::CONTENT_TYPE,
    http::StatusCode,
    response::Headers,
    response::IntoResponse,
    routing::{get, get_service, post},
    AddExtensionLayer, Router,
};
use cv_aas::{
    graphql::{graphql_handler, Queries},
    ENGLISH_RESUME, NORWEGIAN_RESUME,
};
use std::{net::SocketAddr, time::Duration};
use tower::{BoxError, ServiceBuilder};
use tower_http::{
    compression::CompressionLayer, decompression::DecompressionLayer, services::ServeDir,
    trace::TraceLayer,
};

async fn english_resume() -> impl IntoResponse {
    (
        Headers(vec![(CONTENT_TYPE, "application/pdf")]),
        ENGLISH_RESUME,
    )
}

async fn norwegian_resume() -> impl IntoResponse {
    (
        Headers(vec![(CONTENT_TYPE, "application/pdf")]),
        NORWEGIAN_RESUME,
    )
}

async fn handle_errors(err: BoxError) -> impl IntoResponse {
    if err.is::<tower::timeout::error::Elapsed>() {
        (
            StatusCode::REQUEST_TIMEOUT,
            "Request took too long".to_string(),
        )
    } else {
        (
            StatusCode::INTERNAL_SERVER_ERROR,
            format!("Unhandled internal error: {}", err),
        )
    }
}

#[tokio::main]
async fn main() -> Result<(), BoxError> {
    if std::env::var("RUST_LOG").is_err() {
        std::env::set_var("RUST_LOG", "personal_api=debug,tower_http=debug");
    }

    tracing_subscriber::fmt::init();

    let schema = Schema::build(Queries, EmptyMutation, EmptySubscription).finish();

    let app = Router::new()
        .fallback(get_service(ServeDir::new("static")).handle_error(
            |error: std::io::Error| async move {
                (
                    StatusCode::INTERNAL_SERVER_ERROR,
                    format!("Unhandled internal error: {}", error),
                )
            },
        ))
        .route("/graphql", post(graphql_handler))
        .route("/norsk", get(norwegian_resume))
        .route("/norwegian", get(norwegian_resume))
        .route("/engelsk", get(english_resume))
        .route("/english", get(english_resume))
        .layer(TraceLayer::new_for_http())
        .layer(AddExtensionLayer::new(schema))
        .layer(CompressionLayer::new())
        .layer(DecompressionLayer::new())
        .layer(
            ServiceBuilder::new()
                .layer(HandleErrorLayer::new(handle_errors))
                .timeout(Duration::from_secs(10)),
        );

    let addr = SocketAddr::from(([0, 0, 0, 0], 8080));
    println!("Listening on http://{}", addr);

    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await?;

    Ok(())
}
