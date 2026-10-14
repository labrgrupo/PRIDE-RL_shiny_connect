# Generate manifest.json for the PRIDe-RL Posit Connect Cloud application.
#
# Run this script from RStudio after installing rsconnect and the runtime
# packages listed in manifest_packages.R. The manifest is always written beside
# app.R, which is the layout required for the cloud deployment.

script_path <- tryCatch(
  normalizePath(sys.frame(1)$ofile, winslash = "/", mustWork = TRUE),
  error = function(e) normalizePath("generate_manifest.R", winslash = "/", mustWork = TRUE)
)
app_directory <- dirname(script_path)

source(file.path(app_directory, "manifest_packages.R"), local = TRUE)
check_manifest_packages()

if (!requireNamespace("rsconnect", quietly = TRUE)) {
  stop(
    "Package 'rsconnect' is required to generate manifest.json. ",
    "Install it locally and run this script again.",
    call. = FALSE
  )
}

rsconnect::writeManifest(
  appDir = app_directory,
  appFiles = "app.R",
  appPrimaryDoc = "app.R",
  appMode = "shiny",
  quiet = FALSE
)

message("manifest.json was generated in: ", app_directory)
