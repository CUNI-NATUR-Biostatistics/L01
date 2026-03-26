#----------------------------------------------------------#
#
#
#                        _brand
#
#    Generate Learning_materials/skripta_theme.typ
#       from theme/colors.json and theme/fonts.json
#
#        Canonical source — lecture repos download
#        this file from _brand at render time.
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

generate_skripta_typst_theme <- function(
  colors_file = here::here("theme/colors.json"),
  fonts_file = here::here("theme/fonts.json"),
  output_file = here::here("Learning_materials/skripta_theme.typ")
) {
  message("Generating Learning_materials/skripta_theme.typ...\n")

  if (!file.exists(colors_file)) {
    stop("colors.json not found at: ", colors_file)
  }
  if (!file.exists(fonts_file)) {
    stop("fonts.json not found at: ", fonts_file)
  }

  colors_data <-
    jsonlite::fromJSON(colors_file)
  fonts <-
    jsonlite::fromJSON(fonts_file)

  primary <- colors_data$primary
  semantic <- colors_data$semantic

  # Resolve a semantic colour reference to its hex value
  resolve_hex <- function(semantic_name) {
    ref <- semantic[[semantic_name]]
    if (!is.null(ref) && ref %in% names(primary)) primary[[ref]] else ref
  }

  text_color_hex <- resolve_hex("textColor")
  bg_color_hex <- resolve_hex("backgroundColor")
  print_bg_hex <- primary[["white"]]
  heading_color_hex <- resolve_hex("headingColor")
  link_color_hex <- resolve_hex("linkColor")
  code_bg_hex <- resolve_hex("codeBackgroundColor")
  accent_color_hex <- resolve_hex("accentColor")
  orange_hex <- colors_data$primary[["orange"]]

  sz <- fonts$typstSizes
  wt <- fonts$weights

  # Use Typst-specific fonts (bundled with Typst, no download required).
  # Empty string means "use Typst's default font" — no font: line is emitted.
  typst_body_font    <- fonts$typst$body
  typst_heading_font <- fonts$typst$heading

  # Helper: build a #set text(...) block; skips `font:` if name is empty
  typst_set_text <- function(font_name, size, weight = NULL, fill) {
    font_line <-
      if (nchar(trimws(font_name)) > 0) {
        paste0('  font: "', font_name, '",')
      } else {
        NULL
      }
    weight_line <-
      if (!is.null(weight)) paste0("  weight: ", weight, ",") else NULL
    c(
      "  set text(",
      font_line,
      paste0("  size: ", size, ","),
      weight_line,
      paste0('  fill: rgb("', fill, '")'),
      "  )"
    )
  }

  lines <-
    c(
      "// This file is auto-generated. Do not edit directly.",
      "// Generated from theme/colors.json and theme/fonts.json.",
      "// Run R/generate_theme.R to regenerate.",
      "//",
      "// To use custom fonts: set non-empty font names in theme/fonts.json",
      "// under the 'typst' key. Fonts must be installed locally — Typst",
      "// cannot download Google Fonts.",
      "",
      "// ---------------------------------------------------------------------------",
      "// Body text",
      "// ---------------------------------------------------------------------------",
      "#set text(",
      if (nchar(trimws(typst_body_font)) > 0) paste0('  font: "', typst_body_font, '",') else NULL,
      paste0("  size: ", sz$bodyPt, ","),
      paste0('  fill: rgb("', text_color_hex, '")'),
      ")",
      "",
      "// ---------------------------------------------------------------------------",
      "// Page background",
      "// ---------------------------------------------------------------------------",
      "#set page(",
      paste0('  fill: rgb("', print_bg_hex, '")'),
      ")",
      "",
      "// ---------------------------------------------------------------------------",
      "// Headings",
      "// ---------------------------------------------------------------------------",
      paste0(
        "#show heading.where(level: 1): it => {",
        "\n",
        paste(typst_set_text(typst_heading_font, sz$heading1Pt, wt$headingFontWeight, heading_color_hex), collapse = "\n"),
        "\n  it",
        "\n}"
      ),
      "",
      paste0(
        "#show heading.where(level: 2): it => {",
        "\n",
        paste(typst_set_text(typst_heading_font, sz$heading2Pt, wt$headingFontWeight, heading_color_hex), collapse = "\n"),
        "\n  it",
        "\n}"
      ),
      "",
      paste0(
        "#show heading.where(level: 3): it => {",
        "\n",
        paste(typst_set_text(typst_heading_font, sz$heading3Pt, wt$headingFontWeight, heading_color_hex), collapse = "\n"),
        "\n  it",
        "\n}"
      ),
      "",
      "// ---------------------------------------------------------------------------",
      "// Links",
      "// ---------------------------------------------------------------------------",
      "#show link: it => {",
      paste0('  set text(fill: rgb("', link_color_hex, '"))'),
      "  underline(it)",
      "}",
      "",
      "// ---------------------------------------------------------------------------",
      "// Code blocks (override Quarto default luma(230) background)",
      "// ---------------------------------------------------------------------------",
      paste0(
        "#show raw.where(block: true): set block(",
        "\n  fill: rgb(\"", code_bg_hex, "\"),",
        "\n  width: 100%,",
        "\n  inset: 8pt,",
        "\n  radius: 2pt",
        "\n)"
      ),
      "",
      "// ---------------------------------------------------------------------------",
      "// Callout blocks (override Quarto defaults with brand colours)",
      "// Quarto passes these background_color values per type:",
      "//   note     #dae6fb   tip      #ccf1e3",
      "//   warning  #fcefdc   caution  #ffe5d0   important  #f7dddc",
      "// ---------------------------------------------------------------------------",
      paste0(
        "#let callout(",
        "\n  body: [],",
        "\n  title: \"Callout\",",
        "\n  background_color: rgb(\"#dddddd\"),",
        "\n  icon: none,",
        "\n  icon_color: black,",
        "\n  body_background_color: white",
        "\n) = {",
        "\n  let accent = if background_color == rgb(\"#ccf1e3\") {",
        "\n    rgb(\"", accent_color_hex, "\")  // tip \u2192 amethyst",
        "\n  } else if (background_color == rgb(\"#fcefdc\") or background_color == rgb(\"#ffe5d0\") or background_color == rgb(\"#f7dddc\")) {",
        "\n    rgb(\"", orange_hex, "\")  // warning / caution / important \u2192 orange",
        "\n  } else {",
        "\n    rgb(\"", heading_color_hex, "\")  // note + fallback \u2192 indigo_velvet",
        "\n  }",
        "\n  block(",
        "\n    breakable: false,",
        "\n    fill: accent,",
        "\n    stroke: (paint: accent, thickness: 0.5pt, cap: \"round\"),",
        "\n    width: 100%,",
        "\n    radius: 2pt,",
        "\n    block(",
        "\n      inset: 1pt,",
        "\n      width: 100%,",
        "\n      below: 0pt,",
        "\n      block(",
        "\n        fill: accent,",
        "\n        width: 100%,",
        "\n        inset: 8pt",
        "\n      )[#text(rgb(\"#FFFFFF\"), weight: 900)[#icon] #text(rgb(\"#FFFFFF\"))[#title]]",
        "\n    ) +",
        "\n    if(body != []){",
        "\n      block(",
        "\n        inset: 1pt,",
        "\n        width: 100%,",
        "\n        block(fill: rgb(\"", bg_color_hex, "\"), width: 100%, inset: 8pt, body)",
        "\n      )",
        "\n    }",
        "\n  )",
        "\n}"
      ),
      ""
    )

  writeLines(lines, con = output_file)
  message("Learning_materials/skripta_theme.typ generated successfully\n")
}
