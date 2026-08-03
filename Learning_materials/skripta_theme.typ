// This file is auto-generated. Do not edit directly.
// Generated from theme/colors.json and theme/fonts.json.
// Run R/generate_theme.R to regenerate.
//
// To use custom fonts: set non-empty font names in theme/fonts.json
// under the 'typst' key. Fonts must be installed locally — Typst
// cannot download Google Fonts.

// ---------------------------------------------------------------------------
// Body text
// ---------------------------------------------------------------------------
#set text(
  size: 11pt,
  fill: rgb("#2E2E2E")
)

// ---------------------------------------------------------------------------
// Page background
// ---------------------------------------------------------------------------
#set page(
  fill: rgb("#FFFFFF")
)

// ---------------------------------------------------------------------------
// Headings
// ---------------------------------------------------------------------------
#show heading.where(level: 1): it => {
  set text(
  size: 18pt,
  weight: 600,
  fill: rgb("#5D2890")
  )
  it
}

#show heading.where(level: 2): it => {
  set text(
  size: 15pt,
  weight: 600,
  fill: rgb("#5D2890")
  )
  it
}

#show heading.where(level: 3): it => {
  set text(
  size: 13pt,
  weight: 600,
  fill: rgb("#5D2890")
  )
  it
}

// ---------------------------------------------------------------------------
// Links
// ---------------------------------------------------------------------------
#show link: it => {
  set text(fill: rgb("#5D2890"))
  underline(it)
}

// ---------------------------------------------------------------------------
// Code blocks (override Quarto default luma(230) background)
// ---------------------------------------------------------------------------
#show raw.where(block: true): set block(
  fill: rgb("#F0EDE8"),
  width: 100%,
  inset: 8pt,
  radius: 2pt
)

// ---------------------------------------------------------------------------
// Tables — applies to Markdown and generated data tables
// ---------------------------------------------------------------------------
#show table: set table(
  inset: 6pt,
  stroke: 0.6pt + rgb("#8A8A8A"),
  fill: (x, y) => if y == 0 { rgb("#5D2890") } else if calc.even(y) { rgb("#F0EDE8") } else { none }
)

#show table.cell.where(y: 0): set text(fill: rgb("#F4F1EC"), weight: 700)

// ---------------------------------------------------------------------------
// Callout blocks (override Quarto defaults with brand colours)
// Quarto passes these background_color values per type:
//   note     #dae6fb   tip      #ccf1e3
//   warning  #fcefdc   caution  #ffe5d0   important  #f7dddc
//   custom semantic question type uses the fallback #dddddd
// ---------------------------------------------------------------------------
#let callout(
  body: [],
  title: "Callout",
  background_color: rgb("#dddddd"),
  icon: none,
  icon_color: black,
  body_background_color: white
) = {
  let accent = if background_color == rgb("#ccf1e3") {
    rgb("#8A8A8A")  // tip → grey_olive
  } else if background_color == rgb("#fcefdc") {
    rgb("#F3A712")  // warning → orange
  } else if background_color == rgb("#ffe5d0") {
    rgb("#C94C4C")  // caution → warning red
  } else if background_color == rgb("#f7dddc") {
    rgb("#5D2890")  // important → indigo_velvet
  } else if background_color == rgb("#dae6fb") {
    rgb("#86579E")  // note → amethyst
  } else {
    rgb("#F3A712")  // semantic question → orange
  }
  block(
    breakable: false,
    fill: accent,
    stroke: (paint: accent, thickness: 0.5pt, cap: "round"),
    width: 100%,
    radius: 2pt,
    block(
      inset: 1pt,
      width: 100%,
      below: 0pt,
      block(
        fill: accent,
        width: 100%,
        inset: 8pt
      )[#text(rgb("#FFFFFF"), weight: 900)[#icon] #text(rgb("#FFFFFF"))[#title]]
    ) +
    if(body != []){
      block(
        inset: 1pt,
        width: 100%,
        block(fill: rgb("#F4F1EC"), width: 100%, inset: 8pt, body)
      )
    }
  )
}

