#----------------------------------------------------------#
#
#
#                        _brand
#
#      Generate Presentation/presentation_theme.scss
#         from theme/fonts.json and
#              theme/custom_theme.json
#       (imports theme/_colors.scss for colors)
#
#        Canonical source — lecture repos download
#        this file from _brand at render time.
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

generate_presentation_theme <- function(
  fonts_file = here::here("theme/fonts.json"),
  custom_theme_file = here::here("theme/custom_theme.json"),
  output_file = here::here("theme/presentation_theme.scss")
) {
  message("Generating theme/presentation_theme.scss...\n")

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

  sz <- fonts$presentationSizes
  wt <- fonts$weights
  sp <- fonts$spacing
  pr <- ct$presentation
  cd <- ct$code
  bq <- ct$blockquote
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

  lines <-
    c(
      "// This file is auto-generated. Do not edit directly.",
      "// Generated from theme/fonts.json and theme/custom_theme.json.",
      "// Run R/generate_theme.R to regenerate.",
      "",
      "/*-- scss:defaults --*/",
      "",
      "// Shared colour variables (generated from theme/colors.json)",
      '@import "colors";',
      "",
      "// ---------------------------------------------------------------------------",
      "// Font families",
      "// ---------------------------------------------------------------------------",
      paste0('$mainFont:       ', body_font_stack, ' !default;'),
      paste0('$headingFont:    ', heading_font_stack, ' !default;'),
      paste0('$monospaceFont:  ', mono_font_stack, ' !default;'),
      "",
      "// ---------------------------------------------------------------------------",
      "// Font sizes  (large — optimised for projection)",
      "// ---------------------------------------------------------------------------",
      paste0("$mainFontSize:   ", sz$mainFontSize, " !default;"),
      paste0("$heading1Size:   ", sz$heading1Size, " !default;"),
      paste0("$heading2Size:   ", sz$heading2Size, " !default;"),
      paste0("$heading3Size:   ", sz$heading3Size, " !default;"),
      paste0("$heading4Size:   ", sz$heading4Size, " !default;"),
      "",
      "// ---------------------------------------------------------------------------",
      "// Line heights, weights, spacing",
      "// ---------------------------------------------------------------------------",
      paste0("$body-line-height:       ", sz$bodyLineHeight, " !default;"),
      paste0("$headingLineHeight:      ", sz$headingLineHeight, " !default;"),
      paste0("$headingFontWeight:      ", wt$headingFontWeight, " !default;"),
      paste0("$bodyFontWeight:         ", wt$bodyFontWeight, " !default;"),
      paste0("$headingLetterSpacing:   ", sp$headingLetterSpacing, " !default;"),
      "",
      "// ---------------------------------------------------------------------------",
      "// Slide spacing & heading style",
      "// ---------------------------------------------------------------------------",
      paste0("$smallMargin:            ", pr$smallMargin, " !default;"),
      paste0("$blockMargin:            ", pr$blockMargin, " !default;"),
      paste0("$largeMargin:            ", pr$largeMargin, " !default;"),
      paste0('$headingTextTransform:   ', pr$headingTextTransform, ' !default;'),
      paste0('$headingTextShadow:      ', pr$headingTextShadow, '  !default;'),
      paste0('$headingMargin:          ', pr$headingMargin, ' !default;'),
      "",
      "",
      "/*-- scss:rules --*/",
      "",
      "// ---------------------------------------------------------------------------",
      "// Body",
      "// ---------------------------------------------------------------------------",
      ".reveal {",
      "  color: $textColor;",
      "  background-color: $backgroundColor;",
      "}",
      "",
      "// ---------------------------------------------------------------------------",
      "// Headings",
      "// ---------------------------------------------------------------------------",
      ".reveal h1, .reveal h2, .reveal h3, .reveal h4, .reveal h5, .reveal h6 {",
      "  font-family: $headingFont;",
      "  font-weight: $headingFontWeight;",
      "  color: $headingColor;",
      "  letter-spacing: $headingLetterSpacing;",
      "  text-transform: $headingTextTransform;",
      "  text-shadow: $headingTextShadow;",
      "}",
      "",
      "// ---------------------------------------------------------------------------",
      "// Links",
      "// ---------------------------------------------------------------------------",
      ".reveal a {",
      "  color: $linkColor;",
      "}",
      "",
      "// ---------------------------------------------------------------------------",
      "// Inline code",
      "// ---------------------------------------------------------------------------",
      ".reveal code {",
      "  color: $codeColor;",
      "  background-color: $codeBackgroundColor;",
      paste0("  padding: ", cd$inlineCodePadding, ";"),
      paste0("  border-radius: ", cd$codeBorderRadius, ";"),
      "  font-family: $monospaceFont;",
      "}",
      "",
      "// ---------------------------------------------------------------------------",
      "// Code blocks",
      "// ---------------------------------------------------------------------------",
      ".reveal pre {",
      "  box-shadow: none;",
      "}",
      "",
      ".reveal pre code {",
      "  background-color: $codeBackgroundColor;",
      paste0("  border-radius: ", cd$codeBorderRadius, ";"),
      paste0("  line-height: ", cd$codeLineHeight, ";"),
      "  max-height: none;",
      "  overflow: visible !important;",
      "  white-space: pre-wrap;",
      "}",
      "",
      "// Hide scrollbars inside code blocks",
      ".reveal pre code::-webkit-scrollbar { display: none; }",
      "",
      "// ---------------------------------------------------------------------------",
      "// Tables",
      "// ---------------------------------------------------------------------------",
      ".reveal table th {",
      "  background-color: $tableHeaderBackground !important;",
      "  color: $tableHeaderColor !important;",
      "}",
      "",
      ".reveal table tr:nth-child(even) td {",
      "  background-color: $tableStripeBackground;",
      "}",
      "",
      "// ---------------------------------------------------------------------------",
      "// Blockquotes",
      "// ---------------------------------------------------------------------------",
      ".reveal blockquote {",
      "  background-color: $blockquoteBackground;",
      paste0("  border-left: ", bq$blockquoteBorderWidth, " solid $blockquoteBorderColor;"),
      paste0("  padding: ", bq$blockquotePadding, ";"),
      paste0("  border-radius: ", bq$blockquoteBorderRadius, ";"),
      paste0("  margin: ", bq$blockquoteMargin, ";"),
      paste0("  box-shadow: ", sh$blockquoteShadow, ";"),
      "  width: 90%;",
      "  font-style: normal;",
      "}",
      "",
      ".reveal blockquote p {",
      "  color: $blockquoteTextColor;",
      "}",
      "",
      "// ---------------------------------------------------------------------------",
      "// Utility — typography",
      "// ---------------------------------------------------------------------------",
      ".text-font-body      { font-family: $mainFont; }",
      ".text-font-heading   { font-family: $headingFont; }",
      ".text-font-monospace { font-family: $monospaceFont; }",
      paste0(".text-smaller { font-size: calc($mainFontSize * ", sz$textSizeSmall, ") !important; }"),
      paste0(".text-tiny    { font-size: calc($mainFontSize * ", sz$textSizeTiny,  ") !important; }"),
      paste0(".text-larger  { font-size: calc($mainFontSize * ", sz$textSizeLarge, ") !important; }"),
      ".text-bold    { font-weight: bold; }",
      ".text-center  { text-align: center; }",
      ".text-right   { text-align: right; }",
      "",
      "// ---------------------------------------------------------------------------",
      "// Utility — layout",
      "// ---------------------------------------------------------------------------",
      ".slide-margin-top-15 { margin-top: 15%; }",
      ".slide-margin-top-25 { margin-top: 25%; }",
      ".center-vertical {",
      "  position: absolute;",
      "  top: 50%;",
      "  transform: translateY(-50%);",
      "}",
      ""
    )

  writeLines(lines, con = output_file)
  message("theme/presentation_theme.scss generated successfully\n")
}
