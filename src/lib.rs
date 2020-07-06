use crate::errors::Errors;
use crate::models::Me;

pub mod errors;
pub mod graphql;
pub mod models;

pub fn read_language_configuration(language: &str) -> Result<Me, Errors> {
    match serde_dhall::from_file(&format!("{}.dhall", language)).parse() {
        Ok(file) => Ok(file),
        Err(..) => Err(Errors::ParseError(format!("{}.dhall", language))),
    }
}
