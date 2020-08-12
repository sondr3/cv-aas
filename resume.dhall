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
        \newcommand{\${item.name}Link}{${item.link}}
        \newcommand{\${item.name}Text}{${item.title}}
        ''

let socialsListToTex = Prelude.Text.concatMapSep "\n" P.Social socialsToTex

let socialsHeaderToTex = λ(item : P.Social) → "{\\${item.name}}"

let socialsHeader = Prelude.Text.concatMap P.Social socialsHeaderToTex

in  ''
    ${preamble}

    \newcommand{\fullname}{${me.name}}
    \newcommand{\subtitle}{${me.about}}

    ${socialsListToTex me.socials}

    % Defines to make listing easier
    \newcommand{\LinkedIn}{\linkedinicon\hspace{3pt}\href{\LinkedInLink}{\LinkedInText}}
    \newcommand{\Phone}{\phoneicon\hspace{3pt}{ \PhoneText}}
    \newcommand{\Email}{\emailicon\hspace{3pt}\href{\EmailLink}{\EmailText}}
    \newcommand{\GitHub}{\githubicon\hspace{3pt}\href{\GitHubLink}{\GitHubText}}
    \newcommand{\Website}{\websiteicon\hspace{3pt}\href{\WebsiteLink}{\WebsiteText}}

    \begin{document}
    \headertype${socialsHeader me.socials}{}{}{} % Set the order of items here
    \vspace{-10pt} % Set a negative value to push the body up, and the opposite

    \section{\faGraduationCap}{Utdanning}
    ${educationListToTex me.education}

    \end{document}
        ''
