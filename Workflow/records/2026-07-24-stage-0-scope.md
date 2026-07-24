# Stage 0 — L01 scope lock

## Metadata

- Week: L01
- Date: 2026-07-24
- Author: Codex with course-owner direction
- Reviewer: Ondřej Mottl

## Git checkpoint

- Stage group: Stages 0–1 planning
- Branch: `lesson/l01-scope-data`
- Base branch and commit: `main` at `8927f7b`
- Original repository identity: private `CUNI-NATUR-Biostatistics/L-example`
- Current repository identity: private `CUNI-NATUR-Biostatistics/L01`
- Previous-stage PR merged: N/A
- Planned PR: draft planning PR

## Lesson purpose

L01 is both the first statistical lesson and the students' first contact with
the instructor, course, materials, and learning model. The lesson must leave
students able to inspect a data table, identify what one row represents,
classify variables, choose meaningful one-variable summaries and graphs, and
explain why variable type constrains the questions and models that can follow.

## Weekly outcomes

By the end of L01, students can:

1. identify the observational unit and distinguish rows from variables;
2. distinguish discrete, continuous, nominal, and ordinal variables;
3. choose and interpret frequencies, mean versus median, and SD versus IQR;
4. choose a suitable one-variable graph and reject a misleading alternative;
5. explain that variable type constrains meaningful questions and later models.

## Data-story spine

The opening is a **data detective challenge**. Students see two plausible
claims or displays based on the same data and vote on which can be trusted.
The lesson deliberately withholds the resolution. After learning variable
types, summaries, and graph choice, students revisit the evidence, diagnose
why the claims differ, and state a more defensible conclusion.

The exact claims and displays remain contingent on the Stage 1 dataset.

## Time budget

| Block | Approximate time | Purpose |
|---|---:|---|
| Welcome and orientation | 20 min | Instructor, course purpose, structure, materials, learning model, communication, assessment, attendance, deadlines, and practical-session expectations. |
| Statistical core | 60 min | Units/rows/variables, variable types, frequencies, centre, spread, and one-variable graphs. |
| Resolution and bridge | 10 min | Resolve the detective challenge, consolidate the decision rules, and bridge to relationships between two variables in L02. |

Detailed policy belongs in the written materials; the deck contains only a
concise orientation. Unknown facts must be marked
`TODO[RELEASE-BLOCKER: ...]` and no release may retain such a marker.

## Prior knowledge and bridge

- Assumed: the optional L00 technical start may have introduced RStudio and
  simple data import, but L01 must remain understandable without L00.
- L01 does not require fitting a model, calculating covariance/correlation,
  comparing two variables, or making inferential claims.
- Forward bridge: L02 asks what changes when the question concerns a
  relationship between two variables.

## Concrete student actions

1. State what one row represents in a real table.
2. Classify selected columns and justify the classification.
3. Compare mean/SD with median/IQR in a skewed distribution.
4. Choose a graph for a stated one-variable question and explain the choice.

## Explicitly out of scope

- two-variable displays, covariance, correlation, regression, confidence
  intervals, p-values, and causal conclusions;
- authoring the practical exercise (`Exercises/cviceni.R`);
- detailed R syntax instruction beyond transparent code needed to reproduce
  the shown summaries and graphs.

## Risks and dependencies

- The dataset must differ from Palmer Penguins, which remains L02's anchor.
- The selected dataset must support all four variable-type decisions without
  inventing an artificial category.
- Missing course-policy facts block release but do not block drafting.
- Dataset approval is a human gate before any Stage 2–3 authoring.

## Decision

- [x] Scope is bounded and ready for human review.
- [x] Continue Stage 1 on this planning branch.
- [ ] Scope approved by the human reviewer.
- [ ] Dataset approved and locked.
