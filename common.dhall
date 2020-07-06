let Social
    : Type
    = { title : Text, link : Text }

let Me
    : Type
    = { name : Text, about : Text, socials : List Social }

let me
    : Me
    = { name = "Sondre Nilsen"
      , about = "Hello, world!"
      , socials = [ { title = "Website", link = "https://www.eons.io" } ]
      }

in  me
