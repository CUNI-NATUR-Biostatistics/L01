# Serve the already-rendered presentation over localhost so remote iframes work.

library(here)

here::i_am("R/serve_presentation.R")

node <- Sys.which("node")
if (!nzchar(node)) {
  stop("Node.js is required to serve the rendered presentation.")
}

server_script <- here::here("R", "serve_presentation.mjs")
if (!file.exists(server_script)) {
  stop("Missing presenter server: ", server_script)
}

status <- system2(
  command = node,
  args = c(shQuote(server_script), vapply(commandArgs(trailingOnly = TRUE), shQuote, character(1)))
)

if (!identical(status, 0L)) {
  stop("The presenter server exited with status ", status, ".")
}
