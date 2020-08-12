let P = ./dhall/package.dhall

let socials =
      [ { kind = P.SocialMedia.Website
        , kindName = "website"
        , link = "https://www.eons.io"
        , title = "eons.io"
        }
      , { kind = P.SocialMedia.GitHub
        , kindName = "github"
        , link = "https://github.com/sondr3/"
        , title = "sondr3"
        }
      , { kind = P.SocialMedia.LinkedIn
        , kindName = "linkedin"
        , link = "https://www.linkedin.com/in/sondr3/"
        , title = "sondr3"
        }
      ]

in  { socials }
