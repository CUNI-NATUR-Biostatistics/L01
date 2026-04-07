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

# Regenerate all theme artefacts from JSON config files -----
# Edit theme/colors.json, theme/fonts.json, or theme/custom_theme.json,
# then rerun render_all.R — everything updates automatically.
source(
  here::here("R", "generate_theme.R")
)

source(
  here::here("R", "render_presentation.R")
)

source(
  here::here("R", "render_skripta.R")
)
