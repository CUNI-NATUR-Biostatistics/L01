# L01 — Co váží „typický“ savec?

**První setkání s daty a popisem jedné proměnné**

Tento repozitář obsahuje první lekci kurzu [Biostatistika a plánování ekologických pokusů (MB120P163)](https://cuni-natur-biostatistics.github.io/) vyučovaného na Přírodovědecké fakultě Univerzity Karlovy.

Úplný přehled kurzu, rozvrh, pravidla hodnocení a materiály ostatních lekcí najdete na [veřejném HUBu kurzu](https://cuni-natur-biostatistics.github.io/).

## O této lekci

Jakou hodnotou bychom popsali hmotnost „typického“ savce? První lekce ukazuje, že odpověď nezačíná výpočtem, ale porozuměním tomu, co představují řádky, sloupce a jednotlivé hodnoty v datech.

Na datech o savcích z datasetu `ggplot2::msleep` nejprve zobrazíme rozdělení hodnot a teprve potom je shrneme pomocí čísel. Porovnáme průměr s mediánem, směrodatnou odchylku s IQR a postupně sestavíme krabicový graf. Na závěr zobecníme získané zkušenosti na spojité, diskrétní, nominální a ordinální proměnné.

Lekce vytváří základ pro celý kurz: typ proměnné a způsob vzniku dat určují, jaké grafy, souhrny a později i statistické modely dávají smysl.

## Výsledky učení

Po prostudování této lekce dokážete:

- vysvětlit, co v datové tabulce představuje jeden řádek, jeden sloupec a jedna hodnota;
- vytvořit z několika měření vektor v R a zkontrolovat jej pomocí `length()` a `head()`;
- přečíst bodový graf, histogram, graf hustoty, sloupcový graf a krabicový graf a popsat, co každý z nich ukazuje a skrývá;
- vysvětlit, proč je užitečné data nejprve zobrazit a až potom shrnout jedním číslem;
- najít a biologicky interpretovat minimum, maximum, průměr, medián, kvartily, IQR a směrodatnou odchylku;
- rozlišit spojitou, diskrétní, nominální a ordinální proměnnou a zvolit pro ni smysluplný první graf a číselné shrnutí.

## Materiály pro studenty

Následující odkazy vedou vždy na nejnovější schválené vydání L01. Rozpracovaná verze ve větvi `main` může být novější, ale není určena jako závazná studijní verze.

| Materiál | Online verze | PDF |
| --- | --- | --- |
| Skripta | [Číst online](https://cuni-natur-biostatistics.github.io/L01/current/learning/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L01/current/learning/skripta.pdf) |
| Prezentace | [Otevřít slidy](https://cuni-natur-biostatistics.github.io/L01/current/presentation/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L01/current/presentation/presentation.pdf) |

Pro navazující praktické cvičení je připraven [R skript ke stažení](https://cuni-natur-biostatistics.github.io/L01/current/code/cviceni.R). Skript obsahuje úlohy a kód, se kterými budete pracovat během praktika.

- [HUB kurzu](https://cuni-natur-biostatistics.github.io/) je hlavní vstup ke všem veřejným studijním materiálům.
- [Moodle kurzu](https://dl2.cuni.cz/course/view.php?id=106) slouží zapsaným studentům pro oznámení, testy, zadání, odevzdávání a individuální výsledky.

## Pro vyučující a správce

### Zdrojové a vyrenderované soubory

- `Learning_materials/skripta.qmd` je zdroj skript; výsledky jsou `Learning_materials/skripta.html` a `Learning_materials/skripta.pdf`.
- `Presentation/presentation.qmd` je zdroj slidů; výsledky jsou `Presentation/presentation.html` a `Presentation/presentation.pdf`.
- `Exercises/cviceni.R` je studentský R skript pro praktické cvičení.
- `R/` obsahuje podporované renderovací a tematické nástroje.
- `theme/` obsahuje synchronizovanou lokální kopii společné vizuální identity kurzu.

### Reprodukovatelné prostředí

Repozitář používá `renv`. Po klonování otevřete `L01.Rproj` a v čerstvé R relaci spusťte:

```r
renv::restore()
renv::status()
```

Kompletní lokální render spustíte podporovaným wrapperem:

```r
source("R/render_all.R")
```

Samostatně lze použít `R/render_skripta.R` nebo `R/render_presentation.R`. Přímé volání `quarto render` obchází synchronizaci sdíleného tématu a nemá se používat pro release render.

### Publikování

`website-release.yml` je explicitní seznam souborů povolených ve veřejném balíčku. Větev `main` vytváří veřejný náhled, zatímco stabilní tag `L01-vMAJOR.MINOR.PATCH-YYYYMMDD` vytváří neměnné vydání a aktualizuje cestu `/L01/current/`. Podrobný publikační postup je v [`WEBSITE_RELEASES.md`](WEBSITE_RELEASES.md).

Před vydáním je nutné zkontrolovat vyrenderované HTML a PDF, úplnost manifestu, provenanci a podmínky použití dat a médií a nepřítomnost neveřejných informací v celém repozitáři.

## Licence

Původní výukový obsah je licencován pod CC BY 4.0 a software pod licencí MIT. Přesné vymezení, doporučená citace a výjimky pro převzatá data, média, fonty, loga a další položky jsou v [`LICENSE.md`](LICENSE.md).
