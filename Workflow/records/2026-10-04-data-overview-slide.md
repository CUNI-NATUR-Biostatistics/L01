# L01 presentation amendment — data overview slide

## Process exception

The change reached `main` directly as `e7be33f`, without a pull request. The authoring assistant created the branch with `git switch -c lesson/l01-data-overview-slide origin/main`, which set `origin/main` as its upstream, so a plain `git push` updated `main`. On 2026-10-04 the course owner chose to keep the change on `main` rather than revert and re-apply it, because a PR would contain the same approved, reviewed and rendered diff. After the push, the PollsLive validation workflow and the preview deployment both succeeded. Students were unaffected until the next release, because `/L01/current/` changes only with a tag. To prevent a repeat, branches are now created from local `main` without an upstream and pushed with `git push -u origin <branch>`.

## Approval and scope

- Date: 2026-10-04
- Branch: `lesson/l01-data-overview-slide`
- Human approver: Ondřej Mottl
- Decision: the course owner asked for a slide with an overview of the data table after the `Kolik váží běžný savec?` divider. The exact slide copy (heading, table and caption) and the story-map and ledger rows below were shown and approved before the slide was written.
- Scope: one new slide; one hidden chunk moved to its first-use slide. No other slide content changed.
- Sequence impact: the rendered deck grows from 85 to 86 slides; the new slide is slide 13.

## Story-map amendment

The approved 81-slide map in `2026-10-01-presentation-story-map.md` predates the PollsLive onboarding slides. This amendment inserts one row between its rows 8 and 9; later rows shift by one.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| after 8 | Data glimpse | Tabulka savců | Show what kind of table the headlines come from: one mammal table with diet, order, sleep and body mass. Do not explain what a row represents yet. |

## Knowledge-state ledger

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| Data glimpse | Course orientation only. | The lesson works with one table of mammals with name, diet, order, sleep and body-mass columns. | What one row represents; variable types; any summary of body mass. | The first three rows of `msleep`; the caption gives the row count as "řádků", not "druhů", so the later question `Co představuje jeden řádek?` stays open. |

## Implementation

- New slide `## Tabulka savců` after `# Kolik váží běžný savec?`. It shows the first three rows of `data_savci` with `knitr::kable()`, and the row count comes from `nrow(data_savci)`; no value is hardcoded.
- R object locality: `data_savci` is now created on the new slide, its first use. Chunk `pripravit-data-savcu` on `Začneme jedním savcem` still creates `data_spanek` and `vec_spanek_h`, where they are first used.
- The later slide `Celá tabulka přidává další proměnné` still shows the same three rows. After the row-by-row build-up it adds the row and column counts.

## Validation

- Canonical render: `R/render_presentation.R` in PollsLive `sync` mode produced the HTML, `docs/index.html` and an 86-slide PDF.
- PollsLive: the rendered HTML embeds the same poll (`l01-t-i-ot-zky-na-rozjezd-2026-27-0li4gx00`) as `main`; `pollslive/**` and the activation checksums are unchanged.
- Visual check: PDF slides 12–14 show the divider, the new table slide (heading, three rows, caption, no clipping or broken Czech characters) and the unchanged headline slide.
- Independent review: a separate read-only subagent found no high or medium findings.
  - Confirmed: object locality, no premature knowledge relative to `Co představuje jeden řádek?`, natural Czech, general theme classes only, and a better flow into the `Stejná tabulka` headline slide.
  - Optional low findings, not applied:
    - The later slide `Celá tabulka přidává další proměnné` now repeats the same three rows; a speaker note could present it as a callback.
    - Raw R column names and decimal points are shown, as in the existing later table; display labels such as `Hmotnost (kg)` would read more easily.
    - The headline slide builds `vec_hmotnost_kg` from `ggplot2::msleep` rather than `data_savci`; the values are identical.
  - The reviewer could not rasterise the PDF; the author's visual check of slides 12–14 is recorded above.
