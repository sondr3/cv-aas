let P = ./../package.dhall

let C = ./common.dhall

let resume = ./resume.dhall

let headers =
      [ "Education"
      , "Experience"
      , "Extracurricular"
      , "Volunteering"
      , "Projects"
      , "Skills"
      , "Languages"
      , "Technologies"
      , "Personal"
      ]

let me
    : P.Me
    = { name = C.name.firstName ++ C.name.lastName
      , firstName = C.name.firstName
      , lastName = C.name.lastName
      , tagline = "Hello, world!"
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
        [ { position = "Summer intern"
          , company = "Capra Consulting"
          , location = "Oslo"
          , start = "Jun 2020"
          , end = Some "Aug 2020"
          , about =
            [ "Full-stack development on AWS with Kotlin/GraphQL and React/TypeScript"
            ]
          }
        , { position = "Junior developer"
          , company = "Sbanken"
          , location = "Bergen"
          , start = "Jan 2019"
          , end = None Text
          , about =
            [ "Part time job as a junior developer where I work with both frontend and backend"
            , "Full-stack development in React/JavaScript and CSharp/.NET"
            ]
          }
        , { position = "Teaching assistant"
          , company = "Department of Informatics"
          , location = "University of Bergen"
          , start = "Jun 2018"
          , end = Some "Dec 2018"
          , about =
            [ "Held the exam crash course for both Tekna and NITO, and reviewed the weekly exercises"
            , "Helped the students with their weekly exercises, mandatory assignments and general question about programming and informatics"
            ]
          }
        , { position = "Developer"
          , company = "Department of Informatics"
          , location = "University of Bergen"
          , start = "Jun 2018"
          , end = Some "Aug 2018"
          , about =
            [ "Developed a portal and webapplication in Python 3 and Django for the students taking INF100 that enabled them to work on, submit and automatically grade assignments."
            , "Had about 500 users, ran on Google Cloud Platform with Kubernetes"
            ]
          }
        ]
      , extracurricular =
        [ { position = "Board member, webmaster"
          , company = "echo karriere"
          , location = "Bergen"
          , start = "2019"
          , end = None Text
          , about =
            [ "Arranged a career fair for IT-students in Bergen with 29 visiting companies"
            , "Developed a full-stack application for managing the fair in Kotlin/GraphQL and React/TypeScript"
            , "Developed the main website, echokarriere.no"
            ]
          }
        , { position = "Board member, leader"
          , company = "echo makerspace"
          , location = "Bergen"
          , start = "2018"
          , end = None Text
          , about =
            [ "Founding member, became leader in the autumn of 2019"
            , "We manage the membership and use of the makerspace and its equipment as well as events for students"
            ]
          }
        , { position = "Board member"
          , company = "echo"
          , location = "Bergen"
          , start = "2018"
          , end = Some "2019"
          , about =
            [ "Represented the students interests in the Programme Committee at the departement. The committee is responsible for the courses and degrees, and their quality."
            ]
          }
        , { position = "Board member"
          , company = "Gnist"
          , location = "Bergen"
          , start = "2018"
          , end = Some "2020"
          , about =
            [ "Helped with recruitement and retaining students at the departement"
            , "Arranged a host of activities for the students, code nights, board game nights and crash courses for subjects"
            ]
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
          }
        ]
      , volunteering =
        [ { position = "Volunteer"
          , company = "JavaZone"
          , location = "Oslo"
          , time = 2019
          }
        , { position = "Volunteer"
          , company = "Booster"
          , location = "Bergen"
          , time = 2019
          }
        ]
      , projects =
        [ { name = "git-ignore"
          , technologies = [ "Rust", "Git" ]
          , about =
              "Quickly and easily list and fetch .gitignore templates from gitignore.io, works on Windows, Linux and macOS."
          }
        , { name = "git-anger-management"
          , technologies = [ "Rust", "Git" ]
          , about =
              "Have you ever wondered just how angry your co-workers and/or you are? Or just how naughty the commit log for a project is? This tool solves that problem."
          }
        ]
      , skills =
            C.skills
          ⫽ { personal =
              [ "pianist"
              , "board game enthusiast"
              , "semi enthusiastic jogger"
              , "certified diver"
              , "sticker collector"
              ]
            }
      }

in  { me, headers, resume = resume me headers }
