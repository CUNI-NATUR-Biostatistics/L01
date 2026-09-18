# L01 colleague-feedback revision map

- Date: 2026-09-16
- Branch: `lesson/l01-presentation-standards`
- Source: Tomáš Herben and Tomáš Jor comments on the July L01 release
- Presentation story-map status: complete; human approval: approved by the human author in this session on 2026-09-16, without requested revisions
- Written-material story-map status: complete; human approval: approved by the human author in this session on 2026-09-16, without requested revisions
- Scope: focused corrections to the approved narrative; preserve the existing sequence and activities.

## Presentation story-map addendum

| Internal role | Existing student-facing heading | Planned visible change | Speaker note |
| --- | --- | --- | --- |
| Make the mass-to-sleep transition explicit | Od organismu k datům | One short bridge explains that the same mammal table supplies both variables and that sleep is the worked example before returning to mass. | Point back to the opening question without promising a mass analysis on every intermediate slide. |
| Clarify the visual encoding | Jak vypadá spánek všech zastoupených druhů? | One sentence states that vertical jitter only separates points; it is not a measured y variable. | Explain point overlap rather than a second biological axis. |
| Explain a new display | Stejná data, ale jako hladký tvar | One sentence says the density curve smooths the observed values; height is density, not a species count. | Avoid a kernel formula. |
| Set a visual convention | Mean, median, quartile, and boxplot sequence | Keep median solid, mean dashed, quartiles visually distinct; label the mapping where both statistics appear. | The native boxplot median remains solid, matching the custom convention. |
| Qualify observed extremes | Maximum: největší pozorovaná hodnota | Note that minima and maxima depend strongly on sample size and the most extreme observations. | Ask what might happen when more species are added. |
| Explain the divisor intuitively | Rozptyl rozdělí součet | Before the n − 1 formula, contrast one observation with two after estimating the mean. | Show that one deviation fixes the other, without a formal degrees-of-freedom lesson. |
| Complete the existing construction | Přidáme vousy | State the 1.5 × IQR whisker rule and that beyond-whisker points are flags, not errors; ensure plotted whiskers use the same raw-scale rule as the written materials. | A logarithmic display scale must not silently change the underlying definition. |
| Broaden the type examples | Jeden netopýr, různé typy údajů; Diskrétní numerická proměnná | Add species as a category and contrast small counts with counts that can take many values. | Interpretation depends on the count's range and purpose. |

## Presentation knowledge-state ledger

| Concept | Known before edit | Established by edit | Later use |
| --- | --- | --- | --- |
| One table can contain multiple variables | Opening mass question and mammal dataset | Sleep is explicitly identified as the worked variable | Return to mass headline and boxplot |
| One-variable dot plot | Each point is one species | Vertical jitter is display-only | Histogram and density comparison |
| Mean, median, quartiles | Defined progressively | Stable line styles prevent role changes | Boxplot and distribution comparison |
| Variance and boxplot | Deviations, center, quartiles, IQR | n − 1 intuition and raw-scale whisker rule | Interpretation without formal theory |
| Statistical type | Meaning and origin of a value | Species is categorical; counts require context | Choice of first summary and graph |

## Written-material story-map addendum

| Internal role | Existing student-facing heading | Planned change | Speaker note |
| --- | --- | --- | --- |
| Support a complete explanation of variance | Výběrový rozptyl | Add the one-versus-two-observation intuition before the formula. | Retain the current numerical example and code. |
| Keep type choice contextual | Numerická diskrétní proměnná | Add the small-count versus large-count contrast. | Retain the current four statistical types. |

## Written-material knowledge-state ledger

| Concept | Known before edit | Established by edit | Later use |
| --- | --- | --- | --- |
| Mean and deviations | Already derived from the nine-species example | Estimating the mean consumes one independent deviation | Sample variance formula |
| Counting variables | Discrete numbers arise by counting | Analysis choice also depends on possible range and biological meaning | Choice of graph and summary |

The existing written materials already explain boxplot whiskers and note that extrema depend on an extreme observation; these are not duplicated as new sections.

## Implementation and validation

- Implemented the transition, visual-encoding notes, summary caveats, line-style convention, variance intuition, boxplot rule, and variable-type examples in `Presentation/presentation.qmd`; added matching variance and discrete-count explanation to `Learning_materials/skripta.qmd`.
- Corrected the illustrated boxplot to compute whiskers and flagged points in kilograms before using a logarithmic display axis. The raw-scale rule flags 11 observations; computing the rule after log transformation would flag none and would contradict the written materials.
- Canonical `R/render_skripta.R` completed after removing inherited `C.UTF-8` locale variables unsupported by Windows R; canonical offline `R/render_presentation.R` completed after the final mean-line correction. Artifacts: 47-page skripta PDF and 80-slide presentation PDF, with presentation HTML identical to `docs/index.html`.
- Checked the focused rendered pages for transition, graph encoding, extrema, variance, boxplot sequence, and types; checked UTF-8, duplicate chunk labels, R parsing, and focused `git diff --check`.
- Fresh `renv::status()` reports dependency and version drift in this local environment. `renv.lock` was not changed for this feedback revision; no snapshot was taken.
- Independent `vision-corrector` review found one medium boxplot consistency issue: displayed quartiles used `quantile()` while whiskers/outliers used `boxplot.stats()` hinges. Resolved by deriving box edges, median, whiskers, outliers, IQR, and fences from the same raw-scale `boxplot.stats()` result; both canonical artifacts were rerendered and corrected slides 63–66 were visually rechecked.
- Narrow independent re-review confirmed that the boxplot finding is resolved and that no blocker remains in the corrected sections.

## 2026-09-18 author feedback revision

The detailed sum-of-squares, sample-variance, and SD calculation in `Learning_materials/skripta.qmd` is now inside a collapsed Extra box. The signed-deviation graph and a short SD definition remain in the main flow.

Validation: canonical `Rscript R/render_skripta.R` passed; the 47-page PDF was visually checked across the Extra box and the following SD explanation. Fresh-session `renv::status()` reports pre-existing library/lockfile drift unrelated to this text-only edit.
