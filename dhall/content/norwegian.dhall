let Prelude = https://prelude.dhall-lang.org/package.dhall

let P = ./../package.dhall

let C = ./common.dhall

let resume = ./resume.dhall

let language = "norsk"

let headers =
      [ "Utdanning"
      , "Erfaring"
      , "Verv"
      , "Frivillig"
      , "Prosjekter"
      , "Ferdigheter"
      , "Språk"
      , "Teknologier"
      , "Personlig"
      ]

let me
    : P.Me
    = { name = C.name.firstName ++ " " ++ C.name.lastName
      , firstName = C.name.firstName
      , lastName = C.name.lastName
      , tagline = "Hello, world!"
      , about = "Hello, world!"
      , socials = C.socials
      , education =
        [ { university = "Universitetet i Bergen"
          , degrees =
            [ { title = "Informatikk - algoritmer"
              , university = "Universitetet i Bergen"
              , institute = "Institutt for informatikk"
              , degree = "Master"
              , start = 2020
              , end = 2022
              }
            , { title = "Informatikk: Datateknologi"
              , university = "Universitetet i Bergen"
              , institute = "Institutt for informatikk"
              , degree = "Bachelor"
              , start = 2017
              , end = 2020
              }
            ]
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
          , technologies = [ "AWS", "Kotlin", "GraphQL", "React", "TypeScript" ]
          }
        , { position = "Juniorutvikler"
          , company = "Sbanken"
          , location = "Bergen"
          , start = "Jan 2019"
          , end = None Text
          , about = [ "Full-stack utvikling i React/JavaScript og CSharp/.NET" ]
          , technologies = [ "AWS", "Kotlin", "GraphQL", "React", "TypeScript" ]
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
          , technologies = [ "Python" ]
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
          , technologies = [ "Python", "Django", "Google Cloud Playform" ]
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
          , technologies = [ "Kotlin", "GraphQL", "React", "TypeScript" ]
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
          , technologies = Prelude.List.empty Text
          }
        , { position = "Styremedlem"
          , company = "echo"
          , location = "Bergen"
          , start = "2018"
          , end = Some "2019"
          , about =
            [ "Representerte studentenes interesse i programstyret ved informatikk. Programstyret har ansvar for faglig innhold og oppbygging av studiet og for kvaliteten på studieprogrammene."
            ]
          , technologies = Prelude.List.empty Text
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
          , technologies = Prelude.List.empty Text
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
          , technologies = [ "React", "JavaScript", "GitHub Pages" ]
          }
        ]
      , volunteering =
        [ { position = "Frivillig"
          , company = "JavaZone"
          , location = "Oslo"
          , start = "2019"
          , end = Some ""
          , about = [ "Hjalp arrangementet med å gå bra" ]
          , technologies = Prelude.List.empty Text
          }
        , { position = "Frivillig"
          , company = "Booster"
          , location = "Bergen"
          , start = "2019"
          , end = Some ""
          , about = [ "Hjalp arrangementet med å gå bra" ]
          , technologies = Prelude.List.empty Text
          }
        ]
      , projects =
        [ { name = "git-ignore"
          , technologies = [ "Rust", "Git" ]
          , about =
              "Hent og list tilgjengelige maler for .gitignore fra APIet til gitignore.io. Alle maler blir cachet lokalt og programmet fungerer på Windows, macOS og Linux."
          }
        , { name = "git-anger-management"
          , technologies = [ "Rust", "Git" ]
          , about =
              "Har du noensinne lurt på hvor sinna du eller dine kolleger er i sine commitmeldinger? Dette programmet teller og viser banneordene og forfatteren deres."
          }
        ]
      , skills =
            C.skills
          ⫽ { personal =
              [ "Pianist"
              , "brettspillentusiast"
              , "semi-entusiastisk jogger"
              , "sertifisert dykker"
              , "stickersamler"
              ]
            }
      }

in  { me, language, headers, resume = resume me headers }
