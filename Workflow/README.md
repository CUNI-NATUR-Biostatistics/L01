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

The next branch starts from updated `main` only after the preceding pull request is merged. Exercise authoring follows explicit Stage 5 approval and the merged presentation PR. Stage 6 release validation follows the merged exercise PR when an exercise is included.
