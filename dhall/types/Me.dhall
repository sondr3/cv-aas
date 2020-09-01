let SocialMedia = ./SocialMedia.dhall

let Education = ./Education.dhall

let Experience = ./Experience.dhall

let Project = ./Project.dhall

let Me
    : Type
    = { name : Text
      , firstName : Text
      , lastName : Text
      , tagline : Text
      , about : Text
      , education : List Education
      , experience : List Experience
      , extracurricular : List Experience
      , volunteering : List Experience
      , projects : List Project
      , socials : SocialMedia
      , skills :
          { languages : List Text
          , technologies : List Text
          , workflow : List Text
          , personal : List Text
          }
      }

in  Me
