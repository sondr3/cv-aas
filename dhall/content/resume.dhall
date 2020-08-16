let Prelude = https://prelude.dhall-lang.org/package.dhall

let P = ./../package.dhall

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
        \documentclass[alternative,10pt,compact]{template}

        \name{${me.firstName}}{${me.lastName}}
        \tagline{${me.tagline}}
        \photo{2.5cm}{darwiin}
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
                       {\textsc{${me.firstName} ${me.lastName} - CV}}
                       {\thepage}

        \end{document}
        ''

in  resume
