# Workflow records

This directory preserves the evidence and decisions for each lesson stage.
Records are reviewed through the lesson's stage-specific pull requests.

Required boundaries:

| Pull request | Stages | Branch |
|---|---|---|
| Planning | 0–1 | `lesson/l01-scope-data` |
| Written materials | 2–3 | `lesson/l01-skripta` |
| Presentation | 4–5 | `lesson/l01-presentation` |

The next branch starts from updated `main` only after the preceding pull
request is merged. Stage 6 release validation follows the merged presentation
PR. Practical-exercise content is explicitly outside the current cycle.
