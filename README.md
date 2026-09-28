# [𝗣𝗥𝗜𝗗𝗲-𝗥𝗟 𝗦𝗵𝗶𝗻𝘆 𝗖𝗼𝗻𝗻𝗲𝗰𝘁](https://img.shields.io/badge/PRIDe--RL%20Shiny%20Connect-%230D47A1?style=for-the-badge&logoColor=white)

![](https://img.shields.io/github/license/labrgrupo/PRIDE-RL_shiny_connect.svg)
![](https://img.shields.io/github/last-commit/labrgrupo/PRIDE-RL_shiny_connect/main.svg)

<a href="https://github.com/labrgrupo/PRIDE-RL_shiny_connect/blob/main/logo_PRIDe-RL.png">
  <img src="logo_PRIDe-RL.png" width="300px" align="right" alt="PRIDe-RL logo"/>
</a>

**PRIDe-RL Shiny Connect** is the cloud-ready implementation of the **Performance Ranking by Index of Deviation of Reference Limits (PRIDe-RL)** framework. It supports the comparative evaluation and ranking of methods used to estimate lower and upper reference limits.

PRIDe-RL relates each estimated reference limit to a specified comparative reference limit and its corresponding equivalence interval. The application combines the reference limit deviation index, direct inclusion within equivalence intervals, four complementary performance dimensions, the composite PRIDe-RL score, and a color-coded heatmap.

This edition is designed for **Posit Connect Cloud**, self-hosted Posit Connect, and institutional Shiny servers. It operates in a **session-based mode**: configurations, heatmap images, `.RData`, `.Rhistory`, and HTML reports are not written to persistent application folders. The only user-facing file export is the self-contained HTML report requested through the download button.

No programming experience is required to use a deployed instance. Follow the instructions below in the stated order.

---

## 🌐 Live demonstration on Posit Connect Cloud

A public deployment is available on **Posit Connect Cloud** as a demonstration instance, allowing the PRIDe-RL framework to be evaluated directly in a web browser without installing R or RStudio.

### 👇 **Click below to access the PRIDe-RL Shiny Connect live demo** 👇

<a href="https://labrgroup-pride-rl.share.connect.posit.cloud/" target="_blank">
  <img src="https://img.shields.io/badge/Launch%20LabRI%20Demo-%23009C3B?style=for-the-badge&logo=google-chrome&logoColor=%23009C3B&labelColor=%23FFDF00" alt="Launch the PRIDe-RL live demo on Posit Connect Cloud" style="height: 50px;">
</a>

</div>

The instance runs on the **Posit Connect Cloud Free plan** (4 GB memory, 1 CPU, 20 monthly active hours, and a maximum of 5 hosted applications). Under these constraints, the demonstration may exhibit temporary unavailability, instability, or memory-related failures when processing large datasets or reports containing many elements. It is intended strictly as a **showcase and evaluation environment**, not as a production system, and must not be used to process sensitive or identifiable laboratory data.

For institutional or production use, users should fork the [official PRIDe-RL Shiny Connect repository](https://github.com/labrgrupo/PRIDe-RL_shiny_connect) and deploy a dedicated instance with resources and access controls appropriate to their organization.

---

## 1. 𝗔𝗯𝗼𝘂𝘁 𝗣𝗥𝗜𝗗𝗲-𝗥𝗟

PRIDe-RL compares reference limits estimated by two or more methods with a **comparative reference interval** specified for each analyte.

For every lower reference limit (LRL) and upper reference limit (URL), the application calculates:

- the permissible analytical standard deviation at the comparative reference limit;
- the permissible difference and corresponding equivalence interval;
- the reference limit deviation index for each compared method;
- direct inclusion within the equivalence interval;
- the four PRIDe-RL performance dimensions;
- group-specific and global rankings;
- the composite PRIDe-RL score;
- the PRIDe-RL heatmap;
- a self-contained HTML report containing the supplied information, calculations, tables, methodology, references, logo, and responsive navigation.

The normalized reference limit deviation index is defined as:

$$
D_{RL}=\frac{RL_{estimated}-RL_{comparative}}{pD_{RL}}
$$

where $pD_{RL}$ is the permissible difference calculated specifically for the corresponding comparative LRL or URL.

- $D_{RL}=0$ indicates equality with the comparative reference limit.
- $|D_{RL}|\leq1$ indicates inclusion within the equivalence interval.
- The sign indicates the direction of the deviation.
- The magnitude indicates the deviation relative to the permissible-difference criterion.

---

## 2. 𝗥𝗲𝗽𝗼𝘀𝗶𝘁𝗼𝗿𝘆 𝗰𝗼𝗻𝘁𝗲𝗻𝘁𝘀

- **`app.R`** — Complete PRIDe-RL Shiny interface, calculations, rankings, heatmap, methodological documentation, bibliography, and HTML-report generator.
- **`logo_PRIDe-RL.png`** — PRIDe-RL logo displayed in this README.
- **`manifest.json`** — R version and package dependencies used by Posit Connect Cloud.
- **`manifest_packages.R`** — Declaration and validation of direct runtime packages.
- **`generate_manifest.R`** — Script that regenerates `manifest.json` using `rsconnect::writeManifest()`.
- **`criar_manifest.json.txt`** — Compatibility launcher that sources `generate_manifest.R`.

🔗 **Official repository:** [https://github.com/labrgrupo/PRIDE-RL_shiny_connect](https://github.com/labrgrupo/PRIDE-RL_shiny_connect)

---

## 3. 𝗛𝗼𝘄 𝘁𝗼 𝗮𝗰𝗰𝗲𝘀𝘀 𝘁𝗵𝗲 𝗮𝗽𝗽𝗹𝗶𝗰𝗮𝘁𝗶𝗼𝗻

### 3.1. Using an online deployed instance

The public demonstration is available at:

**[https://labrgroup-pride-rl.share.connect.posit.cloud/](https://labrgroup-pride-rl.share.connect.posit.cloud/)**

To use the deployed application:

1. Open the address in a current web browser.
2. Wait until the **Data entry** tab is completely displayed.
3. Enter or paste the assessment data.
4. Click **Generate Analysis**.
5. Review the results and download the HTML report.

End users do not need R or RStudio when accessing an online deployed instance.

### 3.2. Running the Connect edition locally

Developers and deployment administrators may also test this edition locally:

1. Install **R** from [https://cran.r-project.org/](https://cran.r-project.org/).
2. Install **RStudio Desktop** from [https://posit.co/downloads](https://posit.co/downloads).
3. Install the required packages in R:

   ```r
   install.packages(c("shiny", "kableExtra", "xml2"))
   ```

4. Download and extract the complete repository. Do not run the application from inside the ZIP file.
5. Open `app.R` in RStudio.
6. Click **Run App** in the upper-right corner of the script editor.
7. Keep RStudio open while using the application.

If the browser does not open automatically, copy the local address shown in the RStudio Console, usually beginning with `http://127.0.0.1:`, and open it in the browser.

---

## 4. 𝗦𝘁𝗲𝗽-𝗯𝘆-𝘀𝘁𝗲𝗽 𝘂𝘀𝗲𝗿 𝗴𝘂𝗶𝗱𝗲

### 4.1. Complete the analysis information

Open the **Data entry** tab and locate the **Analysis information** card.

Complete the fields that apply to the assessment:

1. **Specialist responsible for data analysis** — person or team responsible for the analysis.
2. **Data Source** — origin of the datasets used for the assessment.
3. **Measurement Procedure and Analytical Method** — procedures or analytical systems associated with the compared data.
4. **Sample Type** — for example serum, plasma, whole blood, or urine.
5. **Age Range** — population age range represented by the comparative and estimated intervals.
6. **Source of the Comparative Reference** — source used for the comparative reference interval, such as reagent-package inserts, scientific publications, specialized guidelines, textbooks, direct studies, multicenter studies, or indirect studies.
7. **Nominal central coverage of the equivalence interval** — select 80% or 90%. The default is 90%.

Information that is not supplied is identified as **Not provided** in the HTML report.

### 4.2. Choose the equivalence-interval coverage

The equivalence interval is calculated separately around each comparative LRL and URL. It defines the range within which a difference is considered not clinically relevant under the method's permissible-uncertainty criterion.

- **80% nominal central coverage** reproduces the original proposal of Haeckel et al. (2016).
- **90% nominal central coverage** applies the criterion adopted for the PRIDe-RL framework.

The application obtains the corresponding standard-normal quantile directly from R. The selected factor is a permissible-difference criterion and should not be interpreted as a conventional confidence interval for the unknown true reference limit.

### 4.3. Configure assessment groups

An **assessment group** identifies a dataset, population, laboratory, analytical platform, study scenario, or other assessment scope.

1. Use the existing **Group 1** or rename it.
2. Click the control for adding a group when another independent scope is needed.
3. Select the group whose data will be entered or reviewed.
4. Remove a group only after confirming that its data are no longer required.

Each group is evaluated separately. The application also produces a **Global** ranking that combines all available groups.

### 4.4. Configure compared methods

At least two methods are required.

1. Replace **Method 1** and **Method 2** with the actual method names.
2. Click **Apply method names** after editing them.
3. Add more methods when necessary.
4. Remove a method only after confirming the operation.

Method names remain linked to their corresponding LRL and URL columns throughout the analysis and report.

### 4.5. Understand the data table

Enter one row per analyte within each assessment group. The columns are organized as follows:

| Column | Required information |
|---|---|
| **Analyte** | Name of the analyte or laboratory test |
| **Unit** | Measurement unit |
| **Sample n** | Sample size associated with the estimated reference interval |
| **Decimal places** | Integer from 0 to 8 used for presentation |
| **Comparative reference — LRL** | Lower limit of the comparative reference interval |
| **Comparative reference — URL** | Upper limit of the comparative reference interval |
| **Method — LRL** | Lower reference limit estimated by the method |
| **Method — URL** | Upper reference limit estimated by the method |

Every additional method creates another pair of LRL and URL columns.

### 4.6. Enter data manually

1. Click the first field in the desired row.
2. Type the value.
3. Move through the remaining fields and complete the row.
4. Click **Add analyte** when another row is required.
5. Repeat the procedure for every assessment group.

Decimal points and decimal commas are accepted. Common local thousands separators are also recognized.

### 4.7. Paste a data block from Excel or another spreadsheet

This is the recommended procedure for larger assessments.

1. Organize the spreadsheet columns in the same order as the PRIDe-RL table.
2. Do not include the spreadsheet header row in the copied block.
3. Select the rectangular block containing the analytes and all required values.
4. Copy the block using **Ctrl+C** on Windows or **Command+C** on macOS.
5. In PRIDe-RL, select the correct assessment group.
6. Click the first destination field, normally the first **Analyte** cell.
7. Paste using **Ctrl+V** or **Command+V**.
8. Review the pasted rows before generating the analysis.

The **Decimal places** column remains a drop-down list, but values pasted from the spreadsheet are registered as valid selections when they are integers from 0 to 8.

Important checks after pasting:

- confirm that analytes and units are in the correct columns;
- confirm that sample sizes are integers greater than zero;
- confirm that decimal-place values are between 0 and 8;
- confirm that every comparative LRL is lower than its corresponding URL;
- confirm that each method's LRL and URL were pasted into the correct method columns;
- confirm that no spreadsheet header was pasted as an analyte row.

### 4.8. Generate the analysis

1. Review the entered information.
2. Click **Generate Analysis**.
3. Wait until the calculation finishes and the application opens the **Results** tab.
4. If a validation window appears, read every message, correct the indicated group and row, and click **Generate Analysis** again.

Common validation messages concern:

- missing analyte names;
- missing or invalid sample sizes;
- decimal places outside the range from 0 to 8;
- missing comparative limits;
- missing estimated limits;
- LRL values greater than or equal to their corresponding URL values.

If any analytical input is changed after calculation, click **Generate Analysis** again. Results and the HTML-download button remain outdated until the analysis is regenerated.

---

## 5. 𝗛𝗼𝘄 𝘁𝗼 𝗿𝗲𝗮𝗱 𝘁𝗵𝗲 𝗿𝗲𝘀𝘂𝗹𝘁𝘀

### 5.1. Inclusion ranking

The inclusion ranking reports the proportion of available lower and upper reference limits for which $|D_{RL}|\leq1$. A higher percentage indicates that more estimates are contained within their respective equivalence intervals.

This ranking addresses direct conformity only. It does not fully describe the magnitude or distribution of deviations outside the equivalence interval.

### 5.2. Composite ranking

The composite ranking presents the **PRIDe-RL score** and the four normalized dimensions:

1. **Conformity (d1)** — proportion of available limits within their respective equivalence intervals.
2. **Proximity (d2)** — overall closeness to the comparative reference limits based on the mean absolute deviation index.
3. **Tail behaviour (d3)** — behavior of the upper tail of the absolute deviation-index distribution.
4. **Severity (d4)** — frequency of severe deviations for which $|D_{RL}|>2$.

The PRIDe-RL score combines these complementary dimensions. The separate dimensions must also be reviewed because two methods with similar composite scores may have different performance profiles.

### 5.3. Equivalence intervals

This table reports the calculations used to define the permissible differences and equivalence intervals separately for the comparative LRL and URL of each analyte.

Use it to verify:

- the comparative reference limits;
- the derived empirical variation parameters;
- the permissible analytical standard deviation;
- the permissible difference;
- the lower and upper boundaries of each equivalence interval.

### 5.4. Detailed assessment

The detailed table contains the estimated LRL and URL for each method, the corresponding $D_{RL}$ values, their absolute values, and the classification relative to the equivalence interval.

Use this table when the ranking or heatmap identifies an analyte that requires investigation.

### 5.5. Heatmap

The **Heatmap** tab displays the reference limit deviation indices for every analyte, reference limit, and method.

- values close to zero indicate estimates close to the comparative reference limit;
- greener cells generally indicate better performance;
- yellow and orange cells indicate progressively larger deviations;
- red cells identify the largest deviations relative to the permissible-difference criterion;
- the sign indicates whether the estimated limit is below or above the comparative limit.

The heatmap is a visual summary. Conclusions should be confirmed using the numerical tables and the four scoring dimensions.

### 5.6. PRIDe-RL scoring framework

This tab documents the sequence used to calculate the equivalence intervals, deviation indices, dimensions, and composite score. It includes the methodological figure, mathematical formulas, and definitions of the variables.

### 5.7. References

The **References** tab lists the methodological bibliography. DOI addresses are clickable and open the corresponding article page in a new browser tab.

---

## 6. 𝗗𝗼𝘄𝗻𝗹𝗼𝗮𝗱 𝘁𝗵𝗲 𝗛𝗧𝗠𝗟 𝗿𝗲𝗽𝗼𝗿𝘁

The HTML-download button becomes available only after a valid and current analysis has been generated.

1. Click **Generate Analysis**.
2. Confirm that the results are current and no validation message remains.
3. Return to the **Data entry** tab if necessary.
4. Click **Download HTML Report**.
5. Choose the destination folder when requested by the browser.
6. Open `PRIDe-RL_Report.html` in a current browser.

The report contains:

- all supplied analysis information;
- explicit identification of fields that were not provided;
- assessment groups and compared methods;
- entered analyte data;
- equivalence intervals;
- detailed deviation indices;
- inclusion and composite rankings;
- PRIDe-RL heatmap;
- scoring-framework documentation;
- methodological references with clickable DOI links;
- PRIDe-RL logo and responsive navigation for computers, phones, and tablets.

The HTML file is self-contained and may be archived or shared according to the user's institutional data-governance rules.

---

## 7. 𝗦𝗲𝘀𝘀𝗶𝗼𝗻 𝗯𝗲𝗵𝗮𝘃𝗶𝗼𝗿 𝗮𝗻𝗱 𝗳𝗶𝗹𝗲 𝘀𝘁𝗼𝗿𝗮𝗴𝗲

PRIDe-RL Shiny Connect does not create `1_Outputs` and does not save configurations, heatmap files, or reports automatically.

- Entered information exists only in the active Shiny session.
- Closing or reloading the browser may discard the current assessment.
- A temporary heatmap is created only while the HTML report is assembled.
- The temporary heatmap is deleted immediately after report generation.
- The only file retained by the user is the HTML report explicitly downloaded through the browser.

Download the report before closing the session when the analysis must be retained.

---

## 8. 𝗟𝗼𝗰𝗮𝗹 𝗮𝗽𝗽𝗹𝗶𝗰𝗮𝘁𝗶𝗼𝗻 𝘃𝘀. 𝗰𝗹𝗼𝘂𝗱-𝗿𝗲𝗮𝗱𝘆 𝗲𝗱𝗶𝘁𝗶𝗼𝗻

PRIDe-RL is distributed in two complementary implementations that share the same analytical framework but use different output-management strategies.

- **[PRIDe-RL local application](https://github.com/labrgrupo/PRIDe-RL_shiny)** — runs locally with R and RStudio and can preserve the configuration and automatically write the HTML report and high-resolution heatmap to local folders.
- **[PRIDe-RL Shiny Connect](https://github.com/labrgrupo/PRIDe-RL_shiny_connect)** — cloud-ready implementation that does not persist analytical files in the server application directory.

| Feature | PRIDe-RL local application | PRIDe-RL Shiny Connect |
|---|---:|---:|
| Runs on the user's computer | Yes | Optional |
| Requires R and RStudio for end users | Yes | No, when using a deployed instance |
| Designed for Posit Connect Cloud | No | Yes |
| Saves a reusable configuration | Yes | No |
| Automatically creates output folders | Yes | No |
| Automatically saves a 600-dpi heatmap | Yes | No |
| Automatically saves the HTML report | Yes | No |
| Uses temporary files during report assembly | No | Yes |
| Displays results and heatmap in the browser | Yes | Yes |
| Allows manual download of the HTML report | Yes | Yes |

The local edition is preferable when automatic retention of configurations and analytical outputs is required. The Connect edition is preferable for demonstrations, training, institutional deployment, and browser-based multi-user access.

---

## 9. 𝗗𝗲𝗽𝗹𝗼𝘆𝗶𝗻𝗴 𝘆𝗼𝘂𝗿 𝗼𝘄𝗻 𝗖𝗼𝗻𝗻𝗲𝗰𝘁 𝗖𝗹𝗼𝘂𝗱 𝗶𝗻𝘀𝘁𝗮𝗻𝗰𝗲

Users may fork the official repository to create a personal GitHub copy that can be modified and deployed independently.

1. Fork or clone [https://github.com/labrgrupo/PRIDe-RL_shiny_connect](https://github.com/labrgrupo/PRIDe-RL_shiny_connect).
2. Confirm that `app.R` and `manifest.json` are in the same directory.
3. Open [https://connect.posit.cloud/](https://connect.posit.cloud/).
4. Connect the GitHub repository.
5. Select `app.R` as the primary file.
6. Publish the application.

The application may also be adapted for self-hosted Posit Connect, institutional Shiny Server, shinyapps.io, or compatible container-based environments under the GPL-3.0 license.

---

## 10. 𝗥𝗲𝗴𝗲𝗻𝗲𝗿𝗮𝘁𝗶𝗻𝗴 `manifest.json`

Regenerate the dependency manifest whenever `app.R` or its package dependencies change.

1. Install R, RStudio, and the packages `rsconnect`, `shiny`, `kableExtra`, and `xml2` on the computer used to prepare the deployment.
2. Open the repository as the working project.
3. Open `generate_manifest.R` and click **Source**, or run:

   ```r
   source("generate_manifest.R")
   ```

4. Confirm that the updated `manifest.json` is in the same directory as `app.R`.
5. Commit both files to the repository.

The deployed `app.R` does not run `install.packages()`. The deployment environment restores the package dependencies recorded in `manifest.json`.

---

## 11. 𝗧𝗿𝗼𝘂𝗯𝗹𝗲𝘀𝗵𝗼𝗼𝘁𝗶𝗻𝗴

### The application does not open

Refresh the browser once. If the problem persists, the deployed instance may be inactive, rebuilding, or out of available cloud hours. Contact the deployment administrator.

### Pasted decimal-place values are reported as missing

Confirm that the pasted values are integers from 0 to 8 and that the copied spreadsheet block begins in the correct destination cell. Paste the block again and review the drop-down values before generating the analysis.

### The application reports invalid data

Read every validation message and correct the corresponding group and row. Pay particular attention to sample sizes, decimal places, comparative limits, and estimated LRL and URL values.

### The download button is disabled

Generate the analysis first. If any input was edited afterward, generate the analysis again so the report matches the current data.

### The HTML report is not downloaded

Check whether the browser blocked the download, verify the browser's download folder, and generate the analysis again before retrying.

### The session was reset and the entered data disappeared

The Connect edition intentionally does not preserve configurations. Browser refreshes, inactivity timeouts, cloud restarts, or closing the session can discard the current data. Download the HTML report before ending the session.

### A large assessment is slow or fails

Large tables and report components may exceed the memory available in a free or low-resource cloud instance. Reduce the number of groups, analytes, or methods, or use the local PRIDe-RL application.

---

## 12. 𝗗𝗮𝘁𝗮 𝗽𝗿𝗶𝘃𝗮𝗰𝘆 𝗮𝗻𝗱 𝗿𝗲𝘀𝗽𝗼𝗻𝘀𝗶𝗯𝗹𝗲 𝘂𝘀𝗲

The Connect edition does not intentionally preserve entered data after the Shiny session ends. Nevertheless, deployment administrators remain responsible for access control, server configuration, logs, institutional governance, and compliance with applicable data-protection requirements.

Do not enter identifiable or sensitive laboratory information into a public demonstration instance. Use an institutionally controlled deployment for confidential data.

PRIDe-RL supports method comparison and performance assessment. Its outputs must be reviewed by qualified professionals and interpreted together with analytical, statistical, and clinical context.

---

## 13. 𝗖𝗼𝗻𝘁𝗮𝗰𝘁 𝗮𝗻𝗱 𝘀𝘂𝗽𝗽𝗼𝗿𝘁

**Submit suggestions and report bugs at:**  
[https://github.com/labrgrupo/PRIDe-RL_shiny_connect/issues](https://github.com/labrgrupo/PRIDe-RL_shiny_connect/issues)

**Grupo Lab R website:**  
[https://grupolabr.com/](https://grupolabr.com/)

**Email:**  
alancdias@hotmail.com · labrgrupo@gmail.com

**License:**  
GNU General Public License v3.0 (GPL-3.0)
