use crate::{errors::Errors, read_language_configuration};
use juniper::{GraphQLEnum, GraphQLObject};
use serde::Deserialize;

#[derive(Debug, GraphQLEnum)]
#[graphql(name = "Languages", description = "Languages my CV exist in")]
pub enum Language {
    Norwegian,
    English,
}

#[derive(Debug, Deserialize, GraphQLEnum, Clone, PartialEq)]
#[graphql(description = "Social media I am on")]
pub enum SocialMedia {
    #[graphql(name = "LINKEDIN")]
    LinkedIn,
    #[graphql(name = "GITHUB")]
    GitHub,
    Website,
    Email,
    Phone,
}

#[derive(Debug, Deserialize, GraphQLObject, Clone)]
#[graphql(description = "Social media")]
pub struct Social {
    kind: SocialMedia,
    link: String,
}

#[derive(Debug, Deserialize, GraphQLObject, Clone)]
#[graphql(description = "Education")]
pub struct Education {
    title: String,
    university: String,
    institute: String,
    degree: String,
    start: i32,
    end: i32,
}

#[derive(Debug, Deserialize, GraphQLObject, Clone)]
#[graphql(description = "About me")]
pub struct Me {
    name: String,
    about: String,
    socials: Vec<Social>,
    education: Vec<Education>,
}

impl Me {
    pub fn new(language: Language) -> Result<Self, Errors> {
        match language {
            Language::Norwegian => read_language_configuration("norwegian"),
            Language::English => read_language_configuration("english"),
        }
    }

    pub fn social_media(&self, kind: &SocialMedia) -> &Social {
        self.socials
            .iter()
            .find(|e| e.kind == *kind)
            .expect("This should not fail")
    }
}
