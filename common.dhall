let SocialMedia
    : Type
    = < LinkedIn | GitHub | Website | Email | Phone >

let Social
    : Type
    = { kind : SocialMedia, link : Text }

let Me
    : Type
    = { name : Text, about : Text, socials : List Social }

let me
    : Me
    = { name = "Sondre Nilsen"
      , about = "Hello, world!"
      , socials =
        [ { kind = SocialMedia.Website, link = "https://www.eons.io" }
        , { kind = SocialMedia.LinkedIn
          , link = "https://www.linkedin.com/in/sondr3/"
          }
        ]
      }

in  me
