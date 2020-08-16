let P = ./../package.dhall

let name = { firstName = "Sondre", lastName = "Nilsen" }

let socials
    : P.SocialMedia
    =
      -- TODO: Add phone/email from environment variables
      { website =
        { kind = P.SocialKind.Website
        , name = "Website"
        , link = "https://www.eons.io"
        , title = "www.eons.io"
        }
      , github =
        { kind = P.SocialKind.GitHub
        , name = "GitHub"
        , link = "https://github.com/sondr3/"
        , title = "sondr3"
        }
      , linkedin =
        { kind = P.SocialKind.LinkedIn
        , name = "LinkedIn"
        , link = "https://www.linkedin.com/in/sondr3/"
        , title = "sondr3"
        }
      , email =
        { kind = P.SocialKind.Email
        , name = "Email"
        , link = "hello@example.org"
        , title = "Email"
        }
      , phone =
        { kind = P.SocialKind.Phone
        , name = "Phone"
        , link = "81549300"
        , title = "Phone"
        }
      }

let languages =
      [ "Rust"
      , "Kotlin"
      , "TypeScript/JavaScript"
      , "Python"
      , "SQL"
      , "Java"
      , "Haskell"
      , "C\\#"
      ]

let technologies =
      [ "React"
      , "CSS"
      , "HTML"
      , "styled-components"
      , "Docker"
      , "Linux"
      , "Git"
      , "DevOps"
      ]

let skills = { languages, technologies }

in  { name, socials, skills }
