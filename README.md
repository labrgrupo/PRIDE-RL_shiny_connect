# PRIDe-RL Shiny — Posit Connect Cloud edition

This folder contains the cloud deployment build of **PRIDe-RL 1.17.22**.

## Runtime behavior

- Analyses and plots are held in the active Shiny session.
- The application does not create `1_Outputs`, save configuration files, or
  export heatmap images automatically.
- The only user-facing file export is the self-contained HTML analysis report.
- A temporary heatmap is created only while the HTML report is assembled and
  is removed immediately afterward.

## Files

- `app.R`: PRIDe-RL Shiny application.
- `manifest.json`: dependency manifest read by Posit Connect Cloud.
- `manifest_packages.R`: list and validation of direct runtime packages.
- `generate_manifest.R`: regenerates `manifest.json` with `rsconnect`.
- `criar_manifest.json.txt`: compatibility launcher based on the LabRI setup;
  its single command sources `generate_manifest.R`.

## Regenerate the dependency manifest

1. Install R and RStudio on the computer used to prepare the deployment.
2. Install `rsconnect`, `shiny`, `kableExtra`, and `xml2` locally.
3. Open this folder as the working project or set it as the working directory.
4. Open `generate_manifest.R` and click **Source**, or run:

   ```r
   source("generate_manifest.R")
   ```

5. Commit the updated `manifest.json` together with `app.R`.

Regenerate the manifest whenever `app.R` or its package dependencies change.

## Publish to Posit Connect Cloud

Place the files in a GitHub repository, connect the repository at
<https://connect.posit.cloud/>, and select `app.R` as the primary file. Keep
`manifest.json` in the same directory as `app.R`.
