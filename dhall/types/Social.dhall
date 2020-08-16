let SocialKind = ./SocialKind.dhall

let Social
    : Type
    = { kind : SocialKind, name : Text, title : Text, link : Text }

in  Social
