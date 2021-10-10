use async_graphql::{EmptyMutation, EmptySubscription, Schema};
use axum::{
    handler::{get, post},
    http::header::CONTENT_TYPE,
    http::HeaderMap,
    http::StatusCode,
    response::IntoResponse,
    AddExtensionLayer, Router,
};
use cv_aas::{
    graphql::{graphql_handler, graphql_playground, Queries},
    ENGLISH_RESUME, NORWEGIAN_RESUME,
};
use std::{convert::Infallible, net::SocketAddr, time::Duration};
use tower::{BoxError, ServiceBuilder};
use tower_http::{
    compression::CompressionLayer, decompression::DecompressionLayer, trace::TraceLayer,
};

async fn english_resume() -> impl IntoResponse {
    let mut headers = HeaderMap::new();
    headers.insert(CONTENT_TYPE, "application/pdf".parse().unwrap());

    (headers, ENGLISH_RESUME)
}

async fn norwegian_resume() -> impl IntoResponse {
    let mut headers = HeaderMap::new();
    headers.insert(CONTENT_TYPE, "application/pdf".parse().unwrap());

    (headers, NORWEGIAN_RESUME)
}

#[tokio::main]
async fn main() -> Result<(), BoxError> {
    if std::env::var("RUST_LOG").is_err() {
        std::env::set_var("RUST_LOG", "personal_api=debug,tower_http=debug");
    }

    tracing_subscriber::fmt::init();

    let schema = Schema::build(Queries, EmptyMutation, EmptySubscription).finish();

    let app = Router::new()
        .route("/", get(graphql_playground))
        .route("/graphql", post(graphql_handler))
        .route("/norsk", get(norwegian_resume))
        .route("/norwegian", get(norwegian_resume))
        .route("/engelsk", get(english_resume))
        .route("/english", get(english_resume))
        .layer(
            ServiceBuilder::new()
                .timeout(Duration::from_secs(10))
                .layer(TraceLayer::new_for_http())
                .layer(CompressionLayer::new())
                .layer(DecompressionLayer::new())
                .layer(AddExtensionLayer::new(schema))
                .into_inner(),
        )
        .handle_error(|error: BoxError| {
            let result = if error.is::<tower::timeout::error::Elapsed>() {
                Ok(StatusCode::REQUEST_TIMEOUT)
            } else {
                Err((
                    StatusCode::INTERNAL_SERVER_ERROR,
                    format!("Unhandled internal error: {}", error),
                ))
            };

            Ok::<_, Infallible>(result)
        })
        .check_infallible();

    let addr = SocketAddr::from(([0, 0, 0, 0], 8080));
    println!("Listening on http://{}", addr);

    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await?;

    Ok(())
}
