let Prelude =
      https://prelude.dhall-lang.org/package.dhall sha256:a6036bc38d883450598d1de7c98ead113196fe2db02e9733855668b18096f07b

let P = ../package.dhall

let C = ./common.dhall

let resume = ./resume.dhall

let language = "english"

let headers =
      [ "Education"
      , "Experience"
      , "Extracurricular"
      , "Volunteering"
      , "Projects"
      , "Skills"
      , "Languages"
      , "Technologies"
      , "Workflow"
      , "Personal"
      ]

let me
    : P.Me
    = { name = C.name.firstName ++ " " ++ C.name.lastName
      , firstName = C.name.firstName
      , lastName = C.name.lastName
      , tagline = "Algorithms @ UiB | Full stack developer"
      , about =
          "I am a passionate and driven full-stack developer with a passion for open-source and strongly typed programming languages. Doing my masters in algorithms at UiB alongside being a part-time developer at Islandgarden. I am a hobby project fanatic, there's always one to many project in my head. I care about the student environment at informatics and I'm active in a host of student run organizations and projects. In my spare time I enjoy long runs, long evenings playing board games and a good beer."
      , socials = C.socials
      , education =
        [ { university = "University of Bergen"
          , degrees =
            [ { title = "Informatics - Algorithms"
              , university = "University of Bergen"
              , institute = "Department of Informatics"
              , degree = "Master of Science"
              , start = 2020
              , end = 2022
              }
            , { title = "Computer Technology"
              , university = "University of Bergen"
              , institute = "Department of Informatics"
              , degree = "Bachelor of Science"
              , start = 2017
              , end = 2020
              }
            ]
          }
        ]
      , experience =
        [ { position = "Summer intern"
          , company = "NAV IT, NAIS"
          , location = "Oslo"
          , start = "Jun 2021"
          , end = Some "Aug 2021"
          , about =
            [ "Developed an application to keep NAV's Kubernetes cluster free from failing applications"
            , "The application is written in Go while interfacing with Kubernetes, Prometheus and InfluxDB"
            , "Lent a hand in projects in NAIS that required frontend experience"
            ]
          , technologies = [ "Go", "Kubernetes", "Prometheus" ]
          }
        , { position = "Developer, part time"
          , company = "IslandGarden"
          , location = "Bergen"
          , start = "Oct 2020"
          , end = None Text
          , about =
            [ "Full stack development using React and Firebase"
            , "Develop and consult customers on developing what they need, from design to implementation"
            ]
          , technologies = [ "TypeScript", "React", "Firebase" ]
          }
        , { position = "Summer intern"
          , company = "Capra Consulting"
          , location = "Oslo"
          , start = "Jun 2020"
          , end = Some "Aug 2020"
          , about =
            [ "Developed an e-learning platform for medicine students at UiO"
            , "Full-stack development with domain driven design and trunk based development"
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
        , { position = "Developer, part-time"
          , company = "Sbanken"
          , location = "Bergen"
          , start = "Jan 2019"
          , end = Some "Oct 2020"
          , about =
            [ "I work on the landing page for the mobile app on both Android and iOS"
            , "Develop and maintenance of REST API's in .NET that is used by several React applications"
            ]
          , technologies =
            [ "CSharp", "REST", "React", "TypeScript", "JavaScript" ]
          }
        , { position = "Teaching assistant INF100"
          , company = "Department of Informatics"
          , location = "University of Bergen"
          , start = "Jun 2018"
          , end = Some "Dec 2018"
          , about =
            [ "Held the exam crash course for both Tekna and NITO, and lectures where I reviewed weekly exercises"
            , "Helped the students with their weekly exercises, mandatory assignments and general question about programming and informatics"
            ]
          , technologies = [ "Python" ]
          }
        , { position = "Developer"
          , company = "Department of Informatics"
          , location = "University of Bergen"
          , start = "Jun 2018"
          , end = Some "Aug 2018"
          , about =
            [ "Developed a portal and webapplication for the students taking INF100 that enabled them to work on, submit and get automatically graded assignments"
            , "Had ~500 users and ran on Google Cloud Platform with Kubernetes"
            ]
          , technologies = [ "Python", "Django", "Google Cloud Playform" ]
          }
        ]
      , extracurricular =
        [ { position = "Board member, webmaster"
          , company = "echo karriere"
          , location = "Bergen"
          , start = "2019"
          , end = None Text
          , about =
            [ "echo karriere is a student organization that runs the career fair for IT-students in Bergen"
            , "Project lead for the development group where I lead 6+ students in developing our solutions"
            , "Developing a full-stack solution for managing the career fair and our website"
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
        , { position = "Board member, leader"
          , company = "echo makerspace"
          , location = "Bergen"
          , start = "2018"
          , end = None Text
          , about =
            [ "Founding member through my engagement in echo, became leader in the autumn of 2019"
            , "I make sure we have the equipment we need, that new members are well taken care of and that our events run smoothly"
            ]
          , technologies = Prelude.List.empty Text
          }
        , { position = "Board member"
          , company = "echo"
          , location = "Bergen"
          , start = "2018"
          , end = Some "2019"
          , about =
            [ "Represented the students interests in the Programme Committee at the departement. The committee is responsible for the courses and degrees and their quality"
            ]
          , technologies = Prelude.List.empty Text
          }
        , { position = "Board member"
          , company = "Gnist"
          , location = "Bergen"
          , start = "2018"
          , end = Some "2020"
          , about =
            [ "Arranged 'Informatikkdagen' where all high schoolers in Bergen with an interest for informatics was invited"
            , "Arranged activities for the students, code nights, board game nights and crash courses for subjects"
            ]
          , technologies = Prelude.List.empty Text
          }
        , { position = "Board member"
          , company = "Fagkveld"
          , location = "Bergen"
          , start = "2019"
          , end = Some "2019"
          , about =
            [ "Arranged an event for students where 12 companies came and shared their knowledge"
            , "Updated and developed the website written in React/JavaScript and hosted with GitHub Pages"
            ]
          , technologies = [ "React", "JavaScript", "GitHub Pages" ]
          }
        ]
      , volunteering =
        [ { position = "Volunteer"
          , company = "JavaZone"
          , location = "Oslo"
          , start = "2019"
          , end = Some ""
          , about =
            [ "Helped speakers get ready, counted attendees and cleaned between talks"
            , "Sat in the information desk where I helped attendees with all their questions"
            ]
          , technologies = Prelude.List.empty Text
          }
        , { position = "Volunteer"
          , company = "Booster"
          , location = "Bergen"
          , start = "2019"
          , end = Some ""
          , about =
            [ "Helped with assembling and disassembling workshops and talks"
            , "Helped participants at Booster Kid with programming and Arduino"
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
              "GitHub organization for echo karriere where our website, full-stack solution and documentation lives."
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
              "Fetch and list templates for .gitignore from the API for gitignore.io. Alle templates are cached locally and the program works on both Windows, macOS and Linux. It is automatically build and released on GitHub."
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
              "Have you ever wondered just how angry your co-workers and/or you are? Or just how naughty the commit log for a project is? This tool counts the number of curses and their authors. It is also automatically built and released on GitHub."
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
              "My CV-as-a-Service with its own GraphQL API that also generates this CV in both english and norwegian."
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
              "GitHub organization for students by students at informatics, UiB. We have gathered and built two websites as well as a Discord bot for the server I started for the informatics students."
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
              "'Is there any coffe left?' is the most common question for a student, a question a friend and I set out to answer once and for all. MOCCA is an IoT platform with a camera, temperature and power sensor that can tell you how much and how fresh the coffee is."
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
                # [ "project management", "pair/mob programming" ]
            , personal =
              [ "pianist"
              , "board game enthusiast"
              , "semi enthusiastic jogger"
              , "certified diver"
              , "sticker collector"
              ]
            }
      }

in  { me, language, headers, resume = resume me language headers }
