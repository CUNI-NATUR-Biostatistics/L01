# Stage 2–3 — L01 written materials

## Metadata and checkpoint

- Week: L01
- Date: 2026-07-26
- Author: Codex with course-owner direction
- Reviewer: pending
- Branch: `lesson/l01-skripta`
- Base: `main` at `59968f9`
- Planning dependency: PR #4 merged
- Status: review-ready written-materials draft; awaiting human review

## Authoring outcome

The legacy Palmer Penguins chapter was replaced with a self-contained first
lesson built around the approved `ggplot2::msleep` data story. After human
comparison with the pre-dataset-change chapter, the material was reconstructed
to recover its stronger concrete-to-general teaching sequence:

1. welcome, course structure, a practical guide to reading the Quarto outputs,
   and explicit release-blocking placeholders for policy facts not yet
   supplied;
2. two fictional news headlines claiming that a typical mammal weighs either
   the mean or the median body mass, followed by a student vote before the
   statistical terms are formally explained;
3. one measured sleep variable followed from four rows of a table into a
   manually entered R vector, the full dataframe column, and `length()` /
   `head()` checks;
4. visualization before calculation, including two synthetic samples with the
   same mean but different shapes, then a dot plot, histogram, density plot,
   bin-width comparison, and student-visible base-R code;
5. arithmetic mean, median, percentiles and quartiles, IQR, minimum and maximum,
   variance, and SD developed one at a time from nine real species, with visual
   anchors and the required words-to-values-to-symbols progression;
6. the opening body-weight claims resolved only after mean and median are
   understood, using both linear and logarithmic display scales;
7. a step-by-step construction of the boxplot from points, median, IQR, whiskers,
   and possible outliers, followed by the final base-R command, reading key, and
   a violin-plus-boxplot example showing when distribution shape adds useful
   information;
8. continuous, discrete, nominal, and ordinal variable types generalized only
   at the end, each with real-world examples, executable `class()` / `typeof()`
   / `str()` checks in R, an explanation of the returned representation, and
   suitable graph choices;
9. provenance, missingness, observational-unit and species-versus-individual
   cautions retained from the newer draft;
10. a classification exercise, compact decision map, summary, closing question,
    and bridge to the next lesson.

The approved derived variables remain explicit:

- the discrete count changes the observational unit to one taxonomic order and
  counts only species represented in this table;
- the ordered small/medium/large body-mass category uses observed terciles and
  is labelled as an artificial didactic classification, not a biological
  standard.

## Inspiration adaptation

The local inspiration hub routes early lessons toward R for Data Science and
introductory data-literacy materials. The draft borrows only the transferable
patterns: clear onboarding, small conceptual steps, visual intuition, and a
question-to-data-to-interpretation rhythm.

It does not import tidyverse syntax into student-visible code, a generic
data-science syllabus, or external wording and lesson order.

## Review outcomes

### Lesson-vision review

No credible findings remained after revision.

- Learning outcomes map directly onto the section sequence.
- The hook is biological and precedes statistical terminology.
- The opening guide explains navigation in HTML and PDF, demonstrates a real
  tabset, defines the course callout meanings, and lets students practise a
  collapsible question-and-answer pattern.
- The chapter stays within one-variable description and reserves relationships
  for the closing bridge.
- The variable-types section distinguishes a value's appearance from its
  meaning, gives recognition cues for measurement, count, unordered category,
  and ordered category, and finishes with a student classification exercise.
- Each type is connected to practice through an executable R object and
  `class()`, `typeof()`, and `str()`. The surrounding text explicitly warns
  that R's storage type or class does not by itself determine the statistical
  type of the variable.
- Student-visible code is base R with package-qualified access to `msleep`;
  hidden preparation and plotting use namespaced tidyverse code.
- Every introduced statistic has a transparent concrete-to-general
  calculation, and data-derived values in prose or equations use inline R.
- Czech terminology follows the canonical terminology guide.

### Glossary-coverage review

No credible missing first-use wrappers remained for the reviewed concept
blocks. The opening headlines now retain the requested accessible wording while
also supplying the searchable English terms *mean* and *median*. All 20 used
slugs were checked against the local canonical `slovnik/pojmy.yaml`.

## Validation

- `Rscript R/render_skripta.R` completed successfully.
- `Learning_materials/skripta.html`,
  `Learning_materials/skripta_raw.pdf`, and
  `Learning_materials/skripta.pdf` were regenerated.
- The final PDF has 43 pages.
- Every PDF page was rendered to PNG and visually inspected.
- The reconstructed vector, graph gallery, statistic-by-statistic calculations,
  mean-versus-median payoff, boxplot and violin displays, and variable-type
  finale were inspected at full resolution.
- Visual review found and removed an orientation-warning block from the PDF,
  kept the ordinal-category code on one page, and prevented the summary heading
  from being orphaned at the bottom of the preceding page.
- The IQR explanation was strengthened during formula review so students see all
  nine ordered observations, the concrete quartile subtraction, and only then
  the abstract formula.
- The Typst table styling was synchronized with L02–L04. Markdown and generated
  tables now use the shared indigo header, bold light header text, grey borders,
  alternating row shading, and consistent cell padding; the complete 43-page
  PDF and the widest tables were visually rechecked after rerendering.
- The rendered HTML was exercised in a headless browser: all 10 tabsets switched
  successfully, all 9 collapsible callouts expanded successfully, glossary
  definitions had the expected hover markup, no internal link target was
  missing, and the base-R dot plot, histogram, density, and boxplot code
  examples each produced a figure output.
- The dot plots were shortened and their quasirandom spread was corrected to
  use the vertical axis. Full-resolution PDF review confirmed that the points
  now use the panel height without excessive blank space above or below.
- The continuous, discrete, nominal, and ordinal examples all produced the
  expected `class()`, `typeof()`, and `str()` output in the rendered HTML.
- Tables, callouts, equations, Czech glyphs, plots, page numbering, and section
  transitions were visually clean in the final PDF.
- Source-only `git diff --check` passed after the final record update.

Non-blocking render warning:

- HTML resource embedding tries to fetch the existing theme's bare
  `https://fonts.googleapis.com` and `https://fonts.gstatic.com` URLs, which
  return 404. Both HTML and PDF outputs are still created successfully.

## Human review focus

1. Supply or confirm the five `TODO[RELEASE-BLOCKER: ...]` course-policy facts.
2. Confirm that the restored sequence—one sleep variable, graphs, statistics,
   boxplot, then variable types—recovers the pacing and craft of the original
   lesson.
3. Confirm that the new “Jak číst skripta” guide matches how students should
   use the HTML/PDF materials and class markers.
4. Decide whether the 43-page self-study depth is appropriate or whether any
   optional technical callouts should be shortened after the structural review.
5. Confirm that the log-axis illustration is suitable for the first
   statistical meeting.
6. Confirm the phrasing around the artificial ordinal category and the
   species-level limitation of the dataset.
7. Confirm that the violin example adds useful shape intuition without making
   the boxplot-to-L02 overlap feel unnecessarily repetitive.

No presentation work should begin until the written materials pass the human
review gate.
