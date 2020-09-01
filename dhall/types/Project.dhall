let Social = ./Social.dhall

let Project
    : Type
    = { name : Text
      , technologies : List Text
      , about : Text
      , github : Social
      , website : Optional Social
      , website2 : Optional Social
      }

in  Project
