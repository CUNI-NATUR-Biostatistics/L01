# Build a temporary presentation source whose YAML selects a temporary output.

prepare_presentation_variant <- function(
  source_qmd,
  output_qmd,
  output_stem,
  quiz_variant = NULL
) {
  source <- readLines(source_qmd, warn = FALSE, encoding = "UTF-8")
  output_lines <-
    which(
      trimws(source) %in%
        c(
          'output-file: "presentation"',
          "output-file: 'presentation'",
          "output-file: presentation"
        )
    )
  if (length(output_lines) != 1L) {
    stop("The presentation must declare exactly one output-file named presentation.")
  }
  indentation <- sub("^(\\s*).*$", "\\1", source[[output_lines]])
  source[[output_lines]] <-
    paste0(indentation, 'output-file: "', output_stem, '"')

  if (!is.null(quiz_variant)) {
    if (!quiz_variant %in% c("active", "static", "offline")) {
      stop("quiz_variant must be active, static, offline, or NULL.")
    }
    include_lines <- grepl("/active.qmd", source, fixed = TRUE)
    if (sum(include_lines) != 1L) {
      stop("The presentation must include exactly one generated PollsLive active.qmd file.")
    }
    source[include_lines] <-
      sub(
        "/active.qmd",
        paste0("/", quiz_variant, ".qmd"),
        source[include_lines],
        fixed = TRUE
      )
  }

  writeLines(source, output_qmd, useBytes = TRUE)
  invisible(output_qmd)
}
