#----------------------------------------------------------#
#
#
#                        _brand
#
#    Generate Learning_materials/skripta_theme.scss
#       from theme/colors.json, theme/fonts.json
#       and theme/custom_theme.json
#
#        Canonical source — lecture repos download
#        this file from _brand at render time.
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

generate_skripta_html_theme <- function(
  colors_file = here::here("theme/colors.json"),
  fonts_file = here::here("theme/fonts.json"),
  custom_theme_file = here::here("theme/custom_theme.json"),
  output_file = here::here("theme/skripta_theme.scss")
) {
  message("Generating theme/skripta_theme.scss...\n")

  if (!file.exists(colors_file)) {
    stop("colors.json not found at: ", colors_file)
  }
  if (!file.exists(fonts_file)) {
    stop("fonts.json not found at: ", fonts_file)
  }
  if (!file.exists(custom_theme_file)) {
    stop("custom_theme.json not found at: ", custom_theme_file)
  }

  fonts <-
    jsonlite::fromJSON(fonts_file)
  ct <-
    jsonlite::fromJSON(custom_theme_file)

  sz <- fonts$htmlSizes
  wt <- fonts$weights
  cd <- ct$code
  bq <- ct$blockquote
  tb <- ct$table
  sh <- ct$shadows

  body_font_stack <-
    paste0(
      '"', fonts$body, '", ',
      paste(paste0('"', fonts$system$bodyFallbacks, '"'), collapse = ", ")
    )

  heading_font_stack <-
    paste0(
      '"', fonts$heading, '", ',
      paste(paste0('"', fonts$system$headingFallbacks, '"'), collapse = ", ")
    )

  mono_font_stack <-
    paste0(
      '"', fonts$monospace, '", ',
      '"', fonts$system$monospaceFallback, '", monospace'
    )

  # Read colors so we can inline them (avoids @import ordering issues with Bootstrap)
  colors_data <-
    jsonlite::fromJSON(colors_file)
  primary <- colors_data$primary
  semantic <- colors_data$semantic

  # Inline primary color variable declarations
  primary_var_lines <-
    purrr::imap_chr(primary, ~ paste0("$", .y, ": ", .x, ";"))

  # Inline semantic color variable declarations
  semantic_var_lines <-
    purrr::imap_chr(semantic, ~ {
      if (.x %in% names(primary)) {
        paste0("$", .y, ": $", .x, ";")
      } else {
        paste0("$", .y, ": ", .x, ";")
      }
    })

  lines <-
    c(
      "// This file is auto-generated. Do not edit directly.",
      "// Generated from theme/colors.json, theme/fonts.json, and theme/custom_theme.json.",
      "// Run R/generate_theme.R to regenerate.",
      "",
      "/*-- scss:defaults --*/",
      "",
      "// Color variables inlined from theme/colors.json",
      "// (must be declared before Bootstrap variable overrides — @import would be too late)",
      primary_var_lines,
      "",
      semantic_var_lines,
      "",
      "// ---------------------------------------------------------------------------",
      "// Bootstrap font-family overrides",
      "// ---------------------------------------------------------------------------",
      paste0('$font-family-sans-serif:  ', body_font_stack, ' !default;'),
      paste0('$headings-font-family:    ', heading_font_stack, ' !default;'),
      paste0('$font-family-monospace:   ', mono_font_stack, ' !default;'),
      "",
      "// ---------------------------------------------------------------------------",
      "// Bootstrap font-size overrides  (reading sizes — smaller than presentation)",
      "// ---------------------------------------------------------------------------",
      paste0("$font-size-base:          ", sz$mainFontSize,   " !default;"),
      paste0("$h1-font-size:            ", sz$heading1Size,   " !default;"),
      paste0("$h2-font-size:            ", sz$heading2Size,   " !default;"),
      paste0("$h3-font-size:            ", sz$heading3Size,   " !default;"),
      paste0("$h4-font-size:            ", sz$heading4Size,   " !default;"),
      paste0("$h5-font-size:            ", sz$heading5Size,   " !default;"),
      paste0("$h6-font-size:            ", sz$heading6Size,   " !default;"),
      paste0("$line-height-base:        ", sz$bodyLineHeight,    " !default;"),
      paste0("$headings-line-height:    ", sz$headingLineHeight, " !default;"),
      paste0("$headings-font-weight:    ", wt$headingFontWeight, " !default;"),
      "",
      "// ---------------------------------------------------------------------------",
      "// Bootstrap color overrides",
      "// ---------------------------------------------------------------------------",
      "$primary:           $indigo_velvet !default;",
      "$body-color:        $textColor !default;",
      "$body-bg:           $backgroundColor !default;",
      "$link-color:        $linkColor !default;",
      "$headings-color:    $headingColor !default;",
      "$code-color:        $codeColor !default;",
      "$pre-bg:            $codeBackgroundColor !default;",
      "",
      "// ---------------------------------------------------------------------------",
      "// Quarto callout colour overrides (set before Quarto processes its defaults)",
      "// ---------------------------------------------------------------------------",
      "$callout-color-note:      $indigo_velvet;",
      "$callout-color-tip:       $amethyst;",
      "$callout-color-warning:   $orange;",
      "$callout-color-important: $indigo_velvet;",
      "$callout-color-caution:   $orange;",
      "",
      "",
      "/*-- scss:rules --*/",
      "",
      "// ---------------------------------------------------------------------------",
      "// Code blocks",
      "// ---------------------------------------------------------------------------",
      "pre.sourceCode {",
      paste0("  border-radius: ", cd$codeBorderRadius, ";"),
      paste0("  line-height:   ", cd$codeLineHeight, ";"),
      "}",
      "",
      "code {",
      paste0("  padding: ", cd$inlineCodePadding, ";"),
      paste0("  border-radius: ", cd$codeBorderRadius, ";"),
      "  color: $codeColor;",
      "}",
      "",
      "// Override Bootstrap 5 CSS custom property (flatly sets --bs-code-color independently)",
      ":root {",
      "  --bs-code-color: #{$codeColor};",
      "}",
      "",
      "// ---------------------------------------------------------------------------",
      "// Blockquotes",
      "// ---------------------------------------------------------------------------",
      "blockquote {",
      "  background-color: $blockquoteBackground;",
      paste0("  border-left: ", bq$blockquoteBorderWidth, " solid $blockquoteBorderColor;"),
      paste0("  padding: ", bq$blockquotePadding, ";"),
      paste0("  border-radius: ", bq$blockquoteBorderRadius, ";"),
      paste0("  margin: ", bq$blockquoteMargin, ";"),
      paste0("  box-shadow: ", sh$blockquoteShadow, ";"),
      "  font-style: normal;",
      "}",
      "",
      "blockquote p {",
      "  color: $blockquoteTextColor;",
      "}",
      "",
      "// ---------------------------------------------------------------------------",
      "// Tables (use .table selector for Bootstrap specificity)",
      "// ---------------------------------------------------------------------------",
      ".table thead th {",
      "  background-color: $tableHeaderBackground !important;",
      "  color: $tableHeaderColor !important;",
      paste0("  padding: ", tb$tableCellPadding, ";"),
      "}",
      "",
      ".table tbody td {",
      paste0("  padding: ", tb$tableCellPadding, ";"),
      "}",
      "",
      ".table > thead {",
      "  border-bottom: 2px solid $tableBorderColor;",
      "}",
      "",
      "// ---------------------------------------------------------------------------",
      "// Utility — text sizes",
      "// ---------------------------------------------------------------------------",
      ".text-smaller { font-size: 0.85em; }",
      ".text-tiny    { font-size: 0.75em; }",
      ".text-larger  { font-size: 1.15em; }",
      "",
      "// ---------------------------------------------------------------------------",
      "// Tabsets (.panel-tabset)",
      "// ---------------------------------------------------------------------------",
      ".panel-tabset .nav-tabs .nav-link {",
      "  background-color: $light_gray;",
      "  color: $graphite;",
      "  border: 1px solid rgba(0, 0, 0, 0.12);",
      "  border-bottom: none;",
      "  border-radius: 6px 6px 0 0;",
      "  transition: background-color 0.15s, color 0.15s;",
      "}",
      "",
      ".panel-tabset .nav-tabs .nav-link:hover {",
      "  background-color: $amethyst;",
      "  color: $white;",
      "  border-color: $amethyst;",
      "}",
      "",
      ".panel-tabset .nav-tabs .nav-link.active {",
      "  background-color: $indigo_velvet;",
      "  color: $white;",
      "  border-color: $indigo_velvet;",
      "}",
      "",
      "// ---------------------------------------------------------------------------",
      "// Glossary tooltips",
      "// ---------------------------------------------------------------------------",
      "a.glossary .def {",
      "  border: 1px solid rgba(93, 40, 144, 0.25);",
      "  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.12);",
      "  border-radius: 4px;",
      "}",
      ""
    )

  writeLines(lines, con = output_file)
  message("theme/skripta_theme.scss generated successfully\n")
}
