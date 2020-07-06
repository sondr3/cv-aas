use crate::errors::Errors;
use crate::models::{Language, Me};

pub mod errors;
pub mod graphql;
pub mod models;

static ENGLISH_JSON: &str = include_str!("../english.json");
static NORWEGIAN_JSON: &str = include_str!("../norwegian.json");

pub fn read_language_configuration(language: &Language) -> Result<Me, Errors> {
    match language {
        Language::English => Ok(serde_json::from_str(ENGLISH_JSON).unwrap()),
        Language::Norwegian => Ok(serde_json::from_str(NORWEGIAN_JSON).unwrap()),
    }
}
