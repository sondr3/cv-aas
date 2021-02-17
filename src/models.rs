use crate::{errors::Errors, read_language_configuration};
use async_graphql::*;
use serde::Deserialize;

#[derive(Debug, Enum, Eq, PartialEq, Description, Clone, Copy)]
#[graphql(name = "Languages")]
/// Languages my CV exist in
pub enum Language {
    Norwegian,
    English,
}

#[derive(Debug, Deserialize, Enum, Description, Clone, PartialEq, Eq, Copy)]
/// Social media I am on
pub enum SocialMedia {
    #[graphql(name = "LINKEDIN")]
    LinkedIn,
    #[graphql(name = "GITHUB")]
    GitHub,
    Website,
    Email,
    Phone,
}

#[derive(Debug, Deserialize, SimpleObject, Description, Clone)]
/// Social media information
pub struct Socials {
    website: Social,
    email: Social,
    phone: Social,
    linkedin: Social,
    github: Social,
}

#[derive(Debug, Deserialize, SimpleObject, Description, Clone)]
/// Social media
pub struct Social {
    kind: SocialMedia,
    name: String,
    link: String,
    title: String,
}

#[derive(Debug, Deserialize, SimpleObject, Description, Clone)]
/// Education
pub struct Education {
    university: String,
    degrees: Vec<Degree>,
}

#[derive(Debug, Deserialize, SimpleObject, Description, Clone)]
/// Degree
pub struct Degree {
    title: String,
    university: String,
    institute: String,
    degree: String,
    start: i32,
    end: i32,
}

#[derive(Debug, Deserialize, SimpleObject, Description, Clone)]
/// Experience
pub struct Experience {
    position: String,
    company: String,
    location: String,
    start: String,
    end: Option<String>,
    about: Vec<String>,
    technologies: Vec<String>,
}

#[derive(Debug, Deserialize, SimpleObject, Description, Clone)]
/// Projects I've made/worked on
pub struct Project {
    name: String,
    technologies: Vec<String>,
    about: String,
    github: Social,
    website: Option<Social>,
    website2: Option<Social>,
}

#[derive(Debug, Deserialize, SimpleObject, Description, Clone)]
/// Personal skills
pub struct Skills {
    languages: Vec<String>,
    technologies: Vec<String>,
    workflow: Vec<String>,
    personal: Vec<String>,
}

#[derive(Debug, Deserialize, SimpleObject, Description, Clone)]
/// About me
pub struct Me {
    name: String,
    tagline: String,
    about: String,
    socials: Socials,
    education: Vec<Education>,
    experience: Vec<Experience>,
    extracurricular: Vec<Experience>,
    volunteering: Vec<Experience>,
    projects: Vec<Project>,
    skills: Skills,
}

impl Me {
    pub fn new(language: Language) -> Result<Self, Errors> {
        match language {
            Language::Norwegian => read_language_configuration(&language),
            Language::English => read_language_configuration(&language),
        }
    }

    pub fn social_media(&self, kind: &SocialMedia) -> &Social {
        match kind {
            SocialMedia::LinkedIn => &self.socials.linkedin,
            SocialMedia::GitHub => &self.socials.github,
            SocialMedia::Website => &self.socials.website,
            SocialMedia::Email => &self.socials.email,
            SocialMedia::Phone => &self.socials.phone,
        }
    }
}
