let Social = ./Social.dhall

let Education = ./Education.dhall

let Experience = ./Experience.dhall

let Volunteer = ./Volunteer.dhall

let Me
    : Type
    = { name : Text
      , about : Text
      , education : List Education
      , experience : List Experience
      , extracurricular : List Experience
      , volunteering : List Volunteer
      , socials : List Social
      }

in  Me
