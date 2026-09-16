# Presentation standards rollout

## Scope

- Date: 2026-09-16
- Branch: `lesson/l01-presentation-standards`
- Requirements: Issues #5, #6, #7, and #8 audit for L01

## Decisions

- The existing first slide now uses the approved question-first course title composition, canonical reversed course logo, lesson number, subordinate formal title, and one materials link.
- The existing illustrations already carry instructional roles and accessibility metadata; no new illustration is needed for L01.
- PollsLive is not applicable because L01 has no preceding course lesson to retrieve.
- Model coefficient extraction is not applicable because L01 does not teach fitted model coefficients.

## Validation status

- Focused source and generated-theme review: passed.
- Canonical render: passed; HTML and PDF contain 80 slides, and `Presentation/presentation.html` matches `docs/index.html` by SHA-256.
- Visual inspection: passed, including the title at 1600 × 900 and 1280 × 720.
- UTF-8, duplicate chunk-label, R parsing, and focused diff checks: passed.
- Independent read-only presentation review: passed after focused corrections; no remaining finding.
- Git publication: follow-up authorization granted on 2026-09-16; review and merge state is tracked in the lesson PR.
