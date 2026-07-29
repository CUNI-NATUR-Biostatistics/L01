# Stages 4–5 — L01 presentation approval record

## Metadata

- Week: L01
- Date: 2026-07-27
- Author: Codex with course-owner direction
- Canonical presentation review: completed by Codex against the course vision,
  active-learning and visual-rhythm criteria
- Human reviewer: Ondřej Mottl, approved 2026-07-28
- Branch: `lesson/l01-presentation`
- Base: `main` at `f2aa8f0`
- Written-materials dependency: PR #5 merged
- Status: Stage 5 approved; ready for commit and pull request
- Storyboard: `Workflow/records/2026-07-27-stage-4-5-presentation-plan.md`

## Implemented teaching story

The inherited Palmer Penguins deck was replaced with an 80-slide Czech RevealJS
presentation derived from the approved `ggplot2::msleep` learning materials.
The recurring question is how much a “typical” mammal weighs and what must be
known before one summary number can be interpreted responsibly.

The sequence is:

1. a six-slide orientation: two slides introduce the instructor and his research, followed by the weekly course structure, Moodle materials, the voluntary-attendance principle and a practical-credit-versus-exam comparison;
2. two fictional, contradictory-looking mammal-weight headlines;
3. gradual data collection: one species becomes one row, the table grows, and
   the same values build a vector checked with `length()` and `head()`;
4. dot plot, histogram and density as different views of one variable;
5. minimum, maximum, mean, median, quartiles and IQR, followed by a visual
   calculation of signed deviations, squared deviations, sample variance and
   SD in the original units. The calculation follows the required
   words → fully expanded values → collapsed numbers → abstract formula order;
6. return to body mass on linear and logarithmic axes;
7. return to the mammal-weight data, construct a boxplot from the raw points, and compare the standard boxplot with a boxplot-plus-violin display in which an orange vertical line adds the arithmetic mean;
8. connect continuous, discrete, nominal and ordinal variables to their R representation and a useful first graph;
9. finish with a five-point summary and a conceptual bridge to two-variable
   questions in a later lesson.

The revised deck deliberately uses short section-divider slides and more
one-idea slides. This restores the calmer pacing of the original presentation
and keeps tables, code, figures and questions vertically balanced rather than
compressing them into the upper part of a slide.

After the first human-review round, the cheetah is introduced as a biological
observation from mammal sleep research; the dataset name is deliberately
withheld until the later table-introduction slide. A second vertical-rhythm pass
centred the content on short prompt, explanation and conclusion slides.
Purposeful fragments now reveal paired summaries, limitations, graph
interpretations and R representations in teaching order, while semantic colour
highlights the terms that students should notice.

A later visual-rhythm correction rebuilt slide 5 as a full-height
question–options–fallback composition rather than a compact centred block.
Correct single-answer questions now follow the established L02–L04 convention:
the options remain visible for voting and RoughNotation draws an indigo circle
around the correct answer on the next reveal. The opening vote now repeats both
headlines, the redundant intermediate same-mean slide was removed, and the
final summary uses restrained semantic highlights to support retrieval.

The final orientation pass restored the planned first-contact function of L01. The title now leads into two personal slides, including the instructor portrait and a regenerated three-image research-focus set, before students see how preparation, a 90-minute lecture and a 90-minute practical fit together. The research-focus illustrations use transparent backgrounds and all labels on that slide are centred. Moodle is identified as the binding student-facing source for Skripta in HTML and print PDF, presentations in HTML and print PDF, and R scripts. The approved conceptual framework in `_internal/obecne/nove/strategie_hodnoceni.md` now supports two concise assessment slides: attendance at lectures and practicals is voluntary while demonstration of competence is compulsory; the practical credit checks an independently completed and explained R workflow, whereas the final exam checks analytical decisions and interpretation from supplied code and outputs. The slides also state the stable AI rule—allowed while learning, forbidden during the controlled credit and exam—while final formats, thresholds, permitted resources, dates and resit arrangements remain binding on Moodle after pilot confirmation.

The same-mean/different-SD comparison now uses two hypothetical companies with the same mean monthly salary of 50 thousand Kč and SDs of 3 versus 12 thousand Kč. Side-by-side histograms with a shared scale and aligned mean lines make the practical meaning of greater spread immediately visible without changing the statistical scope.

The final human-review batches added a transition after IQR that motivates the need for another measure of variation, retained the weight data through the “Statistiky jako vizualizace” section, and completed the boxplot-versus-violin comparison. The standard boxplot remains a conventional median/IQR/whisker summary, while only the richer boxplot-plus-violin display adds the arithmetic mean as an orange vertical line. The variable-type introduction now uses sleep duration, weight, observed-individual count, diet type and size category, and the retrieval prompt repeats the four type names without asking beginners to choose a graph.

