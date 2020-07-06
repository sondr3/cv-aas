let Social = ./Social.dhall

let Me
    : Type
    = { name : Text, about : Text, socials : List Social }

in  Me
