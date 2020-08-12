let P = ./dhall/package.dhall

let socials =
    -- TODO: Add phone/email
      [ { kind = P.SocialMedia.Website
        , name = "Website"
        , link = "https://www.eons.io"
        , title = "eons.io"
        }
      , { kind = P.SocialMedia.GitHub
        , name = "GitHub"
        , link = "https://github.com/sondr3/"
        , title = "sondr3"
        }
      , { kind = P.SocialMedia.LinkedIn
        , name = "LinkedIn"
        , link = "https://www.linkedin.com/in/sondr3/"
        , title = "sondr3"
        }
      ]

in  { socials }
