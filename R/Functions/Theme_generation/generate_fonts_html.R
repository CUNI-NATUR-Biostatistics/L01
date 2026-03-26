#----------------------------------------------------------#
#
#
#                        _brand
#
#         Generate theme/fonts-include.html from
#                    theme/fonts.json
#
#        Canonical source — lecture repos download
#        this file from _brand at render time.
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

generate_fonts_html <- function(
  fonts_file = here::here("theme/fonts.json"),
  output_file = here::here("theme/fonts-include.html")
) {
  message("Generating theme/fonts-include.html...\n")

  if (!file.exists(fonts_file)) {
    stop("fonts.json not found at: ", fonts_file)
  }

  fonts <-
    jsonlite::fromJSON(fonts_file)

  make_link <- function(family, weights) {
    encoded_family <-
      gsub(" ", "+", family)
    paste0(
      '<link href="https://fonts.googleapis.com/css2?family=',
      encoded_family,
      ":wght@",
      weights,
      '&display=swap" rel="stylesheet">'
    )
  }

  lines <-
    c(
      "<!-- Auto-generated Google Fonts links from theme/fonts.json.",
      "     Do not edit directly. Run R/generate_theme.R to regenerate. -->",
      '<link rel="preconnect" href="https://fonts.googleapis.com">',
      '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>',
      make_link(fonts$body, fonts$googleFonts$bodyWeights),
      make_link(fonts$heading, fonts$googleFonts$headingWeights),
      make_link(fonts$monospace, fonts$googleFonts$monospaceWeights)
    )

  writeLines(lines, con = output_file)
  message("theme/fonts-include.html generated successfully\n")
}
