#----------------------------------------------------------#
#
#
#                         _brand
#
#           Render glossary term with plain-text
#                fallback for non-HTML formats
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

#' Render a glossary term with format-aware output
#'
#' Wraps \code{glossary::glossary()} for HTML output and falls back to
#' plain display text for non-HTML formats (e.g. typst/PDF). Use this
#' function in inline R expressions inside \code{.qmd} files wherever a
#' glossary hover-tooltip is desired in HTML but the document also
#' renders to typst.
#'
#' @param slug Character scalar. The glossary entry slug (key) used by
#'   \code{glossary::glossary()}, e.g. \code{"median"} or
#'   \code{"boxplot"}.
#' @param display Character scalar. The human-readable label shown in the
#'   rendered text. Defaults to \code{slug} when not supplied.
#'
#' @return A character scalar: an HTML glossary widget when rendering to
#'   HTML output, or the plain \code{display} string otherwise.
render_glossary_term <- function(slug, display = slug) {
  if (knitr::is_html_output()) {
    glossary_file <- glossary::glossary_path()
    if (is.character(glossary_file) && length(glossary_file) == 1L &&
        file.exists(glossary_file)) {
      entry <- yaml::read_yaml(glossary_file)[[slug]]
      definition <- if (is.list(entry)) entry[["def"]] else entry
      if (is.null(definition)) definition <- ""
      res_term <- glossary::glossary(
        term = slug,
        display = display,
        def = definition
      )
    } else {
      res_term <- glossary::glossary(term = slug, display = display)
    }
  } else {
    res_term <- display
  }

  return(res_term)
}
