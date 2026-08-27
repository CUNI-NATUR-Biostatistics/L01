# Stage 6 - Post-merge release readiness

## Metadata

- Week: L01
- Date: 2026-08-27
- Author: Codex with course-owner direction
- Reviewer: Ondřej Mottl

## Git checkpoint

- [x] Stage 4-5 presentation PR #6 merged.
- [x] The exercise was independently reviewed, human-approved, committed by the
  course owner, and pushed to `main`. A dedicated exercise PR was not used for
  this first implementation and remains a documented workflow exception.
- [x] Local `main` matched `origin/main` at `d1bcedb` before this release record
  was created.
- [x] `git status --short` was clean before this release record was created.
- [x] The release validation itself was read-only; this record is the only
  release-preparation source change.
- Release-fix branch / PR: not required.

## Inspiration check

- The most useful external pattern was the navigable worked-example and task
  structure from the SPROuT exercise, adapted to a beginner-facing base-R
  lesson.
- The older SSoQE introduction informed the permanent, skippable refresher for
  scripts, the console, objects, assignment, and reproducible records.
- `_internal/R/old` was used only to identify classroom hazards. Its stateful
  setup, dense prose, premature manipulation syntax, and coding style were not
  carried into the public exercise.

## Review outcomes

### Written materials review

- Key findings: the approved L01 materials establish the observation -> table
  -> vector -> graph -> numerical summary sequence and the intended limits of
  one-variable description.
- Revisions applied for this release: none; the approved rendered materials are
  unchanged.

### Presentation review

- Key findings: the approved presentation is aligned with the written lesson
  and was released previously through PR #6.
- Revisions applied for this release: none.

### Exercise review

- Independent reviewer: dedicated read-only exercise reviewer.
- Key findings: initial pacing, outcome coverage, quartile interpretation,
  task wording, and progressive-hint issues were identified.
- Revisions applied: the shared route was reduced to 60-65 minutes of direct
  work; the R-basics refresher was made permanent and skippable; section
  hierarchy and R formatting were standardized; all 40 hint pairs were audited
  and revised from broad guidance to concrete support.
- Human approval: Ondřej Mottl, 2026-08-27.

## Final validation checklist

- [x] Learning outcomes remain aligned.
- [x] Written and slide narratives remain aligned.
- [x] Exercise core tasks follow the approved L01 outcomes and sequence.
- [x] Existing presentation interaction fallbacks remain present.
- [x] Approved rendered HTML and PDF outputs exist and are committed.
- [x] The official Ruby packager created the candidate
  `web-materials-L01-v0.2.0-20260827.zip` with 15 entries.
- [x] The candidate bundle contains learning and presentation HTML/PDF/source,
  `code/cviceni.R`, `extras/LICENSE.md`, and `manifest.json`.
- [x] `website-release.yml` validates and lists exactly the intended public
  resources.
- [x] Every listed source, exercise, and extra passed privacy,
  assessment-security, provenance, and reuse review.
- [x] The public README directs students to stable `/current/` routes and does
  not present `main` or `/preview/` as the approved student copy.
- [x] `CUNI-NATUR-Biostatistics/L01` is public and matches HUB source links.
- [x] `LICENSE.md` records the CC BY 4.0 / MIT split, retains third-party
  exclusions, and is included in the release manifest.
- [x] GitHub Pages uses GitHub Actions and previously completed both preview and
  stable-release deployments successfully.
- [x] Borrowed patterns were adapted to the current course rather than copied.

## Stable routes and HUB refresh

- Target tag: `L01-v0.2.0-20260827`
- Immutable release: `/L01/releases/L01-v0.2.0-20260827/`
- Stable learning materials: `/L01/current/learning/`
- Stable presentation: `/L01/current/presentation/`
- Stable exercise: `/L01/current/code/cviceni.R`
- Expected automation: pushing the tag runs `Release materials`, creates the
  GitHub release bundle, updates `/L01/current/`, and requests a HUB catalog
  refresh when the configured GitHub App credentials are available.

## Release summary

- Version/tag target: `L01-v0.2.0-20260827`
- Main lesson change: first complete public L01 R exercise, with a finishable
  shared route, permanent R-basics refresher, progressive hints, and 25 optional
  tasks.
- Known limitations: classroom timing and whether students reveal the two
  visible hints sequentially should be observed during first use; neither is a
  release blocker.

## Decision

- [x] Ready for release after this record is committed and pushed to `main`.
