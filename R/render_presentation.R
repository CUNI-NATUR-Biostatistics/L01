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

# Setup -----

library(here)
library(quarto)

# Synchronize the shared brand before every standalone render. `render_all.R`
# performs this once for both outputs and sets the temporary option below so
# its child render scripts do not repeat the work.
if (!isTRUE(getOption("biostat.theme_sync_complete"))) {
  source(here::here("R", "generate_theme.R"))
}

# Render -----
quarto::quarto_render(
  input = here::here("Presentation", "presentation.qmd")
)

# Make PDF version -----

# decktape needs to be installed separately.
# See https://github.com/astefanutti/decktape
system2(
  command = "decktape.cmd",
  args = c(
    "reveal", "--fragments=false",
    "--size 1050x700",
    here::here("Presentation", "presentation.html"),
    here::here("Presentation", "presentation_raw.pdf")
  )
)

# compress the PDF to make it small enough to upload to GH
qpdf::pdf_compress(
  input = here::here("Presentation", "presentation_raw.pdf"),
  output = here::here("Presentation", "presentation.pdf")
)
