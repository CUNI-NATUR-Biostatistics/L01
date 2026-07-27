# Stages 4–5 — L01 presentation review draft

## Metadata

- Week: L01
- Date: 2026-07-27
- Author: Codex with course-owner direction
- Canonical presentation review: completed by Codex against the course vision,
  active-learning and visual-rhythm criteria
- Human reviewer: Ondřej Mottl, pending
- Branch: `lesson/l01-presentation`
- Base: `main` at `f2aa8f0`
- Written-materials dependency: PR #5 merged
- Status: revised presentation ready for another Stage 5 human-review pass
- Storyboard: `Workflow/records/2026-07-27-stage-4-5-presentation-plan.md`

## Implemented teaching story

The inherited Palmer Penguins deck was replaced with a 74-slide Czech RevealJS
presentation derived from the approved `ggplot2::msleep` learning materials.
The recurring question is how much a “typical” mammal weighs and what must be
known before one summary number can be interpreted responsibly.

The sequence is:

1. two fictional, contradictory-looking mammal-weight headlines;
2. gradual data collection: one species becomes one row, the table grows, and
   the same values build a vector checked with `length()` and `head()`;
3. dot plot, histogram and density as different views of one variable;
4. minimum, maximum, mean, median, quartiles and IQR, followed by a visual
   calculation of signed deviations, squared deviations, sample variance and
   SD in the original units. The calculation follows the required
   words → fully expanded values → collapsed numbers → abstract formula order;
5. return to body mass on linear and logarithmic axes;
6. construct a boxplot from the raw points and compare it with a violin plot;
7. connect continuous, discrete, nominal and artificial ordinal variables to
   their R representation and a useful first graph;
8. finish with a five-point summary and a conceptual bridge to two-variable
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
- Removed 44 unreferenced tracked assets from the superseded penguin/petal deck;
  they remain recoverable from Git history.
- Refreshed the generated theme cache and component helpers through
  `R/generate_theme.R`.
- Added the bundled RoughNotation extension required by the presentation YAML.
- Kept student-visible code in base R and package-qualified only the source
  dataset (`ggplot2::msleep`).
- Converted displayed dataset-derived values to inline R expressions.
- Kept the artificial light/medium/heavy mass variable explicitly labelled as a
  didactic category rather than a biological standard.

## Validation

- `Rscript R/render_presentation.R` completed and printed all 74 slides.
- Rendered outputs: standalone HTML, 74-page PDF, raw PDF and `docs/index.html`.
- The live RevealJS deck reports 74 slides. All 98 slide/fragment states were
  measured for
  horizontal and vertical overflow in every fragment state; none was detected,
  and all embedded images loaded successfully.
- Full-resolution browser checks covered the restored row/table/vector
  sequence, the animated accumulation, section dividers, minimum through
  variance, the new signed- and squared-deviation plots, the step-by-step
  sample-variance calculation, the SD band and two SD histograms, the body-mass
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
  short-slide layouts, 33 fragment/incremental declarations and 53 semantic
  highlight/RoughNotation declarations. Targeted contact-sheet inspection
  covered the cheetah introduction, both states of the rebuilt slide 5,
  correct-answer annotations, slide 40, the paired-summary reveal, the
  claim-limitation reveal, boxplot/violin interpretation, all four
  variable-type/R examples, the summary and the closing question.
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

## Human-review focus

Please review:

1. whether 74 short slides, including seven section dividers, are comfortable
   for the intended 90-minute pace;
2. whether the opening vote and later headline rewrite tell the desired story;
3. whether the overlap with L02 feels like useful rehearsal rather than excess;
4. whether the restored observation → row → vector → animated dataset sequence
   now has the desired gradual rhythm;
5. whether minimum → maximum → mean → median → quartiles → IQR → deviations →
   fully expanded squared deviations → collapsed variance → abstract formula
   → SD is the right descriptive-statistics depth;
6. whether the humorous animal illustrations have the desired tone;
7. whether the final variable-type/R block is concise enough for a first lesson;
8. whether the revised fragments, semantic highlights and vertical rhythm match
   the lecturer's preferred live pacing.

No files have been staged, committed, pushed or submitted as a PR. Stage 5
remains open until the course owner explicitly approves the presentation.
