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

# Render -----
quarto::quarto_render(
  input = here::here("Learning_materials", "skripta.qmd")
)

# compress the PDF to make it small enough to upload to GH
qpdf::pdf_compress(
  input = here::here("Learning_materials", "skripta_raw.pdf"),
  output = here::here("Learning_materials", "skripta.pdf")
)
