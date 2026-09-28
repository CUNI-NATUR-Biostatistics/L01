# L01 learning-material Extras revision

## Approval and scope

- Date: 2026-09-28
- Branch: `lesson/l01-learning-material-extras`
- Human approver: Ondřej Mottl
- Decision: approved in the course-wide L01-L08 Extra-content review and explicitly authorised for implementation on 2026-09-28.
- Scope: add bounded optional extensions without changing L01 learning outcomes or introducing inferential calculations.

## Mandatory story map

- Artifact: Learning materials amendment
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-09-28
- Approval decision and requested revisions: The course-wide L01-L08 Extra-content map was approved and implementation was explicitly authorised; no revisions were requested. The table below records that approved content in the canonical format without changing its substance.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Generalisation boundary | Doplňující: výběr není celá populace | After the source and missingness discussion, distinguish description of the available rows from generalisation beyond them. |
| 2 | Terminology safeguard | Doplňující: SD není standardní chyba | Immediately after SD, prevent students from carrying the spread interpretation into later estimate uncertainty. |

## Knowledge-state ledger

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| Selection and target population | One row represents one species and the source has missing values. | A descriptive summary applies first to the observed dataset; transfer to a target population depends on how observations were obtained. | Sampling distributions, standard errors, confidence intervals or hypothesis tests. | Reuse `msleep`; uncertainty follows in L04 and dependence in L11. |
| SD and SE | SD describes spread around a mean. | SD describes observed-value variability, whereas SE will describe estimate precision. | The SE formula or inferential interpretation. | Place after SD; full treatment in L04. |

## Leakage audit

- Both blocks remain optional and conceptual.
- No inferential formula, decision rule or new R syntax is introduced.
- The population block does not claim that `msleep` is a random sample.

## Review and validation

- Independent amendment review: final cross-lesson re-review passed; no findings in the two new Extras.
- Glossary coverage: rechecked after the L01-L08 pass; the first new occurrence of `nejistota` is wrapped with its existing glossary slug and no new missing slug was introduced.
- Source checks: UTF-8 without BOM, no replacement characters, `git diff --check` passed.
- Render: project-native HTML and PDF render passed after the hidden setup was made local-first for the canonical glossary and the render was run under a valid Windows UTF-8 locale. All 48 PDF pages were inspected through lesson-wide contact sheets, with both new Extra pages checked at readable size; no clipping, overlap, broken glyphs or orphaned blocks remain.
- Pre-existing full-artifact review notes outside this amendment: a hardcoded `msleep` value and several workflow-style headings remain candidates for a later cleanup.
