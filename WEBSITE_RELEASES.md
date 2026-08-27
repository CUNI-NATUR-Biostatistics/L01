# Website publishing

The committed HTML files are deployed without rerendering QMD source files on GitHub.

Pushing a matching HTML or manifest change to `main` publishes the instructor preview. It does not create a release and does not notify the course hub.

- `/LXX/preview/` contains the latest committed learning materials and presentation HTML from `main`.
- `/LXX/current/` contains the newest tagged stable release.
- `/LXX/releases/<tag>/` contains an immutable tagged release.

Create a stable release only after the locally rendered HTML and PDF files have been reviewed and committed. Tags use the form `LXX-vMAJOR.MINOR.PATCH-YYYYMMDD[-moodle]`.

The course hub links only to stable materials. Preview URLs are public but are intended for instructor review.

The HUB is the canonical public student entry point. Moodle remains the private channel for tests, submissions, individual results, restricted assignments, and enrolled-student announcements. The optional `-moodle` suffix only adds a ZIP to the same public release.

Before the first public release, audit the complete repository as well as this manifest. A public repository exposes every committed file and its history, not only the release allowlist. Verify privacy, assessment security, provenance, third-party reuse terms, and repository visibility for HUB source links. `LICENSE.md` records the repository's CC BY 4.0 / MIT split and must remain in the manifest; it does not replace the terms of third-party items.

GitHub Pages must be configured once with **Source: GitHub Actions**. The `github-pages` environment must allow deployments from `main` and the lesson tag pattern `L01-v*`.
