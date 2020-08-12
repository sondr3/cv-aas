let SocialMedia = ./SocialMedia.dhall

let Social
    : Type
    = { kind : SocialMedia, kindName : Text, title : Text, link : Text }

in  Social
