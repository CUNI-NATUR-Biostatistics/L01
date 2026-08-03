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

# Synchronization helpers -----

project_root <-
  normalizePath(here::here(), mustWork = TRUE)
local_brand_root <-
  normalizePath(
    file.path(dirname(project_root), "_brand"),
    mustWork = FALSE
  )

theme_sync_status <-
  character()

sync_brand_file <- function(
  file_label,
  url_src,
  path_dest,
  local_src = NA_character_
) {
  dir.create(
    dirname(path_dest),
    recursive = TRUE,
    showWarnings = FALSE
  )

  if (!is.na(local_src) && file.exists(local_src)) {
    source_path <- normalizePath(local_src, mustWork = TRUE)
    destination_path <- normalizePath(path_dest, mustWork = FALSE)

    if (identical(tolower(source_path), tolower(destination_path))) {
      message("  Using canonical local file: ", file_label, "\n")
      theme_sync_status[[file_label]] <<- "canonical-local"
      return(invisible("canonical-local"))
    }

    copied <-
      file.copy(local_src, path_dest, overwrite = TRUE)
    if (!copied) {
      stop("Could not copy local _brand file: ", file_label)
    }
    message("  Copied from local _brand: ", file_label, "\n")
    theme_sync_status[[file_label]] <<- "local"
    return(invisible("local"))
  }

  tmp <-
    tempfile(fileext = paste0("-", basename(path_dest)))
  on.exit(unlink(tmp), add = TRUE)

  tryCatch(
    expr = {
      download.file(url_src, tmp, quiet = TRUE, mode = "wb")
      if (!file.exists(tmp) || file.info(tmp)$size <= 0) {
        stop("downloaded file is empty")
      }
      copied <-
        file.copy(tmp, path_dest, overwrite = TRUE)
      if (!copied) {
        stop("download succeeded but the local cache could not be updated")
      }
      message("  Downloaded from _brand: ", file_label, "\n")
      theme_sync_status[[file_label]] <<- "remote"
      invisible("remote")
    },
    error = function(e) {
      if (!file.exists(path_dest)) {
        stop(
          "Could not synchronize ", file_label,
          " and no cached copy exists.\n  ",
          e$message
        )
      }
      message(
        "  WARNING: Could not synchronize ", file_label,
        "; using the committed cache, which may be stale.\n",
        "  (", e$message, ")\n"
      )
      theme_sync_status[[file_label]] <<- "cache"
      invisible("cache")
    }
  )
}

# Download theme JSON files from _brand (single source of truth) -----
# Lectures always pull the latest brand config at render time.
# If the download fails (no internet access), the existing cached local copy is used.

message("Downloading theme JSON files from _brand...\n\n")

brand_base_url <-
  "https://raw.githubusercontent.com/CUNI-NATUR-Biostatistics/_brand/main/quarto"

purrr::walk(
  .x = c("colors.json", "fonts.json", "custom_theme.json"),
  .f = ~ {
    sync_brand_file(
      file_label = paste0("theme/", .x),
      url_src = paste0(brand_base_url, "/", .x),
      path_dest = here::here("theme", .x),
      local_src = file.path(local_brand_root, "quarto", .x)
    )
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
  file.path(local_brand_root, "R", "Functions", "Theme_generation")

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
    sync_brand_file(
      file_label = paste0("R/Functions/Theme_generation/", .x),
      url_src = paste0(brand_functions_url, "/", .x),
      path_dest = here::here("R", "Functions", "Theme_generation", .x),
      local_src = file.path(brand_functions_local, .x)
    )
  }
)

message("\n")

# Download render helper scripts from _brand (single source of truth) -----
# If the download fails (no internet access), the existing cached local copy is used.

message("Downloading render helper scripts from _brand...\n\n")

brand_r_url <-
  "https://raw.githubusercontent.com/CUNI-NATUR-Biostatistics/_brand/main/R"
brand_r_local <-
  file.path(local_brand_root, "R")

purrr::walk(
  .x = c("render_all.R", "render_presentation.R", "render_skripta.R"),
  .f = ~ {
    sync_brand_file(
      file_label = paste0("R/", .x),
      url_src = paste0(brand_r_url, "/", .x),
      path_dest = here::here("R", .x),
      local_src = file.path(brand_r_local, .x)
    )
  }
)

dir.create(
  here::here("R", "Functions"),
  recursive = TRUE,
  showWarnings = FALSE
)

