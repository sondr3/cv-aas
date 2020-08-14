use crate::errors::Errors;
use crate::models::{Language, Me};
use std::env;

pub mod errors;
pub mod graphiql;
pub mod graphql;
pub mod models;

static ENGLISH_JSON: &str = include_str!("../data/english.json");
static NORWEGIAN_JSON: &str = include_str!("../data/norwegian.json");

pub static ENGLISH_RESUME: &[u8] = include_bytes!("../data/english.pdf");
pub static NORWEGIAN_RESUME: &[u8] = include_bytes!("../data/norwegian.pdf");

pub fn get_url() -> String {
    env::var("URL").map_or("127.0.0.1:8080".to_string(), |s| s)
}

pub fn get_full_url() -> String {
    env::var("FULL_URL").map_or("http://127.0.0.1:8080".to_string(), |s| s)
}

pub fn read_language_configuration(language: &Language) -> Result<Me, Errors> {
    match language {
        Language::English => Ok(serde_json::from_str(ENGLISH_JSON).unwrap()),
        Language::Norwegian => Ok(serde_json::from_str(NORWEGIAN_JSON).unwrap()),
    }
}
