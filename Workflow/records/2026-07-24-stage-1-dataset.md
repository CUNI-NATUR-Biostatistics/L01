# Stage 1 — L01 dataset research and decision

## Metadata and checkpoint

- Week: L01
- Date: 2026-07-24
- Author: Codex with course-owner direction
- Reviewer: Ondřej Mottl
- Branch: `lesson/l01-scope-data`
- Base: `main` at `8927f7b`
- Status: broad search complete; awaiting human selection

## Dataset requirements

The data must be distinct from Palmer Penguins and immediately legible to
first-year biology students. It must support a compelling two-claim detective
hook plus observational units, all four variable types, frequencies,
mean/median, SD/IQR, and one-variable graph choice. Provenance and acquisition
must be reproducible, and a prepared teaching extract must not hide its source
or cleaning decisions.

## Broad discovery

Ten credible candidates from six independent source families were inspected.
Candidates from the same source family count as separate examples, not as
independent sources.

| Source | Dataset | Exact variables considered | Unit and sampling story | Useful teaching pattern | Main complication | Decision |
|---|---|---|---|---|---|---|
| [ggplot2 / Savage & West (2007)](https://ggplot2.tidyverse.org/reference/msleep.html) | `msleep` mammals | `name`, `vore`, `order`, `conservation`, `sleep_total`, `bodywt` | One mammal species; sleep and mass compiled across species | Extreme right skew makes mean versus median consequential; small table; familiar organisms | Feeding/order/conservation fields were added from Wikipedia; conservation has many missing values | finalist |
| [Konza Prairie LTER / EDI](https://lter.github.io/lterdatasampler/articles/knz_bison_vignette.html) | `knz_bison` | animal ID, sex, year, year of birth, weight | One annual roundup measurement of an identified bison, 1994–2020 | Strong fieldwork story; sex nominal, age discrete, weight continuous | Repeated animals create dependence; age dominates weight; 252 missing cells | reject |
| [Plum Island Ecosystem LTER](https://lter.github.io/lterdatasampler/articles/pie_crab_vignette.html) | `pie_crab` | site, latitude, water temperature, crab size | One adult male fiddler crab, 25–37 from each of 13 marshes in 2016 | Clear biological context and clean measurements | Naturally a two-variable/geographic question; weak ordinal component | reject |
| [Andrews Forest LTER](https://lter.github.io/lterdatasampler/articles/and_vertebrates_vignette.html) | `and_vertebrates` | species, habitat/treatment, length, weight, date | One captured trout or salamander in long-term stream sampling | Rich biological observations and measurement types | 32,209 rows, extensive missingness, dependence and study-design burden | reject |
| [Hubbard Brook LTER](https://lter.github.io/lterdatasampler/articles/hbr_maples_vignette.html) | `hbr_maples` | treatment, watershed, stem length, leaf area, leaf mass | One measured sugar-maple seedling/leaf in a manipulation | Tangible measurements and experimental context | Treatment comparison pulls the lesson toward L02/inference; substantial missingness | reject |
| [London Fire Brigade](https://data.london.gov.uk/dataset/animal-rescue-incidents-attended-by-lfb-2ogkn) | animal rescue incidents | animal group, incident date, borough, pump count/hours, notional cost | One attended rescue incident, January 2009 onward | Memorable public-service story; frequency, count and skewed continuous measures | Evolving spreadsheet schema; location fields must be removed; no strong natural ordinal variable | finalist |
| [NYC Parks / NYC Open Data](https://data.cityofnewyork.us/Environment/2015-Street-Tree-Census-Tree-Data/uvpi-gqnh/about_data) | 2015 Street Tree Census | tree ID, status, health, species, diameter, stewardship, borough | One mapped street tree recorded in a citywide census | All four types are natural; health is ordinal; strong outlier/graph-choice hook | 683,788 rows and a 220 MB full download require a documented extract; citizen-science quality caveats | finalist |
| [Pladias](https://www.pladias.cz/download/features) | Czech flora traits and Red List status | taxon, trait values, national/IUCN threat categories | One Czech vascular-plant taxon compiled from cited trait/status sources | Czech biological relevance and genuinely ordered conservation categories | Many linked tables and source-specific definitions; redistribution terms need case-specific confirmation | reject |
| [Geoportal Praha](https://geoportalpraha.cz/en/data-and-services/open-data) | Prague urban tree/geospatial candidates | species, dimensions, condition, location where available | One mapped urban tree from municipal records | Local context; CC BY open-data route | Exact stable table/schema still needs selection; GIS fields add unnecessary tooling | reject |
| [Dublin City Council / data.gov.ie](https://data.gov.ie/dataset/trees1) | Dublin trees | species, age class, condition, stem diameter, spread, height | One municipal tree inventory record | Natural ordinal age/condition and continuous size | Access reliability and schema documentation were weaker during the probe | reject |

### Transferable patterns retained from rejected candidates

- Start with a measurement context students can picture.
- State whether a row is a species, individual, repeated measurement, or event.
- Use ordered categories only when their ordering is substantive.
- Treat large open-data tables as provenance sources, then publish a
  deterministic, documented teaching extract.
- Do not let an attractive bivariate biological question expand L01 into L02.

## Finalist comparison

| Finalist | Outcome fit | Immediate hook | Interpretability | Buildability | Practical feasibility | Main risk | Rank |
|---|---|---|---|---|---|---|---:|
| Mammalian sleep (`msleep`) | Very high for centre/spread and nominal categories; adequate ordinal status | “The average mammal weighs 166 kg; the median weighs 1.67 kg. Which describes a typical mammal?” | Excellent | Excellent: 83 rows, 11 variables | Excellent; shipped in `ggplot2` with stable documentation | Conservation provenance/missingness must be explicit; species are not a random sample of all mammals | 1 |
| NYC street trees | Excellent across discrete, continuous, nominal, and ordinal variables | “A typical living street tree is 10 inches wide, but the mean is 11.7—and one record says 425. Which display should we trust?” | High | High after a carefully documented extract | Moderate; stable official CSV/API but very large | Extract and citizen-science quality story may consume orientation time | 2 |
| London animal rescues | High except for ordinal type | “Most rescues cost £352, while the mean is £404; what does ‘typical rescue’ mean?” | High | High after cleaning | Moderate; official OGL spreadsheet, updated over time | Schema drift, sensitive location fields, and weak ordinal variable | 3 |

## Numerical and practical probes

### Finalist 1 — Mammalian sleep

- Provenance/access: `ggplot2::msleep`; 83 species × 11 variables. Sleep and
  mass data cite Savage & West (2007); `order`, `conservation`, and `vore`
  were added from Wikipedia.
- Missingness: 136 missing cells in the full table; conservation is missing
  for 29 of 83 species.
- `bodywt` (kg): mean 166.14, median 1.67, SD 786.84, IQR 41.58,
  range 0.005–6654.
- `sleep_total` (hours/day): mean 10.43, median 10.10, SD 4.45,
  IQR 5.90, range 1.9–19.9.
- `vore`: herbivore 32, omnivore 20, carnivore 19, insectivore 5,
  missing 7.
- Hook feasibility: the body-mass mean/median contrast is genuine and large,
  and a dot/histogram view immediately explains it. Conservation can teach
  ordered categories and missingness, but must not be framed as a complete
  current conservation assessment.

### Finalist 2 — NYC 2015 Street Tree Census

- Provenance/access: official NYC Open Data download/API, dataset ID
  `uvpi-gqnh`; full probe downloaded reproducibly from the official CSV route.
- Size: 683,788 rows × 45 columns; 652,173 living trees, 17,654 stumps and
  13,961 dead trees.
- Health among records: Good 528,850; Fair 96,504; Poor 31,616; blank 26,818.
- Diameter of living trees (inches): mean 11.71, median 10, SD 8.63,
  IQR 11, range 0–425.
- Hook feasibility: health supplies a natural order, species/borough are
  nominal, diameter continuous and stewardship/count fields discrete.
  The 425-inch record makes graph choice and robust summaries meaningful.
- Required preparation: freeze a deterministic subset or selected columns,
  record the API query/hash/date, retain an official first-party download
  path, and explain census/citizen-science measurement errors.

### Finalist 3 — London Fire Brigade animal rescues

- Provenance/access: London Fire Brigade via London Datastore, Open Government
  Licence v3, official file covering January 2009–April 2026 at probe time.
- Size: 13,470 incidents × 31 imported columns; 9,608 missing cells.
- Animal group: cat 52.4%, bird 19.4%, dog 13.3%, fox 5.9%; remaining groups
  form a long tail.
- Cleaned notional cost: 13,239 observed, 231 missing; mean £404.20,
  median £352, SD £205.57, IQR £132, range £0–£3912.
- Pump hours: 13,373 observed, 97 missing; mean 1.166, median 1,
  SD 0.577, IQR 0, range 0–12.
- Hook feasibility: animal frequencies and cost skew are accessible, but cost
  is explicitly notional rather than actual expenditure.
- Required preparation: remove all location fields beyond a safe broad area,
  normalize columns that changed across years, freeze a dated extract, and
  find an honest ordinal variable or accept that this finalist does not fully
  cover the intended type taxonomy.

## Recommendation and human decision

Recommended dataset: **Mammalian sleep (`msleep`)**.

It produces the cleanest first-lesson detective challenge with the least
tooling burden. The two true statements—mean mammal body mass 166 kg versus
median 1.67 kg—force students to ask what a row represents, inspect the
distribution, compare centre/spread, and choose a graph before trusting
“typical.” The same compact table supports nominal diet/order and an explicitly
caveated ordered conservation field.

Alternative choices:

1. **NYC trees** if natural coverage of all four types and open-data provenance
   outweigh the cost of a large, noisy source and prepared extract.
2. **London rescues** if the strongest playful public-facing hook is preferred,
   accepting weaker fit for ordinal data and more cleaning.

### Proposed minimal story for `msleep`

- Opening vote: “A typical mammal weighs 166 kg” versus “a typical mammal
  weighs 1.67 kg.” Both calculations are correct; which claim is useful?
- Evidence path: identify one row as a mammal species, classify variables,
  inspect the mass distribution, compare mean/SD with median/IQR, and choose
  a graph that reveals the influential species.
- Resolution: neither number is universally “the” typical mammal; the
  defensible summary depends on the distribution, the question, and what the
  dataset represents.
- L02 bridge: after describing one variable honestly, ask whether sleep time
  changes with body mass or feeding group.

## Gate checklist

- [x] At least four independent source families were consulted.
- [x] At least eight non-trivial candidates were reviewed.
- [x] Exact variables, observational units, sampling stories, provenance, and
  practical complications were inspected.
- [x] Three finalists were compared and numerically probed.
- [x] Rejection reasons and transferable patterns were recorded.
- [ ] Human reviewer approved the dataset.
- [ ] Dataset locked for implementation.
- [ ] Planning PR merged.

No Stage 2–3 source authoring may begin until the final three boxes are
resolved.
