let Prelude =
      https://prelude.dhall-lang.org/package.dhall sha256:2086c6a2e7ce8ee371858036ab60d24d045969defadb4bc9d87639921ec2e028

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
      , "Prosess"
      , "Personlig"
      ]

let me
    : P.Me
    = { name = C.name.firstName ++ " " ++ C.name.lastName
      , firstName = C.name.firstName
      , lastName = C.name.lastName
      , tagline = "Algoritmer @ UiB | Fullstackutvikler"
      , about =
          "Jeg er en lidenskapelig og dreven fullstackutvikler med et stort hjerte for fri og åpen kildekode og sterkt typede programmeringsspråk. Masterstudent innen algoritmer ved UiB og deltidsutvikler hos Sbanken. Hobbyprosjektfanatiker og har alltid ett for mye prosjekt gående samtidig. Jeg brenner for studentmiljøet på informatikk og er svært aktiv i verv og studentprosjekter. På fritiden koser jeg meg med å løpe langt, lange kvelder med brettspill og en god øl."
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
        [ { position = "Utvikler, deltid"
          , company = "IslandGarden"
          , location = "Bergen"
          , start = "Okt 2020"
          , end = None Text
          , about =
            [ "Jobber med fullstackutvikling med React og Firebase på flere prosjekter"
            ]
          , technologies = [ "TypeScript", "React", "Firebase" ]
          }
        , { position = "Sommerjobb"
          , company = "Capra Consulting"
          , location = "Oslo"
          , start = "Jun 2020"
          , end = Some "Aug 2020"
          , about =
            [ "Utviklet en e-læringsplatform for medisinstudenter ved UiO"
            , "Fullstackutvikling med domain driven design og trunk based development"
            ]
          , technologies =
            [ "AWS"
            , "Kotlin"
            , "http4k"
            , "GraphQL"
            , "PostgreSQL"
            , "React"
            , "TypeScript"
            , "Docker"
            , "Domain driven design"
            ]
          }
        , { position = "Utvikler, deltid"
          , company = "Sbanken"
          , location = "Bergen"
          , start = "Jan 2019"
          , end = Some "Okt 2020"
          , about =
            [ "Jobbet på landingssiden i mobilapplikasjonen på både Android og iOS"
            , "Utviklet og vedlikeholdt REST APIer i .NET som brukes av flere React webapplikasjoner"
            ]
          , technologies =
            [ "CSharp", "REST", "React", "TypeScript", "JavaScript" ]
          }
        , { position = "Gruppeleder INF100"
          , company = "Institutt for informatikk"
          , location = "Universitetet i Bergen"
          , start = "Jun 2018"
          , end = Some "Dec 2018"
          , about =
            [ "Holdt kræsjkurs for Tekna og NITO før eksamen og forelesinger hvor jeg gikk gjennom ukesoppgaver"
            , "Hjalp studenter med ukesoppgaver, obligatoriske innleveringer og generelle spørsmål om programmering og informatikk"
            ]
          , technologies = [ "Python" ]
          }
        , { position = "Utvikler"
          , company = "Institutt for informatikk"
          , location = "Universitetet i Bergen"
          , start = "Jun 2018"
          , end = Some "Aug 2018"
          , about =
            [ "Utviklet en portal og webapplikasjon for studentene som tar INF100 hvor studentene kunne jobbe på, levere og automatisk få rettet oppgaver"
            , "Hadde ~500 brukere og kjørte på Google Cloud Platform med Kubernetes"
            ]
          , technologies = [ "Python", "Django", "Google Cloud Platform" ]
          }
        ]
      , extracurricular =
        [ { position = "Styremedlem, webmaster"
          , company = "echo karriere"
          , location = "Bergen"
          , start = "2019"
          , end = None Text
          , about =
            [ "echo karriere er studentorganisasjonen som drifter karrieredagen for IT-studenter i Bergen"
            , "Prosjektleder for utviklingsgruppen hvor jeg leder 6+ studenter i utviklingen av løsningene våre"
            , "Utvikler en fullstackløsning for håndtering av dagen samt hovednettsiden vår"
            ]
          , technologies =
            [ "Kotlin"
            , "Ktor"
            , "GraphQL"
            , "PostgreSQL"
            , "React"
            , "TypeScript"
            , "Docker"
            ]
          }
        , { position = "Styremedlem, leder"
          , company = "echo makerspace"
          , location = "Bergen"
          , start = "2018"
          , end = None Text
          , about =
            [ "Grunnleggende styremedlem gjennom mitt engasjenment i echo, ble leder høsten 2019"
            , "Sørger for at vi har utstyret vi trenger, nye medlemmer blir tatt godt i mot og arrangementene vi holder"
            ]
          , technologies = Prelude.List.empty Text
          }
        , { position = "Styremedlem"
          , company = "echo"
          , location = "Bergen"
          , start = "2018"
          , end = Some "2019"
          , about =
            [ "Representerte studentenes interesse i programstyret ved informatikk. Programstyret har ansvar for faglig innhold og oppbygging av studiet og for kvaliteten på studieprogrammene"
            ]
          , technologies = Prelude.List.empty Text
          }
        , { position = "Styremedlem"
          , company = "Gnist"
          , location = "Bergen"
          , start = "2018"
          , end = Some "2020"
          , about =
            [ "Arrangerte Informatikkdagen hvor vi inviterte alle VGS-studenter i Bergen med interesse for informatikk"
            , "Arrangerte aktiviteter for studentene; kode- og brettspillkvelder og kræsjkurs for fag til eksamner"
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
          , about =
            [ "Hjalp foredragsholdere med opprigg og neddrigg, telte oppmøtte og ryddet mellom foredrag"
            , "Satt i informasjonsskranken hvor jeg hjalp deltakere med alle deres spørsmål"
            ]
          , technologies = Prelude.List.empty Text
          }
        , { position = "Frivillig"
          , company = "Booster"
          , location = "Bergen"
          , start = "2019"
          , end = Some ""
          , about =
            [ "Hjalp med opprigg og nedrigg av workshops og foredrag"
            , "Hjalp deltakere på Booster Kids med programmering og Arduino"
            ]
          , technologies = Prelude.List.empty Text
          }
        ]
      , projects =
        [ { name = "echo karriere"
          , technologies =
            [ "Kotlin"
            , "Ktor"
            , "GraphQL"
            , "PostgreSQL"
            , "React"
            , "TypeScript"
            , "Docker"
            ]
          , about =
              "GitHub-organisasjonen for echo karriere hvor nettsiden, fullstackløsningen og dokumentasjonssiden lever."
          , github =
            { kind = P.SocialKind.GitHub
            , name = "GitHub"
            , link = "https://github.com/echo-karriere"
            , title = "echo-karriere"
            }
          , website = Some
            { kind = P.SocialKind.Website
            , name = "echo karriere"
            , link = "https://www.echokarriere.no/"
            , title = "echo karriere"
            }
          , website2 = Some
            { kind = P.SocialKind.Website
            , name = "echo karriere"
            , link = "https://docs.echokarriere.no/"
            , title = "echo karriere docs"
            }
          }
        , { name = "git-ignore"
          , technologies = [ "Rust", "Git", "GitHub Actions" ]
          , about =
              "Hent og list tilgjengelige maler for .gitignore fra APIet til gitignore.io. Alle maler blir cachet lokalt og programmet fungerer på Windows, macOS og Linux. Blir automatisk bygd og publisert på GitHub."
          , github =
            { kind = P.SocialKind.GitHub
            , name = "GitHub"
            , link = "https://github.com/sondr3/git-ignore"
            , title = "sondr3/git-ignore"
            }
          , website = None P.Social
          , website2 = None P.Social
          }
        , { name = "git-anger-management"
          , technologies = [ "Rust", "Git", "GitHub Actions" ]
          , about =
              "Har du noensinne lurt på hvor sinna du eller dine kolleger er i sine commitmeldinger? Eller hvor frekk historikken til et prosjekt er? Dette programmet teller og viser banneordene og forfatteren deres. Blir også automatisk bygd og publisert på GitHub."
          , github =
            { kind = P.SocialKind.GitHub
            , name = "GitHub"
            , link = "https://github.com/sondr3/git-anger-management"
            , title = "sondr3/git-anger-management"
            }
          , website = None P.Social
          , website2 = None P.Social
          }
        , { name = "Frontendkonfigurasjon"
          , technologies =
            [ "ESLint", "Prettier", "Renovate", "Stylelint", "TypeScript" ]
          , about =
              "Monorepo med automatisk publisering av pakker for konfigurering av populære frontendverktøy som ESLint og Prettier."
          , github =
            { kind = P.SocialKind.GitHub
            , name = "GitHub"
            , link = "https://github.com/sondr3/frontend-config"
            , title = "sondr3/frontend-config"
            }
          , website = Some
            { kind = P.SocialKind.Website
            , name = "npm"
            , link = "https://www.npmjs.com/~sondr3"
            , title = "npmjs/sondr3"
            }
          , website2 = None P.Social
          }
        , { name = "CV-aaS"
          , technologies =
            [ "Rust", "GraphQL", "Dhall", "LaTeX", "Docker", "GitHub Actions" ]
          , about =
              "Min CV-as-a-Service med sitt eget GraphQL API som også genererer denne CVen på både engelsk og norsk."
          , github =
            { kind = P.SocialKind.GitHub
            , name = "GitHub"
            , link = "https://github.com/sondr3/cv-aas"
            , title = "sondr3/cv-aas"
            }
          , website = Some
            { kind = P.SocialKind.Website
            , name = "Website"
            , link = "https://cv.eons.io/"
            , title = "cv.eons.io"
            }
          , website2 = None P.Social
          }
        , { name = "Lesesalen"
          , technologies =
            [ "TypeScript"
            , "React"
            , "Gatsby"
            , "styled-components"
            , "Discord"
            , "Docker"
            ]
          , about =
              "GitHub-organisasjonen for studenter av studenter ved informatikk på UiB. Vi har samlet og utviklet to nettsider og en Discord-bot for serveren jeg startet for informatikkstudenter."
          , github =
            { kind = P.SocialKind.GitHub
            , name = "GitHub"
            , link = "https://github.com/lesesalen"
            , title = "lesesalen"
            }
          , website = Some
            { kind = P.SocialKind.Website
            , name = "Website"
            , link = "https://gummiand.no/"
            , title = "gummiand.no"
            }
          , website2 = Some
            { kind = P.SocialKind.Website
            , name = "Website"
            , link = "https://lesesalen.com/"
            , title = "lesesalen.com"
            }
          }
        , { name = "MOCCA Operational Controller for Coffee Availability"
          , technologies = [ "JavaScript", "React", "Python", "Arduino", "IoT" ]
          , about =
              "'Er det kaffe igjen?' er et veldig vanlig spørsmål for en student, en kamerat og jeg lagde en IoT-platform med kamera, temperatur- og strømsensor for å svare på spørsmålet om hvor mye og hvor fersk kaffen er."
          , github =
            { kind = P.SocialKind.GitHub
            , name = "GitHub"
            , link = "https://github.com/inf219-mocca"
            , title = "inf219-mocca"
            }
          , website = None P.Social
          , website2 = None P.Social
          }
        ]
      , skills =
            C.skills
          ⫽ { workflow = C.skills.workflow # [ "prosjektledelse" ]
            , personal =
              [ "Pianist"
              , "brettspillentusiast"
              , "semi-entusiastisk jogger"
              , "sertifisert dykker"
              , "stickersamler"
              ]
            }
      }

in  { me, language, headers, resume = resume me language headers }
