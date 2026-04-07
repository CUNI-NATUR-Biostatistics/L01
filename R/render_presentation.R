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
library(fs)

# Render -----
quarto::quarto_render(
  input = here::here("Presentation", "presentation.qmd")
)

# Move the rendered file to the `docs` directory. -----

fs::file_copy(
  path = here::here("Presentation", "presentation.html"),
  new_path = here::here("docs", "index.html"),
  overwrite = TRUE
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
