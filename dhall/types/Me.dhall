let Social = ./Social.dhall

let Education = ./Education.dhall

let Experience = ./Experience.dhall

let Me
    : Type
    = { name : Text
      , about : Text
      , education : List Education
      , experience : List Experience
      , extracurricular : List Experience
      , socials : List Social
      }

in  Me
