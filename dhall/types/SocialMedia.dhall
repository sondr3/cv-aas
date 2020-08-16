let Social = ./Social.dhall

let SocialMedia
    : Type
    = { linkedin : Social
      , github : Social
      , website : Social
      , email : Social
      , phone : Social
      }

in  SocialMedia
