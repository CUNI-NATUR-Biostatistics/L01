#----------------------------------------------------------#
#
#
#                          L01
#
#                  Prepare mammal data
#
#                     O. Mottl
#                       2026
#
#----------------------------------------------------------#


#----------------------------------------------------------#
# Extract the reviewed package data -----
#----------------------------------------------------------#

ggplot2_version <-
  as.character(
    packageVersion("ggplot2")
  )

if (
  !ggplot2_version %in% c("4.0.2", "4.0.3")
) {
  cli::cli_abort(
    "Package {.pkg ggplot2} version 4.0.2 or 4.0.3 is required to reproduce the teaching data."
  )
}

data_savci <-
  ggplot2::msleep |>
  as.data.frame()

expected_names <-
  c(
    "name",
    "genus",
    "vore",
    "order",
    "conservation",
    "sleep_total",
    "sleep_rem",
    "sleep_cycle",
    "awake",
    "brainwt",
    "bodywt"
  )

if (
  nrow(data_savci) != 83L ||
    ncol(data_savci) != 11L ||
    !identical(names(data_savci), expected_names) ||
    sum(is.na(data_savci$vore)) != 7L ||
    sum(is.na(data_savci$conservation)) != 29L ||
    sum(is.na(data_savci$sleep_rem)) != 22L ||
    sum(is.na(data_savci$sleep_cycle)) != 51L ||
    sum(is.na(data_savci$brainwt)) != 27L ||
    sum(is.na(data_savci$bodywt)) != 0L
) {
  cli::cli_abort(
    "The msleep source table failed its dimensions, names, or missing-value checks."
  )
}


#----------------------------------------------------------#
# Save the teaching table -----
#----------------------------------------------------------#

readr::write_csv(
  x = data_savci,
  file = here::here(
    "data",
    "msleep.csv"
  ),
  na = ""
)
