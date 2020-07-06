use serde::Deserialize;
use thiserror::Error;

#[derive(Debug, Deserialize, Error)]
pub enum Errors {
    #[error("Language {0} is not valid")]
    InvalidLanguage(String),
    #[error("Could not parse {0}")]
    ParseError(String),
    #[error("Could not find {0}")]
    NotFound(String),
}
