# Výuková data L01

Soubor `msleep.csv` obsahuje všech 83 řádků a 11 původních proměnných z tabulky `ggplot2::msleep`. Jeden řádek představuje jeden druh savce zastoupený v této tabulce. Skript `R/prepare_msleep_data.R` reprodukovatelně exportuje data z ověřených verzí `ggplot2` 4.0.2 a 4.0.3 a kontroluje rozměry, názvy proměnných a chybějící hodnoty.

Jde o rozšířenou verzi dat o spánku savců. Aktualizované doby spánku a hmotnosti pocházejí ze studie Savage a West (2007); proměnné řád, stav ochrany a typ potravy byly podle dokumentace balíčku doplněny z Wikipedie.

- Dokumentace dat: <https://ggplot2.tidyverse.org/reference/msleep.html>
- Savage, V. M. & West, G. B. (2007): <https://doi.org/10.1073/pnas.0610080104>
- Zdrojový balíček: <https://github.com/tidyverse/ggplot2>
- Podmínky opětovného použití: dataset je distribuován jako součást balíčku `ggplot2`, který používá licenci MIT.

Převzatá data se neřídí licencí původního výukového textu v kořenovém `LICENSE.md`.

SHA-256 souboru `msleep.csv`: `b7709b0f02415e9a8b64e3aa24ab9e2dc7f5d6f051e80a0d956456896d3b4373`.
