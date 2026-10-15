# L01 exercise layout maintenance (style C)

## Scope

- Date: 2026-10-15
- Branch: `chore/exercise-hints-before-result` (PR #19)
- Decision: Ondřej Mottl, 2026-10-15. Every course exercise uses one layout ("style C", as in L04–L10). The standard is recorded in `_internal/.ai/authoring/exercises.md`, "Task anatomy" and "Task layout".
- Purpose: convert `Exercises/cviceni.R` from the first-template layout to that standard. This resolves the open item recorded in `2026-10-02-csv-delivery-maintenance.md`: the 40 task blocks still used the older `Účel` / `Vstup` / `Úkol` anatomy.

## Changes

- Task headings `VYZKOUŠEJTE`, `KONTROLA` and `ZÁKLAD` became `Úloha`, and `NAVÍC` became `Úloha navíc`. The stable IDs `L01-K…` and `L01-N…` are unchanged, as `exercises.md` requires for published IDs.
- `Vstup` and `Úkol` were merged into one `Zadání` per task. The original wording was kept where possible; every object, value and starting state from `Vstup` is still in `Zadání`.
- The `Účel` lines were removed from the student script. They are author metadata and are kept in the table below.
- `Vaše odpověď` became `Vaše řešení`.
- Field layout:
  - each label is on its own line;
  - a lone `#` separates the fields;
  - the hints come before `Očekávaný výsledek` (the earlier commit on this branch);
  - field text was re-flowed to 76 characters.
- L01-K03 used to be a teacher cue ("Ukažte řádek…") without fields. It is now a short student prediction task. The `Zadání` explains what Session > Restart R clears and keeps, and tells students not to restart yet; they predict what would survive.
- L01-K02's `Interpretace` asked the same restart question before restart was introduced. It now asks why the value is printed only on the next line, which matches the task's hint.
- L01-N25: the two prepared vectors were moved from inside the task fields into a short supplied example directly above the task heading.
- The `ZÁKLAD |` prefix was removed from 12 worked-example comments.
- Sections were renamed:
  - `Společná trasa: ZÁKLAD` → `Hlavní úlohy`;
  - `Dobrovolná banka úloh: NAVÍC` → `Úlohy navíc`;
  - `NAVÍC A…H` subsection prefixes removed;
  - `Shrnutí a sebekontrola` → `Ohlédnutí a vlastní kontrola`.
- The introduction and recap wording refer to `Hlavní úlohy` and `Úlohy navíc` instead of the old route labels.

No executable line, expected value, hint content or statistical content changed. The non-comment lines of the script are identical to `main` in the same order.

## Task purposes removed from the student script

| Task | Účel |
| --- | --- |
| L01-K01 | Ověřit, že R respektuje pořadí matematických operací. |
| L01-K02 | Vytvořit vlastní objekt a znovu jej použít. |
| L01-K04 | Spojit strukturu tabulky s biologickým významem. |
| L01-K05 | Vybrat jinou spojitou proměnnou z tabulky. |
| L01-K06 | Přečíst graf jednotlivých hodnot. |
| L01-K07 | Pozorovat vliv analytického rozhodnutí na vzhled histogramu. |
| L01-K08 | Rozlišit, co krabicový graf ukazuje a skrývá. |
| L01-K09 | Přečíst četnosti kategoriální proměnné. |
| L01-K10 | Propojit funkce s významem vypočítaných souhrnů. |
| L01-K11 | Porovnat citlivost průměru a mediánu. |
| L01-K13 | Rozlišit čtyři statistické typy proměnných. |
| L01-K14 | Zvolit popis odpovídající statistickému typu proměnné. |
| L01-K15 | Zkontrolovat tvar rozdělení před volbou jednoho souhrnu. |
| L01-K16 | Porovnat dvě možné odpovědi na otázku po typické hmotnosti. |
| L01-K17 | Vytvořit biologicky opatrný závěr z grafu a souhrnů. |
| L01-N01 | Procvičit vytvoření číselného vektoru. |
| L01-N02 | Zkontrolovat velikost a začátek vektoru. |
| L01-N03 | Procvičit orientaci v celé datové tabulce. |
| L01-N04 | Přenést výběr sloupce na novou proměnnou. |
| L01-N05 | Popsat dobu bdění krajními hodnotami. |
| L01-N06 | Porovnat průměr a medián doby bdění. |
| L01-N07 | Procvičit kvartily na tělesné hmotnosti. |
| L01-N08 | Porovnat dvě míry variability tělesné hmotnosti. |
| L01-N09 | Ověřit výpočet IQR z kvartilů. |
| L01-N25 | Oddělit polohu hodnot od jejich variability. |
| L01-N10 | Porovnat dvě členění stejného histogramu. |
| L01-N11 | Prozkoumat silně pravostranné hodnoty na odvozené log10 škále. |
| L01-N12 | Zobrazit chybějící kategorii ve sloupcovém grafu. |
| L01-N13 | Odvodit diskrétní proměnnou počítáním druhů. |
| L01-N14 | Zvolit popis pro nominální proměnnou. |
| L01-N15 | Ověřit zachování přirozeného pořadí kategorií. |
| L01-N16 | Rozlišit význam a technické uložení čísel. |
| L01-N17 | Pozorovat vliv chybějících hodnot na výpočet. |
| L01-N18 | Spočítat chybějící hodnoty a výslovně je vynechat. |
| L01-N19 | Popsat známé hodnoty dvěma souhrny středu. |
| L01-N20 | Samostatně projít celý popis jedné úplné proměnné. |
| L01-N21 | Přizpůsobit pracovní postup neúplné a silně asymetrické proměnné. |
| L01-N22 | Rozpoznat text, který R omylem chápe jako jména objektů. |
| L01-N23 | Najít odkaz na objekt, který neexistuje. |
| L01-N24 | Oddělit vlastnosti dat od rozhodnutí analytika. |

## Validation

- The script parses in R 4.5.1 and sources from a clean `Rscript --vanilla` session in a student-style folder containing only `cviceni.R` and `data/msleep.csv`.
- The sequence of executable lines is identical to `main`.
- An automatic style check finds no deviation from the layout in `exercises.md`, and no line is over 80 characters.

## Independent exercise review (2026-10-15)

A separate read-only subagent followed `.ai/agents/exercise-reviewer.md`. Model: Sonnet at medium effort.

Scope:

- L01 in full;
- spot checks of the same conversion in L02, L03, L07, L08 and `_L-template`.

The reviewer confirmed:

- every new `Zadání` keeps all objects, values and starting states from the original `Vstup`/`Úkol`;
- no route labels remain;
- the section order and field order are correct;
- the code is unchanged;
- the extra time for K03 (about 2 minutes) keeps the core route within the practical.

Findings, all resolved:

1. **Medium, L01-K03.** The task asked about a restart without explaining it, and an actual restart would break the later `read.csv(file = soubor_savci)`. It is now a prediction task with the explanation in `Zadání`; K02's duplicate restart question was replaced.
2. **Medium, L01-N25.** `Zadání` did not name the vectors. It now names `vec_uzky` and `vec_siroky`.
3. **Low, reflow.** Re-flowed text split code expressions or started a line with an operator (L01, L03; also found in L02 and L07 by a follow-up scan of all converted files). All were re-wrapped by hand.
4. **Low, blueprint.** The blueprint still described K03 as a teacher checkpoint; it now points to this record.
5. **Low, L07 route wording.** The wording still said "společná trasa". It was replaced.
6. **Missed by the review.** The follow-up scan also found that reflow had merged L07's A)/B)/C) list of claims into prose. The list layout was restored.

After the fixes:

- all four converted scripts parse;
- their code is identical to `main`;
- they source from a clean session with their data;
- they pass the style check apart from unchanged download URLs in L02, L03 and L07.
