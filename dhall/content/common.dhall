let P = ../package.dhall

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
        , link = env:MY_EMAIL as Text ? "hello@example.org"
        , title = "Email"
        }
      , phone =
        { kind = P.SocialKind.Phone
        , name = "Phone"
        , link = env:MY_PHONE as Text ? "81549300"
        , title = "Phone"
        }
      }

let languages =
      [ "Rust"
      , "Kotlin"
      , "TypeScript/JavaScript"
      , "Go"
      , "Python"
      , "SQL"
      , "Java"
      , "Haskell"
      , "CSharp"
      ]

let technologies =
      [ "React"
      , "DevOps"
      , "GraphQL"
      , "REST"
      , "Docker"
      , "Linux"
      , "Git"
      , "Kubernetes"
      , "Prometheus"
      , "CSS"
      , "HTML"
      , "styled-components"
      ]

let workflow =
      [ "Domain driven design"
      , "Agile"
      , "Kanban"
      , "GitHub Actions"
      , "CI/CD"
      , "XP"
      ]

let skills = { languages, technologies, workflow }

in  { name, socials, skills }
