let Prelude = https://prelude.dhall-lang.org/package.dhall

let P = ./dhall/package.dhall

let preamble = ./preamble.tex as Text

let english = ./english.dhall

let me = english.me

let language = english.headers

let lines = λ(type : Type) → Prelude.Text.concatMapSep "\n" type

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

let languageSection =
      λ(index : Natural) →
        Prelude.Optional.default
          Text
          ""
          (Prelude.List.index index Text language)

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

    \end{document}
    ''
