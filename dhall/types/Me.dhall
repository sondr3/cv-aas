let Prelude = https://prelude.dhall-lang.org/package.dhall

let SocialMedia = ./SocialMedia.dhall

let Education = ./Education.dhall

let Experience = ./Experience.dhall

let Volunteer = ./Volunteer.dhall

let Project = ./Project.dhall

let Me
    : Type
    = { name : Text
      , firstName : Text
      , lastName : Text
      , tagline : Text
      , about : Text
      , education : { university : Text, degrees : List Education }
      , experience : List Experience
      , extracurricular : List Experience
      , volunteering : List Volunteer
      , projects : List Project
      , socials : SocialMedia
      , skills :
          { languages : List Text
          , technologies : List Text
          , personal : List Text
          }
      }

in  Me
