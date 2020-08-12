let P = ./dhall/package.dhall

let C = ./common.dhall

let headers = [ "Education", "Experience" ]

let me
    : P.Me
    = { name = "Sondre Nilsen"
      , about = "Hello, world!"
      , socials = C.socials
      , education =
        [ { title = "Computer Technology"
          , university = "University of Bergen"
          , institute = "Department of Informatics"
          , degree = "Bachelor of Science"
          , start = 2017
          , end = 2020
          }
        , { title = "Informatics - Algorithms"
          , university = "University of Bergen"
          , institute = "Department of Informatics"
          , degree = "Master of Science"
          , start = 2020
          , end = 2022
          }
        ]
      , experience =
        [ { position = "Junior developer"
          , company = "Sbanken"
          , location = "Bergen"
          , start = "Jan 2019"
          , end = None Text
          , about = [ "Full-stack development in React/JavaScript and C#/.NET" ]
          }
        ]
      }

in  { me, headers }
