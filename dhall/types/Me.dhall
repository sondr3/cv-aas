let Social = ./Social.dhall

let Education = ./Education.dhall

let Experience = ./Experience.dhall

let Volunteer = ./Volunteer.dhall

let Project = ./Project.dhall

let Me
    : Type
    = { name : Text
      , about : Text
      , education : List Education
      , experience : List Experience
      , extracurricular : List Experience
      , volunteering : List Volunteer
      , projects : List Project
      , socials : List Social
      }

in  Me
