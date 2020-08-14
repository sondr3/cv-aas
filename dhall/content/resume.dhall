let Prelude = https://prelude.dhall-lang.org/package.dhall

let P = ./../package.dhall

let preamble = ./preamble.tex as Text

let comma = Prelude.Text.concatSep ", "

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
          \resumeEntryTSDL{${item.company}}
                          {${Natural/show item.time}}
                          {${item.position}}
                          {${item.location}}
        \resumeEntryEnd{}
        ''

let volunteerListToTex = lines P.Volunteer volunteerToTex

let projectToTex =
      λ(item : P.Project) →
        ''
        \resumeEntryStart{}
          \resumeEntryP{${item.name}}
                       {${comma item.technologies}}
                       {${item.about}}
        \resumeEntryEnd{}
        ''

let projectListToTex = lines P.Project projectToTex

let languageSection =
      λ(index : Natural) →
      λ(language : List Text) →
        Prelude.Text.default (Prelude.List.index index Text language)

let resume =
      λ(me : P.Me) →
      λ(language : List Text) →
        ''
        ${preamble}

        \newcommand{\fullname}{${me.name}}
        \newcommand{\subtitle}{${me.about}}

        ${socialsListToTex me.socials}
        \begin{document}
        \headertype${socialsHeader me.socials}{}{}{} 
        \vspace{-10pt} 

        \section{\faGraduationCap}{${languageSection 0 language}}
        ${educationListToTex me.education}

        \section{\faChartPie}{${languageSection 1 language}}
        ${experienceListToTex me.experience}

        \section{\faChild}{${languageSection 2 language}}
        ${experienceListToTex me.extracurricular}

        \section{\faHandsHelping}{${languageSection 3 language}}
        ${volunteerListToTex me.volunteering}

        \section{\faFlask}{${languageSection 4 language}}
        ${projectListToTex me.projects}

        \section{\faCogs}{${languageSection 5 language}}
        \resumeEntryStart{}
          \resumeEntryS{${languageSection 6 language}}
                       {${comma me.skills.languages}}
          \resumeEntryS{${languageSection 7 language}}
                       {${comma me.skills.technologies}}
          \resumeEntryS{${languageSection 8 language}}
                       {${comma me.skills.personal}}
        \resumeEntryEnd{}

        \end{document}
        ''

in  resume
