let Prelude =
      https://prelude.dhall-lang.org/package.dhall
        sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871

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
      , tagline = "Senior consultant @ Sonat | Full stack developer"
      , about =
          "I am a passionate and driven full-stack developer with a passion for open-source and strongly typed programming languages. Senior consultant at Sonat with a masters in algorithms from UiB. I am a hobby project fanatic, there's always one to many project in my head. In my spare time I enjoy long runs, long evenings playing board games, sourdough baking, fermenting and a good beer."
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
        [ { position = "Senior Consultant"
          , company = "Sonat Bergen"
          , location = "Bergen"
          , start = "Jul 2022"
          , end = None Text
          , about =
            [ "Developed a web application for math students in primary school"
            , "Fullstack development, infrastructure and devops"
            , "Consulting and planning for development and modernization of existing systems"
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
        , { position = "Summer intern"
          , company = "NAV IT, NAIS"
          , location = "Oslo"
          , start = "Jun 2021"
          , end = Some "Aug 2021"
          , about =
            [ "Developed an application to keep NAV's Kubernetes cluster free from failing applications"
            , "The application is written in Go while interfacing with Kubernetes, Prometheus and InfluxDB"
            , "Lent a hand in projects in NAIS that required frontend experience"
            ]
          , technologies = [ "Go", "Kubernetes", "Prometheus", "Google Cloud" ]
          }
        , { position = "Developer, part time"
          , company = "IslandGarden"
          , location = "Bergen"
          , start = "Oct 2020"
          , end = Some "Jun 2022"
          , about =
            [ "Full stack development using React and Firebase"
            , "Develop and consult customers on developing what they need, from design to implementation"
            ]
          , technologies = [ "TypeScript", "React", "Firebase", "GitHub" ]
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
          , technologies = [ "Python", "Django", "Google Cloud" ]
          }
        ]
      , extracurricular =
        [ { position = "Board member, webmaster"
          , company = "echo karriere (ITxBergen)"
          , location = "Bergen"
          , start = "2019"
          , end = Some "2021"
          , about =
            [ "echo karriere (ITxBergen) is a student organization that runs the career fair for IT-students in Bergen"
            , "Project lead for the development group where I lead 6+ students in developing our solutions"
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
          , end = Some "2021"
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
              "GitHub organization for echo karriere (now ITxBergen) where our website, full-stack solution and documentation lives."
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
              "My CV-as-a-Service with its own GraphQL API that also generates this CV in both English and Norwegian."
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
              [ "Pianist"
              , "board game enthusiast"
              , "semi enthusiastic jogger"
              , "certified diver"
              , "sourdough baker"
              ]
            }
      }

in  { me, language, headers, resume = resume me language headers }
