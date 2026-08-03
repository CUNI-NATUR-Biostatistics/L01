#----------------------------------------------------------#
#
#
#                         _brand
#
#                   Render Skripta
#
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

# Setup -----

library(here)
library(quarto)
library(fs)

# Synchronize the shared brand before every standalone render. `render_all.R`
# performs this once for both outputs and sets the temporary option below so
# its child render scripts do not repeat the work.
if (!isTRUE(getOption("biostat.theme_sync_complete"))) {
  source(here::here("R", "generate_theme.R"))
}

# Render -----
quarto::quarto_render(
  input = here::here("Learning_materials", "skripta.qmd")
)

# compress the PDF to make it small enough to upload to GH
qpdf::pdf_compress(
  input = here::here("Learning_materials", "skripta_raw.pdf"),
  output = here::here("Learning_materials", "skripta.pdf")
)
