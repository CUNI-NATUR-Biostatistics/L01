# L-example – Ukázkový repozitář přednášky

Ukázkový repozitář demonstrující aktuální strukturu a workflow týdenních repozitářů kurzu **Biostatistika (MB120P163)**.

Téma ukázkového týdne: **vizualizace dat a deskriptivní statistika**. Repozitář používá reálná ekologická data z projektu [Palmer Penguins](https://allisonhorst.github.io/palmerpenguins/), zejména:

- počty tučňáků v jednotlivých průzkumech,
- délku zobáku (`bill_length_mm`),
- druh tučňáka a další jednoduché demonstrační proměnné.

Repozitář slouží jako reference při vývoji `_L-template` a budoucích repozitářů `L01` až `L12`.

## Doporučený pracovní prostor

Tento repozitář je určený pro práci v multi-root workspace `CUNI-NATUR-Biostatistics`. Sdílený kontext kurzu a kanonické instrukce pro AI asistenty spravuje soukromý repozitář `_internal`; doporučené nastavení je popsané v `_internal/workspace-setup.md`. Při samostatném otevření tohoto repozitáře nemusí mít AI asistent k dispozici úplný kontext kurzu.

Používá stejnou infrastrukturu jako budoucí týdenní repozitáře:

- veřejný repozitář [`_brand`](https://github.com/CUNI-NATUR-Biostatistics/_brand) jako zdroj vizuální identity
- veřejný repozitář [`slovnik`](https://github.com/CUNI-NATUR-Biostatistics/slovnik) jako zdroj terminologie a tooltipových definic

---

## Struktura repozitáře

```text
L-example/
├── theme/                          # Zdroje vizuálního tématu – editujte zde
│   ├── colors.json                 # Paleta barev a sémantická přiřazení
│   ├── fonts.json                  # Písma pro HTML, RevealJS, Typst a R grafy
│   ├── custom_theme.json           # Další vzhledové parametry
│   ├── _colors.scss                # ← generováno z colors.json
│   ├── fonts-include.html          # ← generováno z fonts.json
│   ├── presentation_theme.scss     # ← generováno z JSON konfigurace
│   └── skripta_theme.scss          # ← generováno z JSON konfigurace
├── Presentation/                   # Zdroj prezentace v Quarto RevealJS
│   ├── presentation.qmd            # Hlavní zdrojový soubor prezentace
│   ├── presentation.html           # HTML výstup prezentace
│   ├── presentation_raw.pdf        # PDF export přes decktape
│   ├── presentation.pdf            # Komprimovaný PDF pro distribuci
│   ├── presentation_theme.scss     # Starší lokální kopie tématu
│   └── Materials/                  # Obrázky a další podklady ke snímkům
├── Learning_materials/             # Podkladová čtenářská skripta
│   ├── skripta.qmd                 # Hlavní zdrojový soubor skript
│   ├── skripta.html                # HTML výstup
│   ├── skripta_raw.pdf             # PDF výstup přes Typst
│   ├── skripta_compressed.pdf      # Komprimovaný PDF pro Moodle
│   ├── skripta_theme.typ           # ← generováno z JSON konfigurace
│   └── images/                     # Obrázky použité ve skriptech
├── R/
│   ├── render_all.R                # Regeneruje téma a renderuje vše
│   ├── render_presentation.R       # Renderuje prezentaci a kopíruje ji do docs/
│   ├── render_skripta.R            # Renderuje skripta a komprimuje PDF
│   ├── generate_theme.R            # Generuje všechny theme artefakty z JSON
│   ├── set_r_theme.R               # ← generováno: ggplot2 paleta a theme_biostat()
│   └── Functions/Theme_generation/ # Pomocné funkce pro generování tématu
├── docs/
│   └── index.html                  # Prezentace pro GitHub Pages
├── renv.lock                       # Zámek závislostí (renv)
├── fix_presentation.ps1            # Pomocný skript pro jednorázové opravy
├── bulk_rename_penguins.ps1        # Pomocný skript pro hromadné přejmenování
└── README.md
```

Poznámka: aktivně používané theme soubory načítají `presentation.qmd` a `skripta.qmd` ze složky `theme/` přes cesty `../theme/...`. Generované soubory tedy neupravujte ručně.

---

## Systém vizuálního tématu

Barvy, písma a další stylové volby se udržují centrálně v repozitáři [`_brand`](https://github.com/CUNI-NATUR-Biostatistics/_brand) a lokálně se cachují ve složce `theme/`. Z nich se automaticky generují soubory pro:

- RevealJS prezentaci,
- HTML verzi skript,
- Typst PDF,
- ggplot2 grafy v R.

### Zdrojové soubory

| Soubor | Co řídí |
| --- | --- |
| `theme/colors.json` | Barvy a jejich sémantické role |
| `theme/fonts.json` | Písma, velikosti a typografické volby |
| `theme/custom_theme.json` | Okraje, bloky kódu, tabulky, stíny a další detaily |

### Generované soubory

| Soubor | Účel |
| --- | --- |
| `theme/_colors.scss` | Sdílené SCSS proměnné |
| `theme/fonts-include.html` | Načtení webových písem pro HTML výstupy |
| `theme/presentation_theme.scss` | RevealJS téma prezentace |
| `theme/skripta_theme.scss` | HTML téma skript |
| `Learning_materials/skripta_theme.typ` | Typst styl pro PDF |
| `R/set_r_theme.R` | ggplot2 paleta a funkce `theme_biostat()` |

Pokud změníte JSON konfiguraci a nechcete spouštět celý render, lze theme artefakty regenerovat samostatně:

```r
source("R/generate_theme.R")
```

`render_all.R` tento krok provádí automaticky před renderem prezentace i skript.

### Písma v PDF

HTML výstupy mohou používat Google Fonts, ale Typst pracuje jen s lokálně nainstalovanými písmy. Pokud má PDF používat konkrétní písmo, musí být dostupné v systému a správně nastavené v `theme/fonts.json`.

---

## Slovníček pojmů ve skriptech

`Learning_materials/skripta.qmd` je napojené na centrální repozitář [`slovnik`](https://github.com/CUNI-NATUR-Biostatistics/slovnik).

Renderovací setup:

- stáhne aktuální `pojmy.yaml` z raw URL repozitáře `slovnik`
- nastaví `glossary::glossary_path()` na dočasnou lokální kopii
- načte `render_glossary_term.R` z GitHubu nebo použije lokální fallback

Pro první výskyt známého termínu v dané sekci použijte ve skriptech tuto podobu:

```markdown
`r render_glossary_term("median", display = "medián")`
```

Tooltip styly pro HTML používají brand barvy převzaté z aktuálního tématu.

---

## Workflow renderování

Nejjednodušší je spustit celý pipeline najednou:

```r
source("R/render_all.R")
```

Nebo jednotlivé části samostatně:

```r
source("R/render_presentation.R")
source("R/render_skripta.R")
```

`render_all.R` provede:

1. regeneraci všech theme souborů z `theme/*.json`,
2. render prezentace,
3. render skript.

`render_presentation.R` provede:

1. Quarto render `Presentation/presentation.qmd` → `Presentation/presentation.html`,
2. kopii HTML do `docs/index.html` pro GitHub Pages,
3. export PDF přes `decktape` → `Presentation/presentation_raw.pdf`,
4. kompresi PDF → `Presentation/presentation.pdf`.

`render_skripta.R` provede:

1. Quarto render `Learning_materials/skripta.qmd` → `Learning_materials/skripta.html` a `Learning_materials/skripta_raw.pdf`,
2. kompresi PDF → `Learning_materials/skripta_compressed.pdf`.

### Předpoklady

- Quarto musí být nainstalované a dostupné v systému.
- PDF export prezentace vyžaduje samostatně nainstalovaný [decktape](https://github.com/astefanutti/decktape), protože skript volá `decktape.cmd`.
- Komprese PDF používá balíček `qpdf` v R.
- Doporučené spuštění je uvnitř projektu s aktivním `renv`.

---

## Distribuce materiálů studentům

Studenti k repozitáři přímo nepřistupují. Distribuují se jen vyrenderované výstupy, typicky přes Moodle.

Interní release používá tag bez přípony `-moodle`, například:

```text
L-example-v0.1.0-20260325
```

Moodle release používá tag s příponou `-moodle`, například:

```text
L-example-v0.1.0-20260325-moodle
```

Před vydáním by měly být v repozitáři aktuální alespoň tyto soubory:

- `Presentation/presentation.html`
- `Presentation/presentation.pdf`
- `Learning_materials/skripta.html`
- `Learning_materials/skripta_compressed.pdf`

Podrobnosti viz [`_internal/obecne/nove/strategie_releases.md`](https://github.com/CUNI-NATUR-Biostatistics/_internal/blob/main/obecne/nove/strategie_releases.md).

---

## Důležité poznámky

### Typst a cesty k obrázkům

Typst při renderování PDF sandboxuje přístup k souborům. Obrázky používané ve `skripta.qmd` proto musí být uložené uvnitř `Learning_materials/` nebo jeho podsložek. Cesty typu `../Presentation/Materials/...` mohou při renderu selhat.

### Data v ukázkovém týdnu

Ukázky v materiálech jsou postavené na datech Palmer Penguins a používají reálné biologické proměnné místo umělých dat. To je záměr: repozitář má sloužit jako reference pro budoucí týdny kurzu, kde budou vysvětlení co nejvíce opřená o skutečná ekologická data.
