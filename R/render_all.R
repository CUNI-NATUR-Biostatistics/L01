#----------------------------------------------------------#
#
#
#                         _brand
#
#                  Render all files
#
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

# Setup -----

library(here)

# Synchronize once, then render both outputs without repeating the download
# and generation step performed by each standalone render script.
local({
  source(here::here("R", "generate_theme.R"))

  previous_sync_option <-
    getOption("biostat.theme_sync_complete")
  options(biostat.theme_sync_complete = TRUE)
  on.exit(
    options(biostat.theme_sync_complete = previous_sync_option),
    add = TRUE
  )

  source(here::here("R", "render_presentation.R"))
  source(here::here("R", "render_skripta.R"))
})
