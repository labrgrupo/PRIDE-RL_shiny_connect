# PRIDe-RL dependencies required at application runtime.
#
# This file is sourced only by generate_manifest.R. The deployed application
# never installs packages while it is running; Posit Connect Cloud restores the
# package environment described by manifest.json.

PRIDE_RL_RUNTIME_PACKAGES <- c(
  "shiny",
  "kableExtra",
  "xml2"
)

check_manifest_packages <- function(packages = PRIDE_RL_RUNTIME_PACKAGES) {
  missing_packages <- packages[
    !vapply(packages, requireNamespace, logical(1), quietly = TRUE)
  ]

  if (length(missing_packages) > 0L) {
    stop(
      "Install the missing runtime packages before regenerating manifest.json: ",
      paste(missing_packages, collapse = ", "),
      call. = FALSE
    )
  }

  invisible(packages)
}
