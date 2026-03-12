# L-example – Ukázkový repozitář přednášky

Ukázkový repozitář demonstrující strukturu a workflow týdenních repozitářů kurzu **Biostatistika (MB120P163)**.
Téma: Vizualizace dat a deskriptivní statistika. Data: reálná ekologická data z projektu [Palmer Penguins](https://allisonhorst.github.io/palmerpenguins/) (počty tučňáků z průzkumů, délka zobáku).
Slouží jako reference při vytváření `_L-template` a jednotlivých repozitářů `L01`–`L12`.

---

## Struktura repozitáře

```
L-example/
├── Presentation/               # Zdrojový soubor prezentace (Quarto RevealJS)
│   ├── presentation.qmd        # Hlavní zdrojový soubor
│   ├── presentation.html       # Výstup renderování (lokální)
│   ├── presentation_raw.pdf    # PDF export přes decktape (nekomprimovaný)
│   ├── presentation.pdf        # PDF export (komprimovaný, pro distribuci)
│   └── Materials/              # Podpůrné materiály ke snímkům (obrázky, GIFy)
├── Learning_materials/         # Podkladová čtenářská skripta
│   ├── skripta.qmd             # Hlavní zdrojový soubor
│   ├── skripta.html            # HTML výstup
│   ├── skripta.pdf             # PDF výstup (přes Typst)
│   ├── skripta_compressed.pdf  # Komprimovaný PDF (pro nahrání na Moodle)
│   └── images/                 # Obrázky pro skripta (viz poznámka níže o Typst)
├── R/
│   ├── render_all.R            # Spustí renderování prezentace i skript
│   ├── render_presentation.R   # Renderuje prezentaci a přesouvá výstup do docs/
│   └── render_skripta.R        # Renderuje skripta a komprimuje PDF
├── docs/
│   └── index.html              # Prezentace pro GitHub Pages
├── renv.lock                   # Zámek závislostí (renv)
├── fix_presentation.ps1        # Pomocný skript pro opravu UTF-8 v presentation.qmd
├── bulk_rename_penguins.ps1    # Pomocný skript pro hromadné přejmenování souborů
└── README.md
```

---

## Workflow renderování

Vše najednou spustíme přes:

```r
source("R/render_all.R")
```

Nebo jednotlivě:

```r
source("R/render_presentation.R")   # jen prezentace
source("R/render_skripta.R")        # jen skripta
```

`render_presentation.R` provede:
1. Quarto render `Presentation/presentation.qmd` → `Presentation/presentation.html`
2. Zkopíruje HTML do `docs/index.html` (pro GitHub Pages)
3. Exportuje PDF přes `decktape` → `Presentation/presentation_raw.pdf` (musí být nainstalován samostatně – viz [decktape](https://github.com/astefanutti/decktape))
4. Komprimuje PDF → `Presentation/presentation.pdf`

`render_skripta.R` provede:
1. Quarto render `Learning_materials/skripta.qmd` → `Learning_materials/skripta.html` a `Learning_materials/skripta.pdf`
2. Komprimuje PDF → `Learning_materials/skripta_compressed.pdf`

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
- **Typst (PDF) a cesty k obrázkům:** Typst sandboxuje přístup k souborům jen v rámci svého projektového adresáře. Obrázky používané v `skripta.qmd` **musí být uloženy uvnitř `Learning_materials/`** (např. `Learning_materials/images/`). Cesty s `../` (např. do `Presentation/Materials/`) způsobí chybu „access denied" při renderování do PDF.
- Po jakékoli změně souboru mimo editor ověřte, že soubor nezahínal BOM (`EF BB BF`) – který znemožňuje parsování YAML. Postup viz `.github/instructions/file-editing-safety.instructions.md`.