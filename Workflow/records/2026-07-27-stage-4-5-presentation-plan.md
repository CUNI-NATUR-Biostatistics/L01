# Stages 4–5 — L01 presentation plan

## Metadata and checkpoint

- Week: L01
- Date: 2026-07-27
- Author: Codex with course-owner direction
- Reviewer: pending
- Branch: `lesson/l01-presentation`
- Base: `main` at `f2aa8f0`
- Written-materials dependency: PR #5 merged
- Status: Stage 4 storyboard approved for implementation by the course-owner instruction to begin the next stage

## Intended outcome

Replace the inherited Palmer Penguins presentation with a coherent 90-minute RevealJS lecture derived from the approved `ggplot2::msleep` learning materials. The deck should introduce the course through one biological data story, remain understandable without the optional R preparation lesson, and prioritize prediction, discussion, visual inspection, and interpretation over dense exposition.

The recurring question is:

> How much does a “typical” mammal weigh, and what must we inspect before trusting one number?

The opening presents two fictional headlines based on the same 83 represented mammal species. The answer is deliberately postponed until students can identify the observational unit, inspect a one-variable distribution, compare measures of centre and spread, and judge what each graph reveals or hides.

## Explicit non-goals

- Do not teach relationships between two variables, covariance, correlation, regression, confidence intervals, p-values, or causal conclusions.
- Do not turn the lecture into a syntax lesson or reproduce the detail of `Learning_materials/skripta.qmd`.
- Do not use Palmer Penguins or retain inherited penguin-specific figures, code, or claims.
- Do not invent unresolved course-policy facts. The deck will contain only a concise, factual orientation; the five written-material release blockers remain unresolved.
- Do not begin practical-exercise authoring.

## Design decisions

- Use approximately 45–48 slides for a 90-minute lecture.
- Use the approved opening order: manual title → biological/data question → learning outcomes.
- Do not add a previous-lesson callback because L01 must stand alone without the optional technical preparation lesson.
- Keep one anchor distribution—mammalian sleep duration or body mass—recognizable across the lecture.
- Introduce each statistical term only after a concrete data moment and noticing prompt.
- Use at least eight interaction moments, never leaving more than about ten slides without an explicit student task.
- Keep every voting fallback visible from the start and task-specific.
- Use local hidden chunks for plot production and save figures to `Presentation/Materials/`.
- Use visible base R only after the corresponding manual or visual idea is established.
- Preserve the semantic palette: grey observations, purple statistical summaries, orange interpretation or attention.

## Storyboard

| Block | Approximate slides | Teaching sequence | Main interaction |
|---|---:|---|---|
| Welcome and data-detector hook | 1–7 | Title; two contradictory-looking fictional headlines; learning outcomes; compact course workflow; vote; partner justification; postpone the answer | Vote: which headline can be correct, with a no-vote written justification |
| From measurement to row and vector | 8–13 | Four real species records; identify one row; distinguish species from individual; rewrite the four sleep values as a vector; use `length()` and `head()`; reveal the full dataframe | Partner task: what exactly does one row represent? |
| Look before summarising | 14–20 | Two small samples with the same mean but different shapes; full sleep dot plot; dot plot, histogram, and density as three views of the same variable; bin-width caveat kept brief | Prediction: which graph best exposes individual values, distribution shape, or interval counts? |
| Centre and spread | 21–32 | Nine real species; place a plausible centre; arithmetic mean; sensitivity to extreme values; ordered middle and median; quartiles and IQR; distances from the mean and SD; pair compatible centre/spread summaries | Matching task: mean ↔ SD and median ↔ IQR, with reasoning |
| Return to the mammal headlines | 33–36 | Body mass on linear and logarithmic scales; reveal that both calculations are correct; explain why neither headline alone describes a universal “typical mammal”; restate the species-level limitation | Editorial task: rewrite one headline into a defensible sentence |
| Build a boxplot from summaries | 37–41 | Raw sleep values plus median; add IQR box; add whiskers and possible outliers; read the completed boxplot; compare with violin-plus-boxplot | Prediction: what important feature can a boxplot hide? |
| Variable types as a practical decision | 42–47 | The same printed value can mean different things; continuous, discrete, nominal, and ordinal examples; connect each to R representation and a useful first graph; explicitly label the mass groups as an artificial teaching classification | Classification task using four real-world variables |
| Close and bridge | 48–49 if needed | Compact decision map; 3–5 key ideas; closing conceptual question; bridge from honest description of one variable to a later question about two variables | Closing question: what information is needed before answering “what is typical?” |

The exact slide count may contract during rendering if two consecutive slides can be combined without violating one-idea-per-slide or progressive-disclosure rules.

## Planned interactions

1. Opening vote on the two fictional headlines.
2. Partner justification immediately after the vote.
3. Identify the observational unit in the four-row table.
4. Compare two samples with the same mean but different shapes.
5. Choose which graph answers a stated one-variable question.
6. Match compatible summaries of centre and spread.
7. Rewrite a misleading headline after the body-mass reveal.
8. Predict what the boxplot hides and whether a violin plot helps.
9. Classify four real-world variables and choose a first graph.
10. Closing conceptual question.

## Planned local figures

- two samples with the same mean but different shapes;
- compact quasirandom dot plot of mammalian sleep;
- aligned dot plot, histogram, and density views;
- nine-species centre and spread sequence;
- same mean with different SD;
- body-mass distribution on linear and logarithmic scales;
- boxplot construction steps and final violin comparison;
- continuous, discrete, nominal, and ordinal example graphs.

Each figure will be inspected in the rendered slide footprint. Wide output dimensions alone will not count as evidence that the plotted data fill the slide.

## Validation gates

### Storyboard gate

- Map every block to the approved L01 outcomes and explicit out-of-scope list.
- Check that no statistical term opens its concept block.
- Check interaction cadence and no-vote fallbacks.
- Check that the body-mass question returns after students have enough tools to answer it.

### Implementation gate

- Replace the inherited penguin deck rather than mixing two data stories.
- Update the local presentation theme cache to the current component system.
- Keep visible R code base-only, short, and locally understandable.
- Keep hidden R objects and saved figures close to the slide block that uses them.
- Preserve UTF-8 without BOM and Czech student-facing language.

### Render gate

- Render through `Rscript R/render_presentation.R`.
- Verify `Presentation/presentation.html` and `docs/index.html` hashes match.
- Render a whole-deck overview and inspect every slide.
- Inspect high-risk slides at full size: headline vote, graph gallery, mean/median/IQR/SD sequence, body-mass return, boxplot build, and variable-type decision map.
- Exercise fragments, incremental reveals, and voting fallbacks in a browser.
- Inspect the generated PDF and confirm that the final static state remains understandable.

### Review gate

- Perform the lesson-vision review for the completed draft.
- Review alignment with `Learning_materials/skripta.qmd`, active-learning cadence, visual rhythm, semantic colour use, and L02 scope boundary.
- Stop for course-owner review before staging, committing, pushing, or creating a PR.

## Main risks

- The approved written materials are detailed enough to tempt an overlong, text-heavy deck. The presentation must select rather than reproduce.
- Too many dot plots and summary overlays could produce one visual rhythm. Use prompts, code/output pairs, comparisons, and checkpoints as contrast.
- Mean, median, IQR, and SD can become a list of definitions. Each must arise from a visible need in the same small data example.
- The final variable-type block can become a taxonomy lecture. Keep it grounded in real values, R representation, and a first graph decision.
- Course-policy details remain unknown. Do not conceal or invent them; keep them outside the statistical lecture until supplied.
