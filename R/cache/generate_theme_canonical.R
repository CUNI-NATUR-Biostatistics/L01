#----------------------------------------------------------#
#
#
#                         _brand
#
#              Canonical Theme Generation Script
#         Reads JSON config files and generates all
#         theme artefacts (SCSS, HTML, Typst, R).
#         Also downloads render helper scripts from
#         _brand so every lesson repo stays in sync.
#
#         This is the single source of truth for all
#         lesson repos (L00-L12, _L-template).
#         Each repo bootstraps this script at render time.
#
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#
# The bootstrapper in each repo's R/generate_theme.R
# downloads this file and sources it. On failure it falls
# back to the local R/cache/generate_theme_canonical.R.

# Setup -----

library(here)
library(jsonlite)
library(purrr)

# Download theme JSON files from _brand (single source of truth) -----
# Lectures always pull the latest brand config at render time.
# If the download fails (no internet access), the existing cached local copy is used.

message("Downloading theme JSON files from _brand...\n\n")

brand_base_url <-
  "https://raw.githubusercontent.com/CUNI-NATUR-Biostatistics/_brand/main/quarto"

purrr::walk(
  .x = c("colors.json", "fonts.json", "custom_theme.json"),
  .f = ~ {
    url_src <-
      paste0(brand_base_url, "/", .x)
    path_dest <-
      here::here("theme", .x)
    local_path <-
      file.path(dirname(here::here()), "_brand", "quarto", .x)
    if (file.exists(local_path)) {
      file.copy(local_path, path_dest, overwrite = TRUE)
      message("  Copied from local _brand: ", .x, "\n")
    } else {
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
  }
)

message("\n")

# Download theme generation R functions from _brand (single source of truth) -----
# If the download fails (no internet access), the existing cached local copy is used.
# In the dev workspace the _brand/R/Functions/Theme_generation folder is a sibling
# of the current project; copy from there so that local edits take effect without
# a GitHub round-trip.

message("Downloading theme generation functions from _brand...\n\n")

brand_functions_url <-
  "https://raw.githubusercontent.com/CUNI-NATUR-Biostatistics/_brand/main/R/Functions/Theme_generation"

brand_functions_local <-
  normalizePath(
    file.path(dirname(here::here()), "_brand", "R", "Functions", "Theme_generation"),
    mustWork = FALSE
  )

dir.create(
  here::here("R", "Functions", "Theme_generation"),
  recursive = TRUE,
  showWarnings = FALSE
)

purrr::walk(
  .x = c(
    "generate_colors_scss.R",
    "generate_fonts_html.R",
    "generate_presentation_theme.R",
    "generate_presentation_components.R",
    "generate_skripta_html_theme.R",
    "generate_skripta_typst_theme.R",
    "generate_r_theme.R"
  ),
  .f = ~ {
    path_dest <-
      here::here("R", "Functions", "Theme_generation", .x)
    local_src <-
      file.path(brand_functions_local, .x)

    if (file.exists(local_src)) {
      # Dev workspace: copy from local _brand to avoid GitHub round-trip
      file.copy(local_src, path_dest, overwrite = TRUE)
      message("  Copied from local _brand: ", .x, "\n")
    } else {
      url_src <-
        paste0(brand_functions_url, "/", .x)
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
  }
)

message("\n")

# Download render helper scripts from _brand (single source of truth) -----
# If the download fails (no internet access), the existing cached local copy is used.

message("Downloading render helper scripts from _brand...\n\n")

brand_r_url <-
  "https://raw.githubusercontent.com/CUNI-NATUR-Biostatistics/_brand/main/R"

purrr::walk(
  .x = c("render_all.R", "render_presentation.R", "render_skripta.R"),
  .f = ~ {
    url_src <-
      paste0(brand_r_url, "/", .x)
    path_dest <-
      here::here("R", .x)
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

dir.create(
  here::here("R", "Functions"),
  recursive = TRUE,
  showWarnings = FALSE
)

tryCatch(
  expr = {
    download.file(
      paste0(brand_r_url, "/Functions/render_glossary_term.R"),
      here::here("R", "Functions", "render_glossary_term.R"),
      quiet = TRUE,
      mode = "wb"
    )
    message("  Downloaded: render_glossary_term.R\n")
  },
  error = function(e) {
    message(
      "  WARNING: Could not download render_glossary_term.R",
      " \u2014 using cached copy.\n",
      "  (", e$message, ")\n"
    )
  }
)

message("\n")

# Download Lua helper filters from _brand (single source of truth) -----
# If the download fails (no internet access), the existing cached local copy is used.

message("Downloading Lua helper filters from _brand...\n\n")

tryCatch(
  expr = {
    download.file(
      "https://raw.githubusercontent.com/CUNI-NATUR-Biostatistics/_brand/main/lua/rn-shorthand.lua",
      here::here("theme", "rn-shorthand.lua"),
      quiet = TRUE,
      mode = "wb"
    )
    message("  Downloaded: rn-shorthand.lua\n")
  },
  error = function(e) {
    local_path <-
      file.path(dirname(here::here()), "_brand", "lua", "rn-shorthand.lua")
    if (file.exists(local_path)) {
      file.copy(local_path, here::here("theme", "rn-shorthand.lua"), overwrite = TRUE)
      message("  Copied from local _brand: rn-shorthand.lua\n")
    } else {
      message(
        "  WARNING: Could not download rn-shorthand.lua and no local copy found.\n",
        "  (", e$message, ")\n"
      )
    }
  }
)

message("\n")

# Source helper functions -----

message("Loading theme generation functions...\n")

c(
  "generate_colors_scss.R",
  "generate_fonts_html.R",
  "generate_presentation_theme.R",
  "generate_presentation_components.R",
  "generate_skripta_html_theme.R",
  "generate_skripta_typst_theme.R",
  "generate_r_theme.R"
) |>
  purrr::walk(
    .f = ~ source(here::here("R", "Functions", "Theme_generation", .x))
  )

message("All functions loaded.\n\n")

# Generate theme artefacts -----

message("Starting theme generation...\n\n")

tryCatch(
  expr = {
    generate_colors_scss()
    generate_fonts_html()
    generate_presentation_theme()
    generate_presentation_components()
    generate_skripta_html_theme()
    generate_skripta_typst_theme()
    generate_r_theme()

    message("\nTheme generation complete. Generated files:\n")
    message("  theme/_colors.scss\n")
    message("  theme/fonts-include.html\n")
    message("  theme/presentation_theme.scss\n")
    message("  theme/presentation_components.scss\n")
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
