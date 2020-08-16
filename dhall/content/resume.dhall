let Prelude = https://prelude.dhall-lang.org/package.dhall

let P = ./../package.dhall

let comma = Prelude.Text.concatSep ", "

let lines = Prelude.Text.concatSep "\n"

let linesMap = λ(type : Type) → Prelude.Text.concatMapSep "\n" type

let emptyField =
      λ(item : Optional Text) →
        if    Prelude.Optional.null Text item
        then  ""
        else  Prelude.Optional.default Text "" item

let toResumeItem = λ(item : Text) → "\\item {${item}}"

let resumeItems =
      λ(content : List Text) →
        ''
        \begin{itemize}
        ${linesMap Text toResumeItem content}
        \end{itemize}
        ''

let experienceToTex =
      λ(item : P.Experience) →
        ''
        \experience
        {${item.start}}
        {${item.position}}
        {${item.company}}
        {${item.location}}
        {${emptyField item.end}}
        {${resumeItems item.about}}
        {}
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
          {${item.degree}}
          {${item.institute}}
          {${item.title}} \\
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

let socialsListToTex = linesMap P.Social socialsToTex

let socialsHeaderToTex = λ(item : P.Social) → "{\\${item.name}}"

let socialsHeader = Prelude.Text.concatMap P.Social socialsHeaderToTex

let volunteerToTex =
      λ(item : P.Volunteer) →
        ''
        \resumeEntryStart{}
          \resumeEntryTSDL{${item.company}}
                          {${Natural/show item.time}}
                          {${item.position}}
                          {${item.location}}
        \resumeEntryEnd{}
        ''

let volunteerListToTex = linesMap P.Volunteer volunteerToTex

let projectToTex =
      λ(item : P.Project) →
        ''
        \resumeEntryStart{}
          \resumeEntryP{${item.name}}
                       {${comma item.technologies}}
                       {${item.about}}
        \resumeEntryEnd{}
        ''

let projectListToTex = linesMap P.Project projectToTex

let languageSection =
      λ(index : Natural) →
      λ(language : List Text) →
        Prelude.Text.default (Prelude.List.index index Text language)

let resume =
      λ(me : P.Me) →
      λ(language : List Text) →
        ''
        \documentclass[alternative,10pt,compact]{template}

        \name{${me.firstName}}{${me.lastName}}
        \tagline{${me.tagline}}
        \photo{2.5cm}{me}
        \socialinfo{
        	\linkedin{${me.socials.linkedin.title}}
        	\github{${me.socials.github.title}}\\
        	\smartphone{${me.socials.phone.link}}
        	\email{${me.socials.email.link}}\\
        	\address{Norway}
        	\infos{Nerd}
        } 

        \begin{document}
          \makecvheader
          \makecvfooter{\textsc{}} %\selectlanguage{english}\today
                     {\textsc{${me.name} - CV}}
                     {\thepage}

          \par{${me.about}}

          \sectionTitle{${languageSection 0 language}}{\faGraduationCap}
          ${toEducation me.education}

          \sectionTitle{${languageSection 1 language}}{\faSuitcase}
          ${experienceListToTex me.experience}

        \end{document}
        ''

in  resume
