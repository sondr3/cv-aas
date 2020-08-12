let Prelude = https://prelude.dhall-lang.org/package.dhall

let P = ./dhall/package.dhall

let preamble = ./preamble.tex as Text

let me = ./english.dhall

let educationToTex =
      λ(item : P.Education) →
        ''
        \resumeEntryStart{}
          \resumeEntryTSDL{${item.university}}
          {${Natural/show item.start} --- ${Natural/show item.end}}
          {${item.title}}{${item.institute}}
        \resumeEntryEnd{}
        ''

let educationListToTex =
      Prelude.Text.concatMapSep "\n" P.Education educationToTex

let socialsToTex =
      λ(item : P.Social) →
        ''
        \newcommand{\${item.kindName}link}{${item.link}}
        \newcommand{\${item.kindName}text}{${item.title}}
        ''

let socialsListToTex = Prelude.Text.concatMapSep "\n" P.Social socialsToTex

let socialsHeaderToTex = λ(item : P.Social) → "{\\${item.kindName}}"

let socialsHeader = Prelude.Text.concatMap P.Social socialsHeaderToTex

in  ''
    ${preamble}

    \newcommand{\fullname}{${me.name}}
    \newcommand{\subtitle}{${me.about}}

    ${socialsListToTex me.socials}

    % Defines to make listing easier
    \newcommand{\linkedin}{\linkedinicon\hspace{3pt}\href{\linkedinlink}{\linkedintext}}
    \newcommand{\phone}{\phoneicon\hspace{3pt}{ \phonetext}}
    \newcommand{\email}{\emailicon\hspace{3pt}\href{\emaillink}{\emailtext}}
    \newcommand{\github}{\githubicon\hspace{3pt}\href{\githublink}{\githubtext}}
    \newcommand{\website}{\websiteicon\hspace{3pt}\href{\websitelink}{\websitetext}}

    \begin{document}
    \headertype${socialsHeader me.socials}{}{}{} % Set the order of items here
    \vspace{-10pt} % Set a negative value to push the body up, and the opposite

    \section{\faGraduationCap}{Utdanning}
    ${educationListToTex me.education}

    \end{document}
        ''