sync_brand_file(
  file_label = "R/Functions/render_glossary_term.R",
  url_src = paste0(brand_r_url, "/Functions/render_glossary_term.R"),
  path_dest = here::here("R", "Functions", "render_glossary_term.R"),
  local_src = file.path(brand_r_local, "Functions", "render_glossary_term.R")
)

message("\n")

# Download Lua helper filters from _brand (single source of truth) -----
# If the download fails (no internet access), the existing cached local copy is used.

message("Downloading Lua helper filters from _brand...\n\n")

sync_brand_file(
  file_label = "theme/rn-shorthand.lua",
  url_src = paste0(
    "https://raw.githubusercontent.com/",
    "CUNI-NATUR-Biostatistics/_brand/main/lua/rn-shorthand.lua"
  ),
  path_dest = here::here("theme", "rn-shorthand.lua"),
  local_src = file.path(local_brand_root, "lua", "rn-shorthand.lua")
)

sync_brand_file(
  file_label = "theme/semantic-boxes.lua",
  url_src = paste0(
    "https://raw.githubusercontent.com/",
    "CUNI-NATUR-Biostatistics/_brand/main/lua/semantic-boxes.lua"
  ),
  path_dest = here::here("theme", "semantic-boxes.lua"),
  local_src = file.path(local_brand_root, "lua", "semantic-boxes.lua")
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

    manifest_inputs <-
      c(
        "theme/colors.json",
        "theme/fonts.json",
        "theme/custom_theme.json",
        "theme/rn-shorthand.lua",
        "theme/semantic-boxes.lua",
        "R/cache/generate_theme_canonical.R",
        paste0(
          "R/Functions/Theme_generation/",
          c(
            "generate_colors_scss.R",
            "generate_fonts_html.R",
            "generate_presentation_theme.R",
            "generate_presentation_components.R",
            "generate_skripta_html_theme.R",
            "generate_skripta_typst_theme.R",
            "generate_r_theme.R"
          )
        ),
        "R/Functions/render_glossary_term.R",
        "R/render_all.R",
        "R/render_presentation.R",
        "R/render_skripta.R"
      )
    manifest_outputs <-
      c(
        "theme/_colors.scss",
        "theme/fonts-include.html",
        "theme/presentation_theme.scss",
        "theme/presentation_components.scss",
        "theme/skripta_theme.scss",
        "Learning_materials/skripta_theme.typ",
        "R/set_r_theme.R"
      )

    file_fingerprints <- function(paths) {
      hashes <-
        unname(tools::md5sum(here::here(paths)))
      stats::setNames(as.list(hashes), paths)
    }

    input_fingerprints <-
      file_fingerprints(manifest_inputs)
    output_fingerprints <-
      file_fingerprints(manifest_outputs)
    fingerprint_source <-
      tempfile(fileext = ".txt")
    writeLines(
      paste(
        names(input_fingerprints),
        unlist(input_fingerprints),
        sep = "="
      ),
      con = fingerprint_source
    )
    brand_fingerprint <-
      unname(tools::md5sum(fingerprint_source))
    unlink(fingerprint_source)

    jsonlite::write_json(
      x = list(
        schemaVersion = 1,
        fingerprintAlgorithm = "MD5",
        brandFingerprint = brand_fingerprint,
        inputs = input_fingerprints,
        generatedOutputs = output_fingerprints
      ),
      path = here::here("theme", "brand_manifest.json"),
      auto_unbox = TRUE,
      pretty = TRUE
    )

    message("\nTheme generation complete. Generated files:\n")
    message("  theme/_colors.scss\n")
    message("  theme/fonts-include.html\n")
    message("  theme/presentation_theme.scss\n")
    message("  theme/presentation_components.scss\n")
    message("  theme/skripta_theme.scss\n")
    message("  Learning_materials/skripta_theme.typ\n")
    message("  R/set_r_theme.R\n")
    message("  theme/brand_manifest.json\n")
    message("\nBrand fingerprint: ", brand_fingerprint, "\n")

    sync_counts <-
      table(theme_sync_status)
    message(
      "Theme source summary: ",
      paste(
        paste0(names(sync_counts), "=", as.integer(sync_counts)),
        collapse = ", "
      ),
      "\n"
    )
    if (any(theme_sync_status == "cache")) {
      warning(
        "Theme generation used one or more cached files. ",
        "The render completed, but the local brand may be stale."
      )
    }
  },
  error = function(e) {
    message("\nERROR: Theme generation failed!\n")
    message(paste("Error:", e$message, "\n"))
    stop(e)
  }
)
