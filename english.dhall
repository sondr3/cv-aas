let P = ./dhall/package.dhall

let me
    : P.Me
    = { name = "Sondre Nilsen"
      , about = "Hello, world!"
      , socials =
        [ { kind = P.SocialMedia.Website, link = "https://www.eons.io" }
        , { kind = P.SocialMedia.LinkedIn
          , link = "https://www.linkedin.com/in/sondr3/"
          }
        ]
      }

in  me
