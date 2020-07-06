let Social = ./Social.dhall

let Education = ./Education.dhall

let Me
    : Type
    = { name : Text
      , about : Text
      , socials : List Social
      , education : List Education
      }

in  Me
