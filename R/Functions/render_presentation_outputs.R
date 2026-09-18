# Render RevealJS and its static PDF variant, then publish outputs together.

render_presentation_outputs <- function() {
  source(here::here("R", "prepare_pollslive_quiz.R"))
  source(here::here("R", "Functions", "prepare_presentation_variant.R"))
  quiz <- prepare_pollslive_quiz()

  source_qmd <- here::here("Presentation", "presentation.qmd")
  presentation_directory <- dirname(source_qmd)
  live_qmd <- file.path(presentation_directory, ".presentation-live.qmd")
  live_html <- file.path(presentation_directory, ".presentation-live.html")
  static_qmd <- file.path(presentation_directory, ".presentation-static.qmd")
  static_html <- file.path(presentation_directory, ".presentation-static.html")
  raw_pdf <- file.path(presentation_directory, ".presentation-raw.pdf")
  final_pdf <- file.path(presentation_directory, ".presentation-final.pdf")
  temporary_files <-
    c(live_qmd, live_html, static_qmd, static_html, raw_pdf, final_pdf)
  unlink(temporary_files, force = TRUE)
  on.exit(unlink(temporary_files, force = TRUE), add = TRUE)

  live_variant <-
    if (!isTRUE(quiz$enabled)) {
      NULL
    } else if (identical(quiz$mode, "offline")) {
      "offline"
    } else {
      "active"
    }
  prepare_presentation_variant(
    source_qmd = source_qmd,
    output_qmd = live_qmd,
    output_stem = ".presentation-live",
    quiz_variant = live_variant
  )
  quarto::quarto_render(input = live_qmd)

  prepare_presentation_variant(
    source_qmd = source_qmd,
    output_qmd = static_qmd,
    output_stem = ".presentation-static",
    quiz_variant = if (isTRUE(quiz$enabled)) "static" else NULL
  )
  quarto::quarto_render(input = static_qmd)

  decktape <-
    Sys.which(if (.Platform$OS.type == "windows") "decktape.cmd" else "decktape")
  if (!nzchar(decktape)) {
    stop("DeckTape is required to export the presentation PDF.")
  }
  status <- system2(
    command = decktape,
    args = c(
      "reveal", "--fragments=false",
      "--size", "1050x700",
      # `system2()` requires path arguments containing spaces to be quoted.
      shQuote(static_html),
      shQuote(raw_pdf)
    )
  )
  if (!identical(status, 0L)) {
    stop("DeckTape failed with status ", status, ".")
  }
  qpdf::pdf_compress(input = raw_pdf, output = final_pdf)

  final_html <- here::here("Presentation", "presentation.html")
  final_pdf_path <- here::here("Presentation", "presentation.pdf")
  docs_html <- here::here("docs", "index.html")
  dir.create(dirname(docs_html), recursive = TRUE, showWarnings = FALSE)
  if (!file.copy(live_html, final_html, overwrite = TRUE)) {
    stop("Could not publish presentation.html.")
  }
  if (!file.copy(final_pdf, final_pdf_path, overwrite = TRUE)) {
    stop("Could not publish presentation.pdf.")
  }
  if (!file.copy(live_html, docs_html, overwrite = TRUE)) {
    stop("Could not publish docs/index.html.")
  }

  invisible(
    list(html = final_html, pdf = final_pdf_path, docs = docs_html, quiz = quiz)
  )
}
