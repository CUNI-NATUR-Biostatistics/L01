# L01 exercise blueprint

## Metadata

- Week: L01
- Date: 2026-08-27
- Author: Codex with course-owner direction
- Human plan approval: Ondřej Mottl, 2026-08-27
- Repository state at drafting: `main`; no branch or Git state change was authorized
- Presentation dependency: PR #6 merged on 2026-07-29
- Human exercise approval: Ondřej Mottl, 2026-08-27
- Status: complete and approved; ready for course-owner commit and push

## Intended use

The same public `Exercises/cviceni.R` supports a teacher-paced 90-minute practical and independent self-study. The shared route contains approximately 60-65 minutes of direct work, leaving time for explanation and slower groups. A separate bank of 25 optional tasks supports faster students and later revision.

## Outcomes-to-task map

| Approved L01 outcome | Core tasks |
|---|---|
| Explain rows, columns and values; create and inspect a vector | L01-K04 to L01-K05 |
| Read one-variable point, histogram, bar and boxplot displays | L01-K06 to L01-K09 |
| Explain why visualization precedes numerical summary | L01-K06 to L01-K08, L01-K17 |
| Find and interpret minimum, maximum, mean, median, quartiles, IQR and SD | L01-K10 to L01-K11, L01-K16; optional transfer in L01-N25 |
| Distinguish continuous, discrete, nominal and ordinal variables and choose a suitable first description | L01-K13 to L01-K14 |
| Complete a question-to-interpretation one-variable workflow | L01-K15 to L01-K17 |

## Assumed knowledge and permanent refresher

L01 permanently retains a bounded, skippable refresher covering script versus console, `Ctrl + Enter`, comments, calculator use, `<-`, objects in the current session, and the script as a durable record. Teachers may skip it when the group is already comfortable with these skills. Projects, paths, CSV import/export, and general package management remain outside L01.

## Timing budget

| Segment | Direct-work target |
|---|---:|
| Skippable R-basics refresher, including a facilitated checkpoint | 12-15 min |
| Rows, columns, values and vectors | 8 min |
| One-variable graphs | 12 min |
| Centre and variability | 10 min |
| Variable types and description choice | 10 min |
| Integrated typical-mammal task | 10 min |

The direct-work estimate is 62-65 minutes. With teacher explanation, comparison of answers and transitions, the intended facilitated route is 80-90 minutes. `L01-K03` is a short teacher-led checkpoint rather than an individual task, and the longer same-mean/different-variability comparison was moved to optional task `L01-N25`. Optional tasks are excluded from the shared timing. A novice classroom timing trial remains part of human review.

## Data and dependencies

- Approved dataset: `ggplot2::msleep`
- Observational unit: one mammal species represented in the dataset
- Package dependency: `ggplot2`, checked with `requireNamespace()` and never installed automatically
- Core vectors: total sleep, body mass, feeding type, counts of represented species per taxonomic order, and a short artificial ordered example
- External files, working-directory assumptions, private helpers, and internet access: none

## Optional practice plan

The 25 optional tasks are grouped as object practice, numerical summaries, graphs, variable types, missing values, integrated workflows, debugging, and reflection. They repeat established L01 concepts with progressively less scaffolding and do not define a second mandatory route.

## Out of scope

- relationships between two variables;
- grouped comparisons and two-sample summaries;
- dplyr, pipes, loops, and custom functions;
- statistical models, inference, and diagnostics;
- general R project, path, import, export, or package-management instruction;
- a public or private full answer key in this work.

## Archive use

The archive under `_internal/R/old` was used only to identify hazards: stateful `attach()`, working-directory and local-file dependence, required `View()`, `T` / `F`, persistent `par()`, distant object dependencies, excessive lecture prose, and premature manipulation syntax. No archive wording, structure, object naming, or code was adopted as a template.

## Validation and review record

- Clean-session execution: passed from a temporary working directory with `Rscript --vanilla`
- Complete untracked reference solution: passed for demonstrations, numerical expectations and task computations
- UTF-8 and prohibited-pattern checks: passed; UTF-8 without BOM, no executable automatic installation, `library()`, `require()`, `setwd()`, `attach()` or required `View()`
- Independent exercise review: passed after the complete review and a focused
  progressive-hint audit of all 40 task pairs; no remaining findings
- Human pacing and usability review: approved by Ondřej Mottl on 2026-08-27;
  later classroom observations may inform future revisions but are not blockers
  for this exercise version
