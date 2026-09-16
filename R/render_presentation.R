#----------------------------------------------------------#
#
#
#                         _brand
#
#                  Render presentation
#
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

library(here)
library(quarto)
library(fs)

if (!isTRUE(getOption("biostat.theme_sync_complete"))) {
  source(here::here("R", "generate_theme.R"))
}

source(here::here("R", "Functions", "render_presentation_outputs.R"))
render_presentation_outputs()

if (file.exists(here::here("pollslive", "config.json"))) {
  message(
    "\nTo present live embeds from the rendered HTML, run:\n",
    "  Rscript R/serve_presentation.R\n"
  )
}