## Active learning and scope

The deck contains ten planned interaction checkpoints plus shorter noticing
prompts. They include the opening vote, partner justification, observational
unit, same-mean comparison, graph choice, centre/spread matching, headline
rewrite, boxplot-versus-violin comparison, variable classification and closing
question. Written fallbacks are visible on the interaction slides and do not
depend on a polling service.

The lesson stays within one-variable description. It does not introduce
covariance, correlation, regression, confidence intervals, p-values or causal
claims. The final bridge names the later two-variable question without teaching
its methods.

## Assets and reproducibility

- Generated local figures under `Presentation/Materials/`, including an
  animated GIF that adds represented mammal species to the plot one by one.
- Added three coherent humorous AI illustrations: a cheetah sleeping in
  pyjamas, an elephant on a small scale, and a bat collecting data. Each is
  labelled as an AI-created illustration on the slide; no photographic reuse
  claim or third-party attribution is implied.
- Copied the instructor portrait from `Presentation-FlashTalk-JF-20250926` with its Vladimír Šigut / Charles University attribution.
- Regenerated three coherent square editorial illustrations for biodiversity across scales, ecological big data and methods, and open/reproducible science. Transparent-background variants were created for the slide while preserving the pale internal paper elements. The new assets are labelled as OpenAI-created illustrations on the slide.
- Removed 44 unreferenced tracked assets from the superseded penguin/petal deck;
  they remain recoverable from Git history.
- Refreshed the generated theme cache and component helpers through
  `R/generate_theme.R`.
- Added the bundled RoughNotation extension required by the presentation YAML.
- Kept student-visible code in base R and package-qualified only the source
  dataset (`ggplot2::msleep`).
- Converted displayed dataset-derived values to inline R expressions.
- Presented the ordered light/medium/heavy size variable simply as a size category in the student-facing deck.

## Validation

- `Rscript R/render_presentation.R` completed and printed all 80 slides.
- Rendered outputs: standalone HTML, 80-page PDF, raw PDF and `docs/index.html`.
- The live RevealJS deck reports 80 slides. All slide/fragment states were measured for
  horizontal and vertical overflow in every fragment state; none was detected,
  and all embedded images loaded successfully.
- Full-resolution browser checks covered the restored row/table/vector
  sequence, the animated accumulation, section dividers, minimum through
  variance, the new signed- and squared-deviation plots, the step-by-step
  sample-variance calculation, the SD band and the salary-based same-mean/different-SD histograms, the body-mass
  return, and all three humorous organism illustrations. The equation-specific
  pass verified the teaching order in every reveal state: the contextual
  word-only relationship, the domestic-cat substitution, all nine expanded
  squared deviations, collapsed variance arithmetic, the abstract formula with
  every symbol explained, and the analogous words → numbers → formula SD
  sequence.
- A dedicated review against the canonical lesson vision, active-learning
  guidance and presentation visual-rhythm criteria found the first version too
  top-heavy on several slides and too dependent on whole-slide replacement in
  its second half. The revised deck addresses those findings with centred
  short-slide layouts, 39 fragment/incremental declarations and 63 semantic
  highlight/RoughNotation declarations. Targeted contact-sheet inspection
  covered all six orientation slides and their reveal states, the cheetah introduction, both states of the rebuilt voting slide,
  correct-answer annotations, slide 40, the paired-summary reveal, the
  claim-limitation reveal, boxplot/violin interpretation, all four
  variable-type/R examples, the summary and the closing question.
- Targeted final checks confirmed that the standard boxplot contains no mean marker, while the boxplot-plus-violin plot alone contains the labelled orange vertical mean line.
- `Presentation/presentation.html` and `docs/index.html` have matching hashes.
- Chunk labels are unique, source files are UTF-8 without BOM or replacement
  characters, and `git diff --check` passes.
- The direct lesson-vision review found no remaining credible teaching,
  alignment or scope findings after derived prose values were converted to
  inline R.

## Non-blocking render warnings

- Quarto reports four generated SCSS variables as used before declaration.
  The variables are present in `theme/_colors.scss`, and all semantic colours
  render correctly in the inspected HTML and PDF.
- Resource embedding attempts to fetch bare Google Fonts host URLs and receives
  HTTP 404 responses. The deck still renders with embedded/fallback fonts.
- R reports that package `fs` was built under a newer patch release.

These warnings did not prevent artifact creation or produce a visible defect.

## Human-review outcome

Ondřej Mottl explicitly approved the presentation on 2026-07-28 after the final body-mass boxplot and violin-plot corrections. Stage 5 is closed with no remaining content or visual-review requests.

All intended Stage 4–5 presentation sources, generated outputs, assets and workflow records are staged on `lesson/l01-presentation`. No commit, push or pull request has yet been made.
