let P = ./dhall/package.dhall

let me
    : P.Me
    = { name = "Sondre Nilsen"
      , about = "Hello, world!"
      , socials =
        [ { kind = P.SocialMedia.Website, link = "https://www.eons.io" }
        , { kind = P.SocialMedia.GitHub, link = "https://github.com/sondr3/" }
        , { kind = P.SocialMedia.LinkedIn
          , link = "https://www.linkedin.com/in/sondr3/"
          }
        ]
      , education =
        [ { title = "Informatikk: Datateknologi"
          , university = "Universitetet i Bergen"
          , institute = "Institutt for informatikk"
          , degree = "Bachelorgrad"
          , start = 2017
          , end = 2020
          }
        , { title = "Informatikk - algoritmar"
          , university = "Universitetet i Bergen"
          , institute = "Institutt for informatikk"
          , degree = "Mastergrad"
          , start = 2020
          , end = 2022
          }
        ]
      , experience =
        [ { position = "Juniorutvikler"
          , company = "Sbanken"
          , location = "Bergen"
          , start = "Jan 2019"
          , end = None Text
          , about = [ "Full-stack utvikling i React/JavaScript og C#/.NET" ]
          }
        ]
      }

in  me
