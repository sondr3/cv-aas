let Degree = ./Degree.dhall

let Education
    : Type
    = { university : Text, degrees : List Degree }

in  Education
