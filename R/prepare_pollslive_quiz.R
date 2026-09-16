# Canonical opt-in PollsLive preparation for lesson presentation renders.

prepare_pollslive_quiz <- function(
  mode = Sys.getenv("POLLSLIVE_RENDER_MODE", unset = "sync")
) {
  cached <- getOption("biostat.pollslive_preparation")
  if (!is.null(cached)) {
    if (!identical(cached$mode, mode)) {
      stop(
        "PollsLive quiz preparation already ran in '", cached$mode,
        "' mode in this R session; refusing to reuse it for '", mode,
        "' mode. Start a new R session before changing POLLSLIVE_RENDER_MODE."
      )
    }
    return(invisible(cached))
  }

  config_path <- here::here("pollslive", "config.json")
  if (!file.exists(config_path)) {
    result <- list(enabled = FALSE, mode = "none")
    options(biostat.pollslive_preparation = result)
    return(invisible(result))
  }
  if (!mode %in% c("sync", "offline")) {
    stop("POLLSLIVE_RENDER_MODE must be 'sync' or 'offline'.")
  }

  config <- jsonlite::read_json(config_path, simplifyVector = TRUE)
  client_root <- acquire_pollslive_client(config, mode)
  node <- Sys.which("node")
  if (!nzchar(node)) {
    stop("Node.js is required for PollsLive quiz preparation.")
  }
  run_checked(
    command = node,
    args = c(
      file.path(client_root, "local.mjs"),
      "prepare",
      "--config", config_path,
      "--mode", mode
    ),
    working_directory = here::here()
  )
  result <- list(
    enabled = TRUE,
    mode = mode,
    config = config,
    client_root = client_root
  )
  options(biostat.pollslive_preparation = result)
  invisible(result)
}

acquire_pollslive_client <- function(config, mode) {
  override <- Sys.getenv("BIOSTAT_POLLSLIVE_CLIENT_SOURCE", unset = "")
  if (nzchar(override)) {
    candidate <- normalizePath(override, mustWork = TRUE)
    if (file.exists(file.path(candidate, "pollslive", "local.mjs"))) {
      candidate <- file.path(candidate, "pollslive")
    }
    require_pollslive_client(candidate)
    return(candidate)
  }

  revision <- config$clientRevision
  if (length(revision) != 1L || !grepl("^[a-f0-9]{40}$", revision)) {
    stop(
      "pollslive/config.json must pin clientRevision to a complete 40-character ",
      "_internal commit SHA. For local infrastructure development only, set ",
      "BIOSTAT_POLLSLIVE_CLIENT_SOURCE explicitly."
    )
  }
  repository <- config$clientRepository
  if (length(repository) != 1L || !grepl("^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$", repository)) {
    stop("pollslive/config.json requires clientRepository as OWNER/REPO.")
  }
  cache_parent <- here::here("pollslive", ".client-cache")
  cache_root <- file.path(cache_parent, revision)
  client_root <- file.path(cache_root, "pollslive")

  if (!file.exists(file.path(client_root, "local.mjs"))) {
    if (identical(mode, "offline")) {
      stop("The pinned PollsLive client is not cached. Run one synchronized render before using offline mode.")
    }
    gh <- Sys.which("gh")
    if (!nzchar(gh)) {
      stop("GitHub CLI is required to acquire the private pinned PollsLive client.")
    }
    dir.create(cache_parent, recursive = TRUE, showWarnings = FALSE)
    temporary_root <- paste0(cache_root, ".installing")
    unlink(temporary_root, recursive = TRUE, force = TRUE)
    on.exit(unlink(temporary_root, recursive = TRUE, force = TRUE), add = TRUE)
    run_checked(gh, c("repo", "clone", repository, temporary_root, "--", "--filter=blob:none", "--no-checkout"))
    run_checked("git", c("-C", temporary_root, "sparse-checkout", "set", "pollslive"))
    run_checked("git", c("-C", temporary_root, "checkout", "--detach", revision))
    if (!file.rename(temporary_root, cache_root)) {
      stop("Could not promote the verified PollsLive client cache.")
    }
  }

  actual_revision <- trimws(run_checked("git", c("-C", cache_root, "rev-parse", "HEAD")))
  if (!identical(actual_revision, revision)) {
    stop("Cached PollsLive client revision differs from clientRevision.")
  }
  require_pollslive_client(client_root)
  ensure_pollslive_dependencies(client_root, mode)
  client_root
}

ensure_pollslive_dependencies <- function(client_root, mode) {
  lock_path <- file.path(client_root, "package-lock.json")
  stamp_path <- file.path(client_root, "node_modules", ".pollslive-lock-md5")
  expected <- unname(tools::md5sum(lock_path))
  actual <- if (file.exists(stamp_path)) readLines(stamp_path, warn = FALSE, n = 1L) else ""
  if (identical(actual, expected)) {
    return(invisible(TRUE))
  }
  if (identical(mode, "offline")) {
    stop("The cached PollsLive client's Node dependencies are incomplete. Run a synchronized render once while online.")
  }
  npm <- Sys.which("npm")
  if (!nzchar(npm)) {
    stop("npm is required to install the pinned PollsLive client dependencies.")
  }
  run_checked(npm, c("ci", "--prefix", client_root))
  dir.create(dirname(stamp_path), recursive = TRUE, showWarnings = FALSE)
  writeLines(expected, stamp_path, useBytes = TRUE)
  invisible(TRUE)
}

require_pollslive_client <- function(client_root) {
  required <- c("local.mjs", "local-lib.mjs", "lib.mjs", "package-lock.json")
  missing <- required[!file.exists(file.path(client_root, required))]
  if (length(missing) > 0L) {
    stop("PollsLive client is incomplete: ", paste(missing, collapse = ", "))
  }
}

run_checked <- function(command, args, working_directory = NULL) {
  old_directory <- getwd()
  if (!is.null(working_directory)) {
    setwd(working_directory)
    on.exit(setwd(old_directory), add = TRUE)
  }
  # `system2()` requires callers to quote arguments containing spaces; quote
  # uniformly so private-repository caches also work below spaced paths.
  output <- system2(
    command = command,
    args = vapply(args, shQuote, character(1)),
    stdout = TRUE,
    stderr = TRUE
  )
  status <- attr(output, "status")
  if (!is.null(status) && status != 0L) {
    stop(
      basename(command), " failed (", status, "):\n",
      paste(output, collapse = "\n")
    )
  }
  paste(output, collapse = "\n")
}
