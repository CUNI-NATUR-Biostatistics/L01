# This file is auto-generated from theme/colors.json and theme/fonts.json.
# Do not edit directly. Run R/generate_theme.R to regenerate.

#----------------------------------------------------------#
# Biostatistics Brand R Theme Settings
#----------------------------------------------------------#

# Packages -----
if (!require("ggplot2"))  stop("ggplot2 package is required")
if (!require("sysfonts")) stop("sysfonts package is required")
if (!require("showtext")) stop("showtext package is required")

# Load Google Fonts -----
sysfonts::font_add_google("Inter", "biostat_body")
sysfonts::font_add_google("Source Sans 3", "biostat_heading")
sysfonts::font_add_google("JetBrains Mono", "biostat_mono")
showtext::showtext_auto()
showtext::showtext_opts(dpi = 300)  # align font metric DPI with ggsave save DPI

# Colour palette -----
biostat_cols <- c(
  parchment = "#F4F1EC",
  graphite = "#2E2E2E",
  grey_olive = "#8A8A8A",
  indigo_velvet = "#5D2890",
  amethyst = "#86579E",
  orange = "#F3A712",
  white = "#FFFFFF",
  light_gray = "#F0EDE8"
)

biostat_primary_sequence <- c("#5D2890", "#86579E", "#F3A712")
biostat_diverging         <- c("#5D2890", "#FFFFFF", "#F3A712")

biostat_text_color       <- "#2E2E2E"
biostat_background_color <- "#F4F1EC"
biostat_accent_color     <- "#86579E"

# ggplot2 colour scales -----
scale_colour_biostat <- function(...) {
  ggplot2::scale_colour_manual(values = biostat_cols, ...)
}

scale_fill_biostat <- function(...) {
  ggplot2::scale_fill_manual(values = biostat_cols, ...)
}

# Font references -----
biostat_base_font    <- "biostat_body"
biostat_heading_font <- "biostat_heading"
biostat_mono_font    <- "biostat_mono"

# Text size constants -----
text_size_base <- 22.5
text_size_small  <- text_size_base * 0.85
text_size_large  <- text_size_base * 1.15

# Image dimension defaults -----
image_width  <- 16
image_height <- 12
image_units  <- "cm"
image_dpi    <- 300

# ggplot2 theme -----
theme_biostat <- function(
  base_size   = 11,
  base_family = biostat_base_font
) {
  is_html_output <-
    requireNamespace("knitr", quietly = TRUE) && knitr::is_html_output()

  output_background <-
    if (is_html_output) {
      biostat_background_color
    } else {
      biostat_cols[["white"]]
    }

  panel_background <-
    if (is_html_output) {
      biostat_cols[["white"]]
    } else {
      biostat_background_color
    }

  ggplot2::theme_bw(
    base_size   = base_size,
    base_family = base_family
  ) +
  ggplot2::theme(
    text             = ggplot2::element_text(family = biostat_base_font, colour = "#2E2E2E"),
    plot.title       = ggplot2::element_text(family = biostat_heading_font, colour = "#5D2890",
                         face = "bold",
                         size = ggplot2::rel(1.4)),
    plot.subtitle    = ggplot2::element_text(size = ggplot2::rel(1.1)),
    axis.title       = ggplot2::element_text(size = ggplot2::rel(1)),
    axis.text        = ggplot2::element_text(size = ggplot2::rel(0.9)),
    legend.title     = ggplot2::element_text(size = ggplot2::rel(1)),
    legend.text      = ggplot2::element_text(size = ggplot2::rel(0.9)),
    legend.background = ggplot2::element_rect(fill = output_background, colour = NA),
    legend.key       = ggplot2::element_rect(fill = panel_background, colour = NA),
    strip.text       = ggplot2::element_text(face = "bold"),
    axis.title.x     = ggplot2::element_text(margin = ggplot2::margin(t = 6)),
    axis.title.y     = ggplot2::element_text(margin = ggplot2::margin(r = 8)),
    panel.border     = ggplot2::element_blank(),
    axis.line        = ggplot2::element_line(colour = "#2E2E2E", linewidth = 0.4),
    panel.background = ggplot2::element_rect(fill = panel_background, colour = NA),
    plot.background  = ggplot2::element_rect(fill = output_background, colour = NA),
    panel.grid.minor = ggplot2::element_blank(),
    legend.position  = "bottom"
  )
}

ggplot2::theme_set(theme_biostat())

