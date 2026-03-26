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

# Download theme JSON files from _brand (single source of truth) -----
# Lectures always pull the latest brand config at render time.
# If the download fails (no internet access), the existing cached local copy is used.

message("Downloading theme JSON files from _brand...\n\n")

brand_base_url <- "https://raw.githubusercontent.com/CUNI-NATUR-Biostatistics/_brand/main/quarto"

purrr::walk(
  .x = c("colors.json", "fonts.json", "custom_theme.json"),
  .f = ~ {
    url_src <-
      paste0(brand_base_url, "/", .x)
    path_dest <-
      here::here("theme", .x)
    tryCatch(
      expr = {
        download.file(url_src, path_dest, quiet = TRUE, mode = "wb")
        message("  Downloaded: ", .x, "\n")
      },
      error = function(e) {
        message(
          "  WARNING: Could not download ", .x,
          " — using cached copy.\n",
          "  (", e$message, ")\n"
        )
      }
    )
  }
)

message("\n")

# Download theme generation R functions from _brand (single source of truth) -----
# If the download fails (no internet access), the existing cached local copy is used.

message("Downloading theme generation functions from _brand...\n\n")

brand_functions_url <-
  "https://raw.githubusercontent.com/CUNI-NATUR-Biostatistics/_brand/main/R/Functions/Theme_generation"

dir.create(
  here::here("R/Functions/Theme_generation"),
  recursive = TRUE,
  showWarnings = FALSE
)

purrr::walk(
  .x = c(
    "generate_colors_scss.R",
    "generate_fonts_html.R",
    "generate_presentation_theme.R",
    "generate_skripta_html_theme.R",
    "generate_skripta_typst_theme.R",
    "generate_r_theme.R"
  ),
  .f = ~ {
    url_src <-
      paste0(brand_functions_url, "/", .x)
    path_dest <-
      here::here("R/Functions/Theme_generation", .x)
    tryCatch(
      expr = {
        download.file(url_src, path_dest, quiet = TRUE, mode = "wb")
        message("  Downloaded: ", .x, "\n")
      },
      error = function(e) {
        message(
          "  WARNING: Could not download ", .x,
          " \u2014 using cached copy.\n",
          "  (", e$message, ")\n"
        )
      }
    )
  }
)

message("\n")

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
    .f = ~ source(
      here::here(
        "R/Functions/Theme_generation", .x
      )
    )
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
