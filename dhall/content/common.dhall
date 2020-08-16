let P = ./../package.dhall

let name = { firstName = "Sondre", lastName = "Nilsen" }

let socials
    : P.SocialMedia
    =
      -- TODO: Add phone/email from environment variables
      { website =
        { name = "Website", link = "https://www.eons.io", title = "eons.io" }
      , github =
        { name = "GitHub"
        , link = "https://github.com/sondr3/"
        , title = "sondr3"
        }
      , linkedin =
        { name = "LinkedIn"
        , link = "https://www.linkedin.com/in/sondr3/"
        , title = "sondr3"
        }
      , email = { name = "Email", link = "hello@example.org", title = "Email" }
      , phone = { name = "Phone", link = "81549300", title = "Phone" }
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
