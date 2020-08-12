let SocialMedia = ./SocialMedia.dhall

let Social
    : Type
    = { kind : SocialMedia, kindName : Text, link : Text }

in  Social
