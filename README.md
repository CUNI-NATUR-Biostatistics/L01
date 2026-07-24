# L01 — Typy dat a deskriptivní statistika

První lekce kurzu **Biostatistika (MB120P163)**. Repozitář vznikl přejmenováním
pilotního `L-example`; historie, tagy a releases zůstávají zachované.

L01 se nyní přestavuje jako první kontakt studentů s kurzem. Spojuje stručnou
orientaci v kurzu s těmito statistickými cíli:

- jednotka pozorování, řádky a proměnné;
- diskrétní, spojité, nominální a ordinální proměnné;
- četnosti, průměr versus medián a SD versus IQR;
- vhodné grafy pro jednu proměnnou;
- princip, že typ proměnné omezuje smysluplné otázky a pozdější modely.

Palmer Penguins zůstávají hlavním datasetem L02. Dataset L01 bude odlišný a
čeká na lidské schválení v
[`Workflow/records/2026-07-24-stage-1-dataset.md`](Workflow/records/2026-07-24-stage-1-dataset.md).
Stávající skripta, prezentace a rendery jsou historický pilot, nikoli materiál
připravený k vydání jako L01.

## Stav workflow

| Skupina | Větev | Stav |
|---|---|---|
| Stage 0–1: scope a data | `lesson/l01-scope-data` | čeká na schválení datasetu |
| Stage 2–3: skripta | `lesson/l01-skripta` | nezačato; až po merge plánovacího PR |
| Stage 4–5: prezentace | `lesson/l01-presentation` | nezačato; až po merge PR se skripty |

Aktuální rozhodnutí jsou v [`Workflow/STAGE_LOG.md`](Workflow/STAGE_LOG.md).
L01 není připravena k release, dokud nejsou přepsány výukové zdroje, ověřeny
rendery a nahrazeny všechny interní policy značky
`TODO[RELEASE-BLOCKER: ...]` potvrzenými fakty.

## Struktura

```text
L01/
├── Learning_materials/    # skripta a jejich rendery
├── Presentation/          # RevealJS prezentace, PDF a podklady
├── R/                     # theme a render wrappery
├── docs/                  # GitHub Pages výstup prezentace
├── theme/                 # lokální cache sdílené vizuální identity
├── Workflow/              # záznamy stage gates a rozhodnutí
├── renv/                  # aktivace reprodukovatelného R prostředí
├── L01.Rproj
└── renv.lock
```

Kanonické instrukce kurzu spravuje soukromý repozitář `_internal`;
repozitář `_L-template` určuje aktuální mechanický kontrakt týdenních lekcí.

## Renderování

Po dokončení příslušné stage se materiály validují přes wrappery:

```r
source("R/render_skripta.R")
source("R/render_presentation.R")
```

`R/render_presentation.R` publikuje zamýšlený HTML výstup také do
`docs/index.html`. Render se spouští v aktivovaném projektu `L01.Rproj` a jeho
stav závislostí se ověřuje v čerstvé R relaci pomocí `renv::status()`.

## Distribuce

Studentům se distribuují vyrenderované materiály, nikoli pracovní repozitář.
Tagy a release názvy používají identitu L01, například:

```text
L01-v0.1.0-20260930
L01-v0.1.0-20260930-moodle
```

## Odložený rozsah

Obsah `Exercises/cviceni.R` se v tomto cyklu neauthoruje. Jeho stav musí zůstat
viditelně označený jako odložený a placeholder se nesmí vydávat za hotové
praktické cvičení.
