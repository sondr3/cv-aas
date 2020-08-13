let P = ./../package.dhall

let C = ./common.dhall

let headers = [ "Utdanning", "Erfaring" ]

let me
    : P.Me
    = { name = "Sondre Nilsen"
      , about = "Hello, world!"
      , socials = C.socials
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

in  { me, headers }
