let Prelude = https://prelude.dhall-lang.org/package.dhall

let P = ./../package.dhall

let comma = Prelude.Text.concatSep ", "

let lines = Prelude.Text.concatSep "\n"

let linesMap = λ(type : Type) → Prelude.Text.concatMapSep "\n" type

let emptyField =
      λ(item : Optional Text) →
        if    Prelude.Optional.null Text item
        then  "---"
        else  Prelude.Optional.default Text "" item

let toResumeItem = λ(item : Text) → "\\item {${item}}"

let resumeItems =
      λ(content : List Text) →
        ''
        \begin{itemize}
        ${linesMap Text toResumeItem content}
        \end{itemize}
        ''

let experienceEnvironment
    : ∀(a : Type) → List a → Text
    = λ(a : Type) →
      λ(xs : List a) →
        if Prelude.List.null a xs then "\\simpleexperience" else "\\experience"

let experienceToTex =
      λ(item : P.Experience) →
        ''
        ${experienceEnvironment Text item.technologies}
        {${item.start}}
        {${item.position}}
        {${item.company}}
        {${item.location}}
        {${emptyField item.end}}
        {${resumeItems item.about}}
        {${comma item.technologies}}
        \emptySeparator
        ''

let experienceListToTex =
      λ(item : List P.Experience) →
        ''
        \begin{experiences}
        ${lines (Prelude.List.map P.Experience Text experienceToTex item)}
        \end{experiences}
        ''

let degreeToTex =
      λ(item : P.Degree) →
        ''
        \educationentry
          {${Natural/show item.start}}
          {${Natural/show item.end}}
          {${item.institute}}
          {${item.degree}}
          {${item.title}}
        ''

let universityToTex =
      λ(item : P.Education) →
        ''
          \multicolumn{2}{l}{\textbf{\large ${item.university}}} \\
          ${lines (Prelude.List.map P.Degree Text degreeToTex item.degrees)}
        ''

let toEducation =
      λ(item : List P.Education) →
        ''
        \begin{education}
        ${lines (Prelude.List.map P.Education Text universityToTex item)}
        \end{education}
        ''

let socialsToTex =
      λ(item : P.Social) →
        ''
        \newcommand{\${item.name}Link}{${item.link}}
        \newcommand{\${item.name}Text}{${item.title}}
        ''

let projectGithub =
      λ(item : P.Social) →
        "\\sociallink{\\githubSymbol}{${item.link}}{${item.title}}"

let projectWebsite =
      λ(item : Optional P.Social) →
        Prelude.Optional.fold
          P.Social
          item
          Text
          ( λ(x : P.Social) →
              "\\sociallink{\\faExternalLink*}{${x.link}}{${x.title}}"
          )
          ""

let projectToTex =
      λ(item : P.Project) →
        ''
        \project
          {${item.name}}
          {${comma item.technologies}}
          {${projectGithub item.github} 
           ${projectWebsite item.website} ${projectWebsite item.website2}
          }
          {${item.about}}
        ''

let projectListToTex =
      λ(item : List P.Project) →
        ''
        \begin{projects}
        ${lines (Prelude.List.map P.Project Text projectToTex item)}
        \end{projects}
        ''

let skillItemsToTex = λ(item : List Text) → Prelude.Text.concatSep ", " item

let skillToTex =
      λ(title : Text) →
      λ(item : List Text) →
        ''
        \keywordsentry{${title}}{${skillItemsToTex item}}
        ''

let languageSection =
      λ(index : Natural) →
      λ(header : List Text) →
        Prelude.Text.default (Prelude.List.index index Text header)

let resume =
      λ(me : P.Me) →
      λ(language : Text) →
      λ(header : List Text) →
        ''
        \documentclass[alternative,10pt,compact]{template}

        \setdefaultlanguage{${language}}

        \name{${me.firstName}}{${me.lastName}}
        \tagline{${me.tagline}}
        \photo{3cm}{me}
        \socialinfo{
          \begin{minipage}{1.0\linewidth}
            \normalsize
            \renewcommand{\arraystretch}{1.45}
            \begin{tabular}{@{}lll}
              \linkedin{${me.socials.linkedin.title}} & \github{${me.socials.github.title}} & \website{${me.socials.website.link}}{${me.socials.website.title}} \\
        	    \smartphone{${me.socials.phone.link}}   & \email{${me.socials.email.link}}    &
            \end{tabular}
          \end{minipage}
        } 

        \begin{document}
          \makecvheader
          \makecvfooter{\textsc{\the\year{}}}
                     {\textsc{${me.name} - CV}}
                     {\thepage}

          \vspace*{-0.3in}
          \par{${me.about}}

          \sectionTitle{${languageSection 0 header}}{\faGraduationCap}
          ${toEducation me.education}

          \sectionTitle{${languageSection 1 header}}{\faSuitcase}
          ${experienceListToTex me.experience}

          \sectionTitle{${languageSection 2 header}}{\faScroll}
          ${experienceListToTex me.extracurricular}

          \sectionTitle{${languageSection 3 header}}{\faHandsHelping}
          ${experienceListToTex me.volunteering}

          \sectionTitle{${languageSection 4 header}}{\faFlask}
          ${projectListToTex me.projects}

          \sectionTitle{${languageSection 5 header}}{\faTasks}
          \begin{keywords}
          ${skillToTex (languageSection 6 header) me.skills.languages}
          ${skillToTex (languageSection 7 header) me.skills.technologies}
          ${skillToTex (languageSection 8 header) me.skills.workflow}
          ${skillToTex (languageSection 9 header) me.skills.personal}
          \end{keywords}
        \end{document}
        ''

in  resume
