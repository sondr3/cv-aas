let P = ./../package.dhall

let C = ./common.dhall

let headers = [ "Utdanning", "Erfaring", "Verv" ]

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
      , extracurricular =
        [ { position = "Styremedlem, webmaster"
          , company = "echo karriere"
          , location = "Bergen"
          , start = "2019"
          , end = None Text
          , about =
            [ "Arrangerer en karrieredag for IT-studenter i Bergen hvor 29 bedrifter deltok"
            , "Utvikler en full-stack applikasjon for håndtering av dagen i Kotlin/GraphQL og React/TypeScript"
            , "Utvikler hovednettsiden, echokarriere.no"
            ]
          }
        , { position = "Styremedlem, leder"
          , company = "echo makerspace"
          , location = "Bergen"
          , start = "2018"
          , end = None Text
          , about =
            [ "Grunnleggende styremedlem, ble leder høsten 2019"
            , "Passer på medlemmene og deres bruk av makerspacet og utstyret vårt samt holder arrangementer for studentene"
            ]
          }
        , { position = "Styremedlem"
          , company = "echo"
          , location = "Bergen"
          , start = "2018"
          , end = Some "2019"
          , about =
            [ "Representerte studentenes interesse i programstyret ved informatikk. Programstyret har ansvar for faglig innhold og oppbygging av studiet og for kvaliteten på studieprogrammene."
            ]
          }
        , { position = "Styremedlem"
          , company = "Gnist"
          , location = "Bergen"
          , start = "2018"
          , end = Some "2020"
          , about =
            [ "Hjalp med rekruttering og å beholde studentene som studerer informatikk"
            , "Arrangerte en rekke aktiviteter for studentene; kode- og brettspillkvelder samt kræsjkurs for fag til eksamner"
            ]
          }
        , { position = "Styremedlem"
          , company = "Fagkveld"
          , location = "Bergen"
          , start = "2019"
          , end = Some "2019"
          , about =
            [ "Planla og arrangerte en fagkveld for IT-studenter i Bergen hvor 12 bedrifter deltok"
            , "Oppdaterte og utviklet nettsiden som var skrevet i React/JavaScript og hostet på GitHub Pages"
            ]
          }
        ]
      }

in  { me, headers }
