# L01 presentation maintenance map — 2026-10-01

## Approval and scope

- Human reviewer: Ondřej Mottl
- Decision: approved in the current session on 2026-10-01
- Approved work: resolve the presentation-review findings other than the two explicit exceptions below
- Approved exception: retain the L01 introductory orientation before the biological hook because the first lesson has a special course-introduction role
- Deferred work: PollsLive integration will be handled separately
- Sequence impact: one explanatory slide was added after the logarithmic-axis graph; the deck now contains 81 slides
- Complete retrospective map: `2026-10-01-presentation-story-map.md`; the revised 81-slide map was explicitly approved on 2026-10-01

## Focused revision map

| Slides | Internal role | Student-facing result | Knowledge-state effect |
|---|---|---|---|
| 4–7 | Course orientation | Natural Czech wording, consistent `web kurzu (HUB)` naming, and complete SIS/Moodle sentences | No new statistical knowledge |
| 11–14 | Working method and opening activity | Generic sequencing words removed while preserving the original task and delayed answer | Students still commit to a headline before receiving the data context |
| 35–41 | First descriptive summaries | The nine-value vector is introduced visibly once; each visible base-R function reuses it; minimum and maximum regain their English equivalents | The data values are visible before the functions that summarise them |
| 43–51 | Deviation, variance, and SD | Each hidden computation and figure is created on its first-use slide; `čtverec odchylky = odchylka²`; concrete values precede the compact formula; the canonical random seed is used | Deviation is motivated by the same-mean comparison, squared distance precedes variance, and variance precedes SD |
| 54–55 | Return to the opening question | The H1 divider is minimal and the following slide carries the biological question | The divider no longer introduces content independently of the return slide |
| 57–59 | Logarithmic scale and headline return | A new slide explains equal ratios on a logarithmic axis; the following slide restores the opening headlines and labels the mean and median | Students understand the scale before interpreting the two summaries in the news-style claims |
| 63–67 | Boxplot construction | Quartiles, whiskers, outliers, and final boxplot data are created only when their visual layer first appears | Each visual layer remains available before the next layer depends on it |
| 70 and 80 | Supporting copy and synthesis | Inline styling is replaced by shared theme classes; summary wording no longer exposes lesson sequencing | No new knowledge; the final synthesis retains the same four ideas |

## Validation record

- Source audit: no prohibited sequencing words, lesson-specific inline `style=` attributes, hidden-only `vec_spanek_deviti` references, or noncanonical random seeds remain.
- Canonical render: `Rscript R/render_presentation.R` completed on 2026-10-01 and produced 80-slide HTML and PDF outputs.
- Visual review: affected slides were inspected from the rendered PDF. A clipped vector on slide 36 was corrected by wrapping its values, followed by a complete rerender and focused recheck.
- Independent read-only review: completed. The reviewer confirmed the requested conceptual repairs and identified remaining presentation-convention issues. These were resolved by adding the complete retrospective story map, making the section divider minimal, naming reused simulation constants, applying the `vec_` prefix, replacing `vapply()` with `purrr::map_chr()`, using a content-specific heading, and routing local images through `include_local_figure()`.
- Independent final recheck: no remaining findings; all 80 headings, internal roles, and speaker notes match the current deck.
- Final rerender and focused visual recheck: completed after the independent-review repairs. The canonical render produced both HTML variants and an 80-slide PDF; the converted local images, minimal divider, visible vector, squared-deviation explanation, formula heading, named salary simulation, and later illustration slides were checked in the PDF without clipping or Czech-character corruption.
- Follow-up revision: centring the research illustrations, correcting the practical duration to 120 minutes, adding the logarithmic-axis explanation, and restoring the original headlines were approved on 2026-10-01.
- Follow-up validation: the canonical render produced both HTML variants and an 81-slide PDF. Slides 3, 4, and 56–59 were visually checked. The remaining Czech-character corruption was traced to Windows R starting in the non-UTF-8 `C` locale; the presentation setup now switches to `Czech_Czechia.utf8` on Windows and fails explicitly if UTF-8 is unavailable. After a complete rebuild, all 29 plot-heavy slides were inspected in PDF contact sheets; Czech species names, axis labels, mathematical symbols, and category labels render correctly.
- Follow-up independent review: completed. The reviewer confirmed that the two earlier findings are fixed and found no remaining actionable issues in the complete presentation or approved 81-slide story map. The reviewer also confirmed that the Windows-only UTF-8 guard is appropriately scoped and that the centring, 120-minute duration, logarithmic-axis explanation, and restored headlines follow the instructions.
