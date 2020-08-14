let P = ./../package.dhall

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
            , "Full-stack development in React/JavaScript and C#/.NET"
            ]
          }
        , { position = "Teaching assistant"
          , company = "Departement of Informatics"
          , location = "University of Bergen"
          , start = "Jun 2018"
          , end = Some "Dec 2018"
          , about =
            [ "Held the exam crash course for both Tekna and NITO, and reviewed the weekly exercises"
            , "Helped the students with their weekly exercises, mandatory assignments and general question about programming and informatics"
            ]
          }
        , { position = "Developer"
          , company = "Departement of Informatics"
          , location = "University of Bergen"
          , start = "Jun 2018"
          , end = Some "Aug 2018"
          , about =
            [ "Developed a portal and webapplication in Python 3 and Django for the students taking INF100 that enabled them to work on, submit and automatically grade assignments."
            , "Had about 500 users, ran on Google Cloud Platform with Kubernetes"
            ]
          }
        ]
      }

in  { me, headers }
