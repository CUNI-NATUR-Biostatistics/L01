# L-example – Ukázkový repozitář přednášky

Ukázkový repozitář demonstrující strukturu a workflow týdenních repozitářů kurzu **Biostatistika (MB120P163)**.

Slouží jako reference při vytváření `_L-template` a jednotlivých repozitářů `L01`–`L12`.

---

## Struktura repozitáře

```
L-example/
├── Presentation/          # Zdrojový soubor prezentace (Quarto RevealJS)
│   ├── presentation.qmd   # Hlavní zdrojový soubor
│   ├── presentation.html  # Výstup renderování (lokální)
│   ├── presentation_raw.pdf  # PDF export přes decktape
│   └── Materials/         # Podpůrné materiály ke snímkům
├── Learing_materials/     # Podkladová čtenářská skripta
│   ├── skripta.qmd        # Hlavní zdrojový soubor
│   ├── skripta.html       # HTML výstup
│   └── skripta.pdf        # PDF výstup (přes Typst)
├── R/
│   └── render_presentatuion.R  # Skript pro renderování a přesun výstupů
├── docs/
│   └── index.html         # Prezentace pro GitHub Pages
├── fix_presentation.ps1   # Pomocný skript pro opravu UTF-8 v presentation.qmd
└── README.md
```

---

## Workflow renderování

Prezentaci (a přesun výstupu do `docs/`) spouštíme přes R skript:

```r
source("R/render_presentatuion.R")
```

Skript provede:
1. Quarto render `Presentation/presentation.qmd` → `Presentation/presentation.html`
2. Zkopíruje HTML do `docs/index.html` (pro GitHub Pages)
3. Exportuje PDF přes `decktape` (musí být nainstalován samostatně – viz [decktape](https://github.com/astefanutti/decktape))

---

## Distribuce materiálů studentům

Studenti materiály **přímo k repozitáři nepřistupují**. Výstupy se distribuují přes Moodle:

- Interní verze: GitHub Release bez suffixu `-moodle` (bez student-facing ZIPu)
- Moodle verze: GitHub Release s tagem ve formátu `L-example-v0.1.0-YYYYMMDD-moodle`

Podrobnosti viz [`_internal/obecne/nove/strategie_releases.md`](https://github.com/CUNI-NATUR-Biostatistics/_internal/blob/main/obecne/nove/strategie_releases.md).

---

## Poznámky pro vývojáře

- Soubory `.html` a `.pdf` v repozitáři jsou renderované výstupy – neslouží jako zdroj; editujeme vždy `.qmd`.
- Při editaci `.qmd` souborů používejte **výhradně file-edit nástroje** (nikoli PowerShell inline přiřazení), aby nedošlo ke korrupci UTF-8 (diakritiky). Viz instrukce v `.github/instructions/file-editing-safety.instructions.md`.
- `fix_presentation.ps1` je záchranný skript pro ruční opravu UTF-8 korrupce; za normálního workflow by neměl být potřeba.
