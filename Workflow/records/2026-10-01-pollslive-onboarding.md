# L01 PollsLive onboarding addendum

**Artifact:** `Presentation/presentation.qmd`  
**Prepared:** 2026-10-01  
**Scope:** L01-specific onboarding exception; this is not retrieval of a preceding lesson.  
**Status:** Implemented locally and independently reviewed; validation and offline rendering passed. Final human acceptance and live activation remain pending.

## Integration map

Insert the PollsLive onboarding block immediately after `Zápočet a zkouška ověřují jiné dovednosti` and immediately before the section `Kolik váží běžný savec?`.

No existing slide is removed. In particular, retain the later `Jak budeme pracovat?` slide because it introduces the lesson's reasoning routine rather than merely the voting interface.

| Order | Internal role | Student-facing heading | Speaker note |
|---:|---|---|---|
| 1 | PollsLive entry | Tři rychlé otázky na rozjezd | Students join anonymously and answer all three questions independently. |
| 2 | Light retrieval | Co se v tomto kurzu pokusíme z biologických dat „vyždímat“? | Begin with a playful callback to the instructor introduction; do not introduce lesson data. |
| 3 | Course-rule retrieval | Kdy můžete v tomto kurzu používat AI? | Reinforce the distinction between learning support and independent assessment. |
| 4 | Course-navigation retrieval | Kde najdete veřejné materiály ke každé lekci? | End with the practical route students will use throughout the semester. |
| 5 | Aggregate response view | Jak odpovídala skupina? | Discuss the distribution briefly without exposing individual responses. |

## Exact questions

### Question 1 — playful callback

**Text:** Co se v tomto kurzu pokusíme z biologických dat „vyždímat“?

| Option ID | Label |
|---|---|
| `co-nejvice-tabulek` | Co nejvíce tabulek |
| `nove-informace` | Nové informace |
| `spravnou-odpoved-za-kazdou-cenu` | Správnou odpověď za každou cenu |

**Correct option:** `nove-informace`  
**Explanation:** Cílem je získávat z biologických dat nové informace a umět přitom vysvětlit, jak jsme k závěru došli.  
**Evidence:** Previously shown instructor-introduction takeaway: `Jak z velkého množství biologických dat "vyždímat" nové informace`.  
**Media:** None required.  
**Provenance:** Existing approved L01 slide `Ondřej Mottl`.

### Question 2 — AI use

**Text:** Kdy můžete v tomto kurzu používat AI?

| Option ID | Label |
|---|---|
| `nikdy` | Nikdy |
| `uceni-ne-hodnoceni` | Při učení a přípravě, ale ne u zápočtu a zkoušky |
| `vzdy-s-uvedenim` | Také u zápočtu a zkoušky, pokud použití AI uvedete |

**Correct option:** `uceni-ne-hodnoceni`  
**Explanation:** AI můžete používat při učení. U praktického zápočtu a závěrečné zkoušky pracujete samostatně bez internetu a AI.  
**Evidence:** Previously shown assessment takeaway.  
**Media:** None required.  
**Provenance:** Existing approved L01 slide `Zápočet a zkouška ověřují jiné dovednosti`.

### Question 3 — course navigation

**Text:** Kde najdete veřejné materiály ke každé lekci?

| Option ID | Label |
|---|---|
| `web-hub` | Na webu kurzu (HUB) |
| `moodle` | V Moodle |
| `sis` | V SIS |

**Correct option:** `web-hub`  
**Explanation:** Veřejné materiály jsou na webu kurzu (HUB). Moodle slouží pro testy, odevzdávání, výsledky a neveřejná oznámení; SIS pro zápis a termíny zkoušek.  
**Evidence:** Previously shown course-navigation slide.  
**Media:** None required.  
**Provenance:** Existing approved L01 slide `Materiály najdete na webu kurzu (HUB)`.

The existing section divider `Kolik váží běžný savec?` follows the aggregate response view directly. The separate bridge slide was removed after human review because it repeated the transition already established by the sequence.

## Knowledge-state ledger

| Point in sequence | Students already know | The onboarding block may require | Deliberately not assumed or revealed |
|---|---|---|---|
| Before the block | The instructor works with biodiversity, large datasets, and open science; the course website is the public materials hub; AI is allowed for learning but not assessment. | Recognition of three statements that have already appeared on slides; basic use of a QR code or link and a single-answer interface. | Any values or structure from the mammal dataset; definitions of mean, median, spread, variable types, or a statistically preferred meaning of „typický“. |
| Question 1 | The phrase about extracting new information from biological data has already appeared. | Recognize the intended course aim among playful distractors. | No biological observation or numerical result. |
| Question 2 | The AI rule has already appeared on the assessment slide. | Distinguish learning support from independent assessed work. | No technical knowledge of AI tools and no new assessment rule. |
| Question 3 | The roles of the website (HUB), Moodle, and SIS have already appeared. | Choose the public-materials route. | No knowledge of the lesson repository structure or release workflow. |
| After the block | Students have successfully submitted three anonymous responses and have seen aggregate class results. | Follow the bridge into the existing biological question. | The answer to the opening „typický savec“ problem remains unresolved; no later statistical concept is leaked. |

## Approval record

- Course author: Ondřej Mottl
- Date: 2026-10-01
- Placement decision: approved — before `Kolik váží běžný savec?`
- Exact questions and order: approved — playful callback, AI use, website (HUB)
- Knowledge-state ledger: approved explicitly by the course author on 2026-10-01
- Implementation: canonical framework extension and L01 integration completed locally
- Independent review: completed on 2026-10-01; requested transition wording and workflow-status corrections were applied
- Human revision on 2026-10-02: enlarge the text-only fallback question slides and remove the redundant `Techniku už znáte` bridge
- Human acceptance: pending review of the rendered slides
- Live activation: disabled

## Implementation and validation status

The canonical `_internal` PollsLive schema, client, activation manifest, and course map now support one explicit L01 onboarding exception while preserving the L02–L12 previous-lesson retrieval contract. The dormant `_L-template` adapter and its documentation have been updated accordingly. L01 now contains its lesson-owned quiz definition, validator, deterministic text-only asset check, workflow, presentation include, and bridge.

Validation completed on 2026-10-01:

- all 42 canonical PollsLive tests passed;
- the credential-free L01 validator passed;
- the L01 presentation rendered offline to HTML and PDF with 85 slides using the local canonical client override;
- all three text-only fallback questions were inspected at full slide size after enlarging their options and explanations; no clipping or overlap remained;
- independent read-only review found no placement or knowledge-state leakage issue;
- the separately reviewed transition slide was subsequently removed in response to the course author's 2026-10-02 visual review.

The L01 activation entry remains disabled. Before the ordinary pinned client can consume the new onboarding type, the reviewed `_internal` changes must be committed and the 40-character client pin in L01 and `_L-template` updated to that commit. Live synchronization and activation are separate later steps and have not been performed.
