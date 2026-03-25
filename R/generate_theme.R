#----------------------------------------------------------#
#
#
#                     L - example
#
#               Theme Generation Script
#       Reads JSON config files and generates all
#       theme artefacts (SCSS, HTML, Typst, R).
#
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#
# Run this script before (re-)rendering to propagate any
# colour or font changes to all output formats.
# Alternatively, source it from R/render_all.R.

# Setup -----

library(here)
library(jsonlite)
library(purrr)

# Source helper functions -----

message("Loading theme generation functions...\n")

c(
  "generate_colors_scss.R",
  "generate_fonts_html.R",
  "generate_presentation_theme.R",
  "generate_skripta_html_theme.R",
  "generate_skripta_typst_theme.R",
  "generate_r_theme.R"
) |>
  purrr::walk(
    .f = ~ source(here::here("R/Functions/Theme_generation", .x))
  )

message("All functions loaded.\n\n")

# Generate theme artefacts -----

message("Starting theme generation...\n\n")

tryCatch(
  expr = {
    generate_colors_scss()
    generate_fonts_html()
    generate_presentation_theme()
    generate_skripta_html_theme()
    generate_skripta_typst_theme()
    generate_r_theme()

    message("\nTheme generation complete. Generated files:\n")
    message("  theme/_colors.scss\n")
    message("  theme/fonts-include.html\n")
    message("  theme/presentation_theme.scss\n")
    message("  theme/skripta_theme.scss\n")
    message("  Learning_materials/skripta_theme.typ\n")
    message("  R/set_r_theme.R\n")
  },
  error = function(e) {
    message("\nERROR: Theme generation failed!\n")
    message(paste("Error:", e$message, "\n"))
    stop(e)
  }
)
