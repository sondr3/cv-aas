let Prelude = https://prelude.dhall-lang.org/package.dhall

let P = ./../package.dhall

let preamble = ./preamble.tex as Text

let english = ./english.dhall

let me = english.me

let language = english.headers

let lines = λ(type : Type) → Prelude.Text.concatMapSep "\n" type

let emptyField =
      λ(item : Optional Text) →
        if    Prelude.Optional.null Text item
        then  ""
        else  Prelude.Text.spaces 1 ++ Prelude.Optional.default Text "" item

let toResumeItem = λ(item : Text) → "\\resumeItem{${item}}"

let resumeItems = λ(content : List Text) → lines Text toResumeItem content

let experienceToTex =
      λ(item : P.Experience) →
        ''
        \resumeEntryStart{}
          \resumeEntryTSDL{${item.company}}
                          {${item.start} ---${emptyField item.end}}
                          {${item.position}}
                          {${item.location}}
            \resumeItemListStart{}
              ${resumeItems item.about}
            \resumeItemListEnd{}
          \resumeEntryEnd{}
        ''

let experienceListToTex = lines P.Experience experienceToTex

let educationToTex =
      λ(item : P.Education) →
        ''
        \resumeEntryStart{}
          \resumeEntryTSDL{${item.university}}
          {${Natural/show item.start} --- ${Natural/show item.end}}
          {${item.title}}{${item.institute}}
        \resumeEntryEnd{}
        ''

let educationListToTex = lines P.Education educationToTex

let socialsToTex =
      λ(item : P.Social) →
        ''
        \newcommand{\${item.name}Link}{${item.link}}
        \newcommand{\${item.name}Text}{${item.title}}
        ''

let socialsListToTex = lines P.Social socialsToTex

let socialsHeaderToTex = λ(item : P.Social) → "{\\${item.name}}"

let socialsHeader = Prelude.Text.concatMap P.Social socialsHeaderToTex

let volunteerToTex =
      λ(item : P.Volunteer) →
        ''
        \resumeEntryStart{}
          \resumeEntryTSDL{${item.company}}{${Natural/show
                                                item.time}}{${item.position}}{${item.location}}
        \resumeEntryEnd{}
        ''

let volunteerListToTex = lines P.Volunteer volunteerToTex

let languageSection =
      λ(index : Natural) →
        Prelude.Text.default (Prelude.List.index index Text language)

in  ''
    ${preamble}

    \newcommand{\fullname}{${me.name}}
    \newcommand{\subtitle}{${me.about}}

    ${socialsListToTex me.socials}
    \begin{document}
    \headertype${socialsHeader me.socials}{}{}{} % Set the order of items here
    \vspace{-10pt} % Set a negative value to push the body up, and the opposite

    \section{\faGraduationCap}{${languageSection 0}}
    ${educationListToTex me.education}

    \section{\faChartPie}{${languageSection 1}}
    ${experienceListToTex me.experience}

    \section{\faChild}{${languageSection 2}}
    ${experienceListToTex me.extracurricular}

    \section{\faHandsHelping}{${languageSection 3}}
    ${volunteerListToTex me.volunteering}

    \end{document}
    ''
