# Workflow records

This directory preserves the evidence and decisions for each lesson stage.
Records are reviewed through the lesson's stage-specific pull requests.

Required boundaries:

| Pull request | Stages | Branch |
|---|---|---|
| Planning | 0–1 | `lesson/l01-scope-data` |
| Written materials | 2–3 | `lesson/l01-skripta` |
| Presentation | 4–5 | `lesson/l01-presentation` |
| Exercise | Post-presentation | `lesson/l01-exercises` |

The next branch starts from updated `main` only after the preceding pull request is merged. Exercise authoring follows explicit Stage 5 approval and the merged presentation PR.

For release preparation, post-merge validation, and publication receipts, follow the [canonical publication workflow](../../_internal/.ai/core/publication.md#release-preparation-and-recordkeeping). Workflow record-copying and stage-log steps apply to authoring and pre-merge preparation. Post-merge release results go in the GitHub Release description and leave the lesson working tree unchanged; actual source fixes retain the normal branch and PR workflow.
