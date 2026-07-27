# L01 Stage 2–3 reconstruction plan

## Intended outcome

Rebuild the `msleep` written lesson around the pedagogical progression that
made the pre-dataset-change version effective:

1. follow one measured variable from field record to table and R vector;
2. inspect the vector in R;
3. visualize before calculating;
4. introduce descriptive statistics one at a time, each with a visual anchor;
5. construct the boxplot from already understood statistics;
6. only then generalize to variable types and their suitable displays.

The result should remain a self-contained first encounter with biostatistics
for biology students with little or no prior statistics or R experience.

## Learning outcomes and concrete student actions

Canonical L01 outcomes:

- distinguish variable types and select an appropriate summary;
- create and interpret a clear one-variable graph.

After the reconstructed lesson, students should be able to:

1. explain what one row and one value represent, enter a few observations into
   an R vector, and inspect it with `length()` and `head()`;
2. read a dot plot, histogram, density plot, bar chart, and boxplot, including
   their common English names;
3. explain why a graph must precede a numerical summary;
4. locate and interpret mean, median, quartiles, IQR, minimum, maximum, and SD
   in numbers and on a graph;
5. distinguish continuous, discrete, nominal, and ordinal variables and choose
   an appropriate first graph and summary.

## Deliberate data roles

- `sleep_total` is the main teaching variable for the gradual
  vector–visualization–statistics–boxplot sequence. It is complete, measured
  in familiar hours, and has a readable linear scale.
- `bodywt` retains the opening “typical mammal” news-headline mystery. Its
  strong asymmetry becomes the payoff when comparing mean and median.
- `vore` supplies the nominal example.
- the number of represented species per taxonomic order supplies the
  transparent discrete example, with the changed observational unit stated.
- terciles of observed body weight supply the explicitly artificial ordinal
  example; they must never be presented as a biological classification.

## Structural reconstruction

### Retain from the current draft

- welcome and course/material orientation;
- “Jak číst skripta,” including HTML/PDF, tabsets, callouts, and questions;
- learning outcomes;
- the two fictional body-weight headlines and initial vote;
- dataframe, row, column, observational-unit, and species-versus-individual
  explanations;
- provenance, missingness, online glossary, and bridge to the next topic;
- real `msleep` values and data-derived inline results;
- current brand-consistent HTML/PDF table and callout styling.

### Restore from the pre-change lesson

1. **One observation becomes data**
   - show four real species records and how sleep was measured/entered;
   - create a four-value vector visibly in base R;
   - derive the full `sleep_total` vector from the dataframe;
   - inspect it with `length()` and `head()`.
2. **Visualization before statistics**
   - compare two labelled didactic samples with the same mean but different
     shapes;
   - show dot/beeswarm, histogram, and density plot as a crafted gallery;
   - pair every graph with readable base-R code;
   - restore optional bin-width comparison and explain what changes and what
     stays fixed.
3. **Descriptive statistics, each made visible**
   - use nine real, familiar mammal species as a small worked example;
   - restore mean, median, percentiles, IQR, minimum, maximum, variance, and SD
     in a gradual order;
   - pair minimum, maximum, median, IQR, mean, and SD with annotated graphics;
   - retain the current required words → concrete values → symbols progression;
   - restore the same-mean/different-spread comparison;
   - resolve the opening body-weight mystery after mean and median are known.
4. **Statistics become a boxplot**
   - build median, box/IQR, whiskers, and possible outliers in successive
     figures;
   - show the final base-R command and a compact reading key;
   - follow the boxplot with a violin-plus-boxplot example that reveals
     distribution shape while retaining familiar summaries;
   - state clearly what the boxplot hides as well as what it summarizes.
5. **Variable types as the finale**
   - move the current real-world type explanations to the end;
   - retain the “same value 37, different meanings” contrast;
   - give each type biological examples, R representation, suitable summaries,
     and possible visualizations;
   - end with a classification exercise and a compact decision map.

## Corrections rather than literal restoration

The old structure is authoritative for pacing, not for every claim or coding
choice. The reconstruction will:

- use “numerická,” not the discouraged student-facing term “kvantitativní”;
- explain that R storage type (`integer`/`double`) is not the same as
  statistical variable type;
- avoid claiming that integer storage prevents decimal assignment;
- avoid presenting mean ± SD coverage as a universal rule;
- avoid calling boxplots universally “best” for group comparison;
- keep hidden preparation namespaced and student-visible code in base R;
- keep lesson objects near the passage that first teaches them;
- avoid inline helper-function definitions;
- preserve the canonical four-stage formula pedagogy and data-derived numbers.

## Scope boundaries

Out of scope:

- relationships between two variables;
- inference, sampling uncertainty, confidence intervals, and hypothesis tests;
- formal probability distributions;
- logarithmic transformation as a general method;
- statistical models beyond a short bridge explaining why variable type later
  constrains model choice.

## Implementation and validation gates

1. Reorganize data preparation and create the vector/data-entry section.
   - Gate: source order mirrors conceptual order; all visible code runs alone.
2. Restore the visualization gallery and bin-width comparison.
   - Gate: every display has a noticing prompt, explanatory payoff, English
     search term, and legible HTML/PDF output.
3. Restore statistic-by-statistic visual explanations and boxplot construction.
   - Gate: every equation follows the required four-stage progression; every
     worked number can be traced to a table or graph.
4. Move and strengthen the variable-types finale.
   - Gate: examples, summaries, graphs, and R representations are mutually
     consistent; the artificial ordinal example remains explicit.
5. Complete glossary-coverage and lesson-vision reviews.
   - Gate: credible findings resolved before human handoff.
6. Render HTML and PDF, exercise interactive elements, and visually inspect all
   PDF pages plus high-risk figures/tables at full resolution.

## Human review focus

- Does the restored sequence feel as compelling and carefully paced as the
  pre-change lesson?
- Is using sleep duration for the gradual scaffold and body weight for the
  opening/mean–median payoff coherent?
- Is the lesson detailed enough for independent preparation without becoming
  too long for a first meeting?
- Which optional technical callouts, if any, should be shortened after the
  structural quality is restored?
