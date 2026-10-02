# L01 CSV delivery maintenance

## Scope

- Date: 2026-10-02
- Branch: `prez/polish_lat_minute`
- Purpose: replace the runtime dependency on `ggplot2::msleep` with a stable, downloadable CSV while preserving the approved practical tasks, values, and timing.

## Data contract

- `data/msleep.csv` contains all 83 rows and 11 original columns from `ggplot2::msleep` in the reviewed 4.0.2/4.0.3 data versions.
- Missing values remain in their original rows and columns.
- `R/prepare_msleep_data.R` reproduces and validates the CSV.
- The student script downloads the file from the stable lesson route, stores it under `data/`, checks its presence, and imports it with `read.csv()`.
- `website-release.yml` publishes the CSV and its provenance note.

## Pedagogical effect

No task, expected result, hint sequence, or statistical content changes. The practical becomes independent of an installed `ggplot2` package. The initial setup adds the same script-and-data folder route already used in L02 and L03.

## Validation required

- regenerate the CSV from a reviewed package version;
- compare its values with the package source, allowing only tibble-to-data-frame and CSV serialization differences;
- parse and run the unfilled script from a clean R session and a student-style folder containing only the distributed script and CSV;
- verify manifest paths, UTF-8, the documented checksum, and the absence of a remaining runtime `ggplot2` dependency;
- independently review the complete updated exercise against `Workflow/records/2026-08-27-exercise-blueprint.md`.

## Validation outcome

- `R/prepare_msleep_data.R` regenerated the CSV from `ggplot2` 4.0.3. A second comparison against the official `ggplot2` 4.0.2 `data-raw/msleep.csv` source matched all 83 rows and 11 columns exactly after interpreting its textual `NA` markers as missing values.
- The complete unfilled exercise parsed and ran successfully with `Rscript --vanilla` from a temporary student-style folder containing only `cviceni.R` and `data/msleep.csv`. All existing numerical and categorical expectations remain unchanged because the CSV is value-identical to the former package object.
- The documented download routes are `https://cuni-natur-biostatistics.github.io/L01/current/code/cviceni.R` and `https://cuni-natur-biostatistics.github.io/L01/current/data/msleep.csv`. Their local release-manifest paths exist and parse correctly; the `/current/` URLs cannot contain the new files until this branch is released.
- The CSV checksum is `b7709b0f02415e9a8b64e3aa24ab9e2dc7f5d6f051e80a0d956456896d3b4373`. UTF-8 without BOM and `git diff --check` passed for all affected text files.
- Independent read-only review completed on 2026-10-02. It confirmed that the CSV and import route are technically sound and that the 62–65 minute core route fits within the 120-minute practical. Data-provenance visibility, two teacher-facing cues, and Czech accents in L01-N22 were corrected after review.
- The same review identified a broader pre-existing worksheet-format issue: all 40 task blocks still use the older `Účel` / `Vstup` / `Úkol` anatomy rather than the current compact `Zadání` standard. That course-wide exercise rewrite is outside this maintenance change and remains a separate human-review item.
