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
        [ { position = "Sommerjobb"
          , company = "Capra Consulting"
          , location = "Oslo"
          , start = "Jun 2020"
          , end = Some "Aug 2020"
          , about =
            [ "Full-stack utvikling på AWS med Kotlin/GraphQL og React/TypeScript"
            ]
          }
        , { position = "Juniorutvikler"
          , company = "Sbanken"
          , location = "Bergen"
          , start = "Jan 2019"
          , end = None Text
          , about = [ "Full-stack utvikling i React/JavaScript og C#/.NET" ]
          }
        , { position = "Teaching assistant"
          , company = "Institutt for informatikk"
          , location = "Universitetet i Bergen"
          , start = "Jun 2018"
          , end = Some "Dec 2018"
          , about =
            [ "Holdt kræsjkurs for Tekna og NITO og gjennomgang av ukesoppgaver."
            , "Hjalp studenter med ukesoppgaver, obligatoriske innleveringer og generelle spørsmål om programmering og informatikk."
            ]
          }
        , { position = "Utvikler"
          , company = "Institutt for informatikk"
          , location = "Universitetet i Bergen"
          , start = "Jun 2018"
          , end = Some "Aug 2018"
          , about =
            [ "Utviklet en portal og webapplikasjon i Python 3 og Django for studentene som tar INF100 hvor man kan gjøre, levere og få oppgavene automatisk rettet."
            , "Hadde omkring 500 brukere, kjørte på Google Cloud Platform med Kubernetes."
            ]
          }
        ]
      }

in  { me, headers }
