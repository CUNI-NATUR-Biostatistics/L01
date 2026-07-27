#----------------------------------------------------------#
#
#
#                        _brand
#
#           Generate theme/_colors.scss from
#                   theme/colors.json
#
#        Canonical source — lecture repos download
#        this file from _brand at render time.
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

generate_colors_scss <- function(
  colors_file = here::here("theme/colors.json"),
  output_file = here::here("theme/_colors.scss")
) {
  message("Generating theme/_colors.scss...\n")

  if (!file.exists(colors_file)) {
    stop("colors.json not found at: ", colors_file)
  }

  colors_data <-
    jsonlite::fromJSON(colors_file)

  primary <- colors_data$primary
  semantic <- colors_data$semantic

  # Calculate relative luminance and return a contrasting hex colour
  contrast_for <- function(hex) {
    hex <- sub("^#", "", hex)
    r <- strtoi(substr(hex, 1L, 2L), 16L) / 255
    g <- strtoi(substr(hex, 3L, 4L), 16L) / 255
    b <- strtoi(substr(hex, 5L, 6L), 16L) / 255
    # Linear luminance (sRGB approximation)
    lum <- 0.2126 * r + 0.7152 * g + 0.0722 * b
    if (lum > 0.45) primary[["graphite"]] else primary[["white"]]
  }

  # Primary color SCSS variable declarations
  primary_vars <-
    purrr::imap_chr(primary, ~ paste0("$", .y, ": ", .x, ";"))

  # Semantic color SCSS variable declarations (reference primary vars by name)
  semantic_vars <-
    purrr::imap_chr(semantic, ~ {
      if (.x %in% names(primary)) {
        paste0("$", .y, ": $", .x, ";")
      } else {
        paste0("$", .y, ": ", .x, ";")
      }
    })

  # Utility CSS classes per primary colour
  utility_classes <-
    purrr::imap(primary, function(hex, name) {
      contrast <- contrast_for(hex)
      c(
        paste0("// --- ", name, " ---"),
        paste0(".bg-", name, " { background-color: ", hex, "; }"),
        paste0(".text-color-", name, " { color: ", hex, " !important; }"),
        paste0(
          ".text-hgl-", name, " { ",
          "background-color: ", hex, "; ",
          "color: ", contrast, "; ",
          "padding: 2px 6px; ",
          "border-radius: 5px; }"
        ),
        paste0(
          ".text-bg-", name, " { ",
          "background-color: ", hex, "; ",
          "padding: 2px 6px; ",
          "border-radius: 5px; }"
        ),
        ""
      )
    }) |>
    unlist()

  lines <-
    c(
      "// This file is auto-generated from theme/colors.json. Do not edit directly.",
      "// Run R/generate_theme.R to regenerate.",
      "",
      "// ===========================================================================",
      "// PRIMARY COLOR VARIABLES",
      "// ===========================================================================",
      primary_vars,
      "",
      "// ===========================================================================",
      "// SEMANTIC COLOR VARIABLES",
      "// ===========================================================================",
      semantic_vars,
      "",
      "// Contrast helpers (used in utility classes)",
      "$contrastColorDark: $graphite;",
      "$contrastColorLight: $white;",
      "",
      "// ===========================================================================",
      "// UTILITY CLASSES",
      "// ===========================================================================",
      utility_classes,
      "// Semantic shorthands",
      ".text-color-body    { color: $bodyColor    !important; }",
      ".text-color-heading { color: $headingColor !important; }",
      ".text-color-link    { color: $linkColor    !important; }",
      ".text-color-accent  { color: $accentColor  !important; }",
      ""
    )

  writeLines(lines, con = output_file)
  message("theme/_colors.scss generated successfully\n")
}
