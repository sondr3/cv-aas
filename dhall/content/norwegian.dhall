let Prelude =
      https://prelude.dhall-lang.org/package.dhall
        sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871

let P = ../package.dhall

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
      , tagline = "Seniorkonsulent @ Sonat | Fullstackutvikler"
      , about =
          "Jeg er en lidenskapelig og dreven fullstackutvikler med et stort hjerte for fri og åpen kildekode og sterkt typede programmeringsspråk. Seniorkonsulent hos Sonat med en mastergrad innen algoritmer fra UiB. Hobbyprosjektfanatiker og har alltid ett for mye prosjekt gående samtidig. På fritiden koser jeg meg med å løpe langt, lange kvelder med brettspill, surdeigsbrød og fermentering og en god øl."
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
        [ { position = "Seniorkonsulent"
          , company = "Sonat Bergen"
          , location = "Bergen"
          , start = "Jul 2022"
          , end = None Text
          , about =
            [ "Utviklet webapplikasjon for studenter på barneskolen for matte"
            , "Fullstackutvikling, infrastruktur og drift av applikasjoner"
            , "Rådgivning for nyutvikling og modernisering av eksisterende systemer"
            ]
          , technologies =
            [ "Python"
            , "C\\#"
            , "TypeScript"
            , "Azure"
            , "Pulumi"
            , "IaC"
            , "Docker"
            , "CI"
            ]
          }
        , { position = "Sommerjobb"
          , company = "NAV IT, NAIS"
          , location = "Oslo"
          , start = "Jun 2021"
          , end = Some "Aug 2021"
          , about =
            [ "Utviklet en løsning for å holde Kubernetesklustre ryddige fra feilende applikasjoner"
            , "Plattformløsning skrevet i Go, hvor vi brukte Kubernetes, InfluxDB, Prometheus m.m."
            , "Ga en hjelpende hånd til NAIS på prosjekter som trengte erfaring med frontend"
            ]
          , technologies = [ "Go", "Kubernetes", "Prometheus", "Google Cloud" ]
          }
        , { position = "Utvikler, deltid"
          , company = "IslandGarden"
          , location = "Bergen"
          , start = "Okt 2020"
          , end = Some "Jun 2022"
          , about =
            [ "Fullstackutvikling med React og Firebase på flere prosjekter"
            , "Utviklet og rådgivning for kunder til utvikling av løsningene deres, fra design til implementasjon"
            ]
          , technologies = [ "TypeScript", "React", "Firebase", "GitHub" ]
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
            [ "C\\#", "REST", "React", "TypeScript", "JavaScript" ]
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
          , technologies = [ "Python", "Django", "Google Cloud" ]
          }
        ]
      , extracurricular =
        [ { position = "Styremedlem, webmaster"
          , company = "echo karriere (ITxBergen)"
          , location = "Bergen"
          , start = "2019"
          , end = Some "2021"
          , about =
            [ "echo karriere (ITxBergen) er studentorganisasjonen som drifter karrieredagen for IT-studenter i Bergen"
            , "Prosjektleder for utviklingsgruppen hvor jeg leder 6+ studenter i utviklingen av løsningene våre"
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
          , end = Some "2021"
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
        [ { name = "echo karriere (ITxBergen)"
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
              "GitHub-organisasjonen for echo karriere (nå ITxBergen) hvor nettsiden, fullstackløsningen og dokumentasjonssiden lever."
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
          ⫽ { workflow =
                  C.skills.workflow
                # [ "prosjektledelse", "par/mobprogrammering" ]
            , personal =
              [ "Pianist"
              , "brettspillentusiast"
              , "semi-entusiastisk jogger"
              , "sertifisert dykker"
              , "surdeigsbaker"
              ]
            }
      }

in  { me, language, headers, resume = resume me language headers }
