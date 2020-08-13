let SocialMedia = ./SocialMedia.dhall

let Social
    : Type
    = { kind : SocialMedia, name : Text, title : Text, link : Text }

in  Social
