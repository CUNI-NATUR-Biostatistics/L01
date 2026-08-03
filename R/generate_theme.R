#----------------------------------------------------------#
#
#
#                      L - example
#
#             Theme Generation Bootstrapper
#       Downloads the canonical generate_theme.R from
#       _brand and sources it. Falls back to the
#       committed seed in R/cache/ if offline.
#
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

# Setup -----

library(here)

# Download and run canonical script from _brand -----

canonical_url <-
  paste0(
    "https://raw.githubusercontent.com/",
    "CUNI-NATUR-Biostatistics/_brand/main/R/generate_theme.R"
  )

canonical_cache <-
  here::here("R", "cache", "generate_theme_canonical.R")

dir.create(
  here::here("R", "cache"),
  showWarnings = FALSE,
  recursive = TRUE
)

# Prefer the sibling `_brand` repository during local development. Elsewhere,
# download to a temporary file and preserve the committed cache on failure.
local_brand_canonical <-
  normalizePath(
    file.path(dirname(here::here()), "_brand", "R", "generate_theme.R"),
    mustWork = FALSE
  )

if (file.exists(local_brand_canonical)) {
  file.copy(local_brand_canonical, canonical_cache, overwrite = TRUE)
  message("Using local _brand canonical script\n")
} else {
  tryCatch(
    expr = {
      tmp <-
        tempfile(fileext = ".R")
      download.file(canonical_url, tmp, quiet = TRUE, mode = "wb")
      file.copy(tmp, canonical_cache, overwrite = TRUE)
      unlink(tmp)
      message("Downloaded canonical generate_theme.R from _brand\n")
    },
    error = function(e) {
      message(
        "WARNING: Could not download canonical script",
        " \u2014 using cached copy.\n",
        "  (", e$message, ")\n"
      )
    }
  )
}

source(canonical_cache)
