#----------------------------------------------------------#
#
#
#                        _brand
#
#        Generate R/set_r_theme.R from
#       theme/colors.json and theme/fonts.json
#
#        Canonical source — lecture repos download
#        this file from _brand at render time.
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

generate_r_theme <- function(
  colors_file = here::here("theme/colors.json"),
  fonts_file = here::here("theme/fonts.json"),
  output_file = here::here("R/set_r_theme.R")
) {
  message("Generating R/set_r_theme.R...\n")

  if (!file.exists(colors_file)) {
    stop("colors.json not found at: ", colors_file)
  }
  if (!file.exists(fonts_file)) {
    stop("fonts.json not found at: ", fonts_file)
  }

  colors_data <-
    jsonlite::fromJSON(colors_file)
  fonts <-
    jsonlite::fromJSON(fonts_file)

  primary <- colors_data$primary
  semantic <- colors_data$semantic

  # Resolve a semantic colour reference to its hex value
  resolve_hex <- function(semantic_name) {
    ref <- semantic[[semantic_name]]
    if (!is.null(ref) && ref %in% names(primary)) primary[[ref]] else ref
  }

  text_color <- resolve_hex("textColor")
  bg_color <- resolve_hex("backgroundColor")
  heading_color <- resolve_hex("headingColor")
  accent_color <- resolve_hex("accentColor")

  # Named colour vector entries, comma-terminated except last
  color_entries <-
    purrr::imap_chr(primary, ~ paste0('  ', .y, ' = "', .x, '"'))
  color_entries[-length(color_entries)] <-
    paste0(color_entries[-length(color_entries)], ",")

  # Non-neutral palette colours (exclude white / grays / black) for sequences
  neutral_names <- c("white", "light_gray", "graphite", "parchment", "grey_olive")
  accent_colors <-
    primary[!names(primary) %in% neutral_names]

  primary_seq_hex <-
    if (length(accent_colors) >= 3) {
      paste0('"', accent_colors[1:3], '"', collapse = ", ")
    } else {
      paste0('"', accent_colors, '"', collapse = ", ")
    }

  diverging_hex <-
    if (length(accent_colors) >= 2) {
      paste0(
        '"', accent_colors[[1]], '", "',
        primary[["white"]], '", "',
        accent_colors[[length(accent_colors)]], '"'
      )
    } else {
      paste0('"', accent_colors[[1]], '", "', primary[["white"]], '", "', accent_colors[[1]], '"')
    }

  # Convert presentation px base size to pt (approx. at 96 DPI)
  px_val <-
    as.numeric(gsub("px", "", fonts$presentationSizes$mainFontSize))
  pt_base <- round(px_val * 0.75, 1)

  ggplot_sz <- fonts$ggplot

  lines <-
    c(
      "# This file is auto-generated from theme/colors.json and theme/fonts.json.",
      "# Do not edit directly. Run R/generate_theme.R to regenerate.",
      "",
      "#----------------------------------------------------------#",
      "# Biostatistics Brand R Theme Settings",
      "#----------------------------------------------------------#",
      "",
      "# Packages -----",
      'if (!require("ggplot2"))  stop("ggplot2 package is required")',
      'if (!require("sysfonts")) stop("sysfonts package is required")',
      'if (!require("showtext")) stop("showtext package is required")',
      "",
      "# Load Google Fonts -----",
      paste0('sysfonts::font_add_google("', fonts$body,      '", "', fonts$system$internalBodyName,    '")'),
      paste0('sysfonts::font_add_google("', fonts$heading,   '", "', fonts$system$internalHeadingName, '")'),
      paste0('sysfonts::font_add_google("', fonts$monospace, '", "', fonts$system$internalMonoName,    '")'),
      "showtext::showtext_auto()",
      "",
      "# Colour palette -----",
      "biostat_cols <- c(",
      color_entries,
      ")",
      "",
      paste0("biostat_primary_sequence <- c(", primary_seq_hex, ")"),
      paste0("biostat_diverging         <- c(", diverging_hex, ")"),
      "",
      paste0('biostat_text_color       <- "', text_color,   '"'),
      paste0('biostat_background_color <- "', bg_color,     '"'),
      paste0('biostat_accent_color     <- "', accent_color, '"'),
      "",
      "# ggplot2 colour scales -----",
      "scale_colour_biostat <- function(...) {",
      "  ggplot2::scale_colour_manual(values = biostat_cols, ...)",
      "}",
      "",
      "scale_fill_biostat <- function(...) {",
      "  ggplot2::scale_fill_manual(values = biostat_cols, ...)",
      "}",
      "",
      "# Font references -----",
      paste0('biostat_base_font    <- "', fonts$system$internalBodyName,    '"'),
      paste0('biostat_heading_font <- "', fonts$system$internalHeadingName, '"'),
      paste0('biostat_mono_font    <- "', fonts$system$internalMonoName,    '"'),
      "",
      "# Text size constants -----",
      paste0("text_size_base <- ", pt_base),
      paste0("text_size_small  <- text_size_base * 0.85"),
      paste0("text_size_large  <- text_size_base * 1.15"),
      "",
      "# Image dimension defaults -----",
      "image_width  <- 16",
      "image_height <- 12",
      paste0('image_units  <- "', fonts$system$imageUnits, '"'),
      "image_dpi    <- 300",
      "",
      "# ggplot2 theme -----",
      "theme_biostat <- function(",
      "  base_size   = text_size_base,",
      "  base_family = biostat_base_font",
      ") {",
      "  ggplot2::theme_bw(",
      "    base_size   = base_size,",
      "    base_family = base_family",
      "  ) +",
      "  ggplot2::theme(",
      paste0('    text             = ggplot2::element_text(family = biostat_base_font, colour = "', text_color, '"),'),
      paste0('    plot.title       = ggplot2::element_text(family = biostat_heading_font, colour = "', heading_color, '",'),
      paste0('                         face = "', ggplot_sz$plotTitleFace, '",'),
      paste0("                         size = ggplot2::rel(", ggplot_sz$plotTitleSize, ")),"),
      paste0('    plot.subtitle    = ggplot2::element_text(size = ggplot2::rel(', ggplot_sz$plotSubtitleSize, ')),'),
      paste0('    axis.title       = ggplot2::element_text(size = ggplot2::rel(', ggplot_sz$axisTitleSize,    ')),'),
      paste0('    axis.text        = ggplot2::element_text(size = ggplot2::rel(', ggplot_sz$axisTextSize,     ')),'),
      paste0('    legend.title     = ggplot2::element_text(size = ggplot2::rel(', ggplot_sz$legendTitleSize,  ')),'),
      paste0('    legend.text      = ggplot2::element_text(size = ggplot2::rel(', ggplot_sz$legendTextSize,   ')),'),
      paste0('    strip.text       = ggplot2::element_text(face = "', ggplot_sz$stripTextFace, '"),'),
      paste0('    panel.background = ggplot2::element_rect(fill = "', bg_color, '", colour = NA),'),
      paste0('    plot.background  = ggplot2::element_rect(fill = "', bg_color, '", colour = NA),'),
      "    panel.grid.minor = ggplot2::element_blank(),",
      "    legend.position  = \"bottom\"",
      "  )",
      "}",
      "",
      "ggplot2::theme_set(theme_biostat())",
      ""
    )

  writeLines(lines, con = output_file)
  message("R/set_r_theme.R generated successfully\n")
}
