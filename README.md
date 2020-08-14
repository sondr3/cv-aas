<h1 align="center">cv-aas</h1>

<p align="center">
   <a href="https://github.com/sondr3/cv-aas/actions"><img alt="GitHub Actions Status" src="https://github.com/sondr3/cv-aas/workflows/pipeline/badge.svg" /></a>
   <br />
</p>

<p align="center">
   <strong>CV-as-a-Service, because the world needs more SaaS.</strong>
</p>

<details>
<summary>Table of Contents</summary>
<br />

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->

**Table of Contents**

- [-](#-)
- [Installation](#installation)
- [How?](#how)
- [License](#license)

<!-- markdown-toc end -->

</details>

## What, why?

On a whim and mostly for the heck of it, I decided that it'd be fun to make my
CV into a service that other people can query. Well, mostly myself I guess. This
is the result, a full GraphQL-API that you can query in both Norwegian and
English to get more information about yours truly! Spectacularly useless for
everyone but me. Oh, and it generates my LaTeX-resume, which is actually pretty
cool if you ask me.

# Installation

Don't.

# How?

Well, it's kinda messy. The main bulk of the content is written in a
programmable configuration language called [Dhall](https://dhall-lang.org),
which is essentially JSON + functions + types + imports. I then convert that
data to JSON and those files are then included in the binary that is written in
Rust enabling very easy deployment of the API, and I can use
[Serde](https://serde.rs/) to easily deserialize the JSON to Rust structs.
Finally, I generate my LaTeX-resume using Dhall as essentially a programmable
templating language where I import the language specific content and map it out
as TeX.

# License

MIT.
