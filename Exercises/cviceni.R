#----------------------------------------------------------#
#
#              L01 — Co váží „typický“ savec?
#
#                 Praktické cvičení v R
#
#             Studenti biologie a ekologie
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#


#----------------------------------------------------------#
# Příprava -----
#----------------------------------------------------------#

# Z veřejné stránky lekce stáhněte dva soubory:
# - skript cviceni.R:
#   https://cuni-natur-biostatistics.github.io/L01/current/code/cviceni.R
# - data msleep.csv:
#   https://cuni-natur-biostatistics.github.io/L01/current/data/msleep.csv
#   Jde o kurzovou kopii tabulky ggplot2::msleep. Původ a licence:
#   https://cuni-natur-biostatistics.github.io/L01/current/data/README.md
#
# V počítači vytvořte složku L01_praktikum a v ní podsložku data.
# Soubor cviceni.R uložte do L01_praktikum a msleep.csv do data.
# RStudio Project používá L01_praktikum jako hlavní složku práce. Soubor
# s koncovkou .Rproj pomáhá RStudio tuto složku znovu otevřít; skript
# a data přitom zůstávají samostatnými soubory uvnitř složky.
# V RStudio zvolte File > New Project > Existing Directory, vyberte
# L01_praktikum a potvrďte Create Project. Potom otevřete cviceni.R.
# Odpovědi a vlastní příkazy zapisujte přímo do své kopie souboru
# a průběžně ji ukládejte pomocí Ctrl + S.

#--------------------------------------------------#
## Jak se skriptem pracovat -----
#--------------------------------------------------#

# Hlavní úlohy řešte v uvedeném pořadí, protože na sebe navazují.
#
# Při samostudiu:
# 1. Začněte v čisté relaci R.
# 2. Spouštějte skript shora dolů pomocí Ctrl + Enter.
# 3. Vlastní kód pište pod řádek "Vaše řešení".
# 4. Nápovědy čtěte postupně, až když je potřebujete.
# 5. Výsledek porovnejte s komentářem "Očekávaný výsledek".
#
# Úlohy navíc jsou dobrovolné. Slouží rychlejším skupinám
# a pozdějšímu procvičení; nemusíte je dokončit během praktika.
#
# Řádky začínající znakem # jsou komentáře. R je nespouští.


#--------------------------------------------------#
## Výsledky učení -----
#--------------------------------------------------#

# Po dokončení hlavních úloh dokážete:
# - rozpoznat řádek, sloupec a hodnotu v datové tabulce;
# - vytvořit a zkontrolovat vektor v R;
# - zobrazit jednu proměnnou vhodným grafem;
# - vypočítat a interpretovat základní popisné statistiky;
# - rozlišit čtyři základní typy proměnných;
# - propojit otázku, kontrolu dat, graf, čísla a biologický závěr.


#--------------------------------------------------#
## Technická kontrola -----
#--------------------------------------------------#

# Cesta začíná v hlavní složce otevřeného projektu.
# Kontrola nic nestahuje ani nemění ve vašem počítači.
soubor_savci <- "data/msleep.csv"

if (
  !file.exists(soubor_savci)) {
  stop(
    paste0(
      "Soubor data/msleep.csv nebyl nalezen. ",
      "Otevřete projekt L01_praktikum a zkontrolujte název ",
      "i umístění CSV ve složce data."
    ),
    call. = FALSE
  )
}


#----------------------------------------------------------#
# Připomenutí základů práce v R -----
#----------------------------------------------------------#

# Tento blok je rychlé připomenutí. Pokud základní práci v R bezpečně
# ovládáte, přejděte rovnou k části Hlavní úlohy.
#
# V RStudiu pracujeme hlavně se čtyřmi místy:
# - skript uchovává příkazy jako záznam postupu;
# - konzole ukazuje spuštěné příkazy a jejich výsledky;
# - Environment ukazuje objekty v paměti aktuální relace;
# - Plots ukazuje vytvořené grafy.

# Spusťte následující řádek pomocí Ctrl + Enter.
2 + 3

# Hranatá závorka [1] ve výstupu označuje první zobrazenou hodnotu.


#----------------------------------------#
### Úloha | L01-K01 -----
#----------------------------------------#

# Zadání:
# Spočítejte nejprve součet 8 + 2 a výsledek vynásobte třemi.

# Vaše řešení:


# Nápověda 1:
# R bez závorek provádí násobení před sčítáním; budete potřebovat
# operátory + a *.
#
# Nápověda 2:
# Součet, který se má provést první, uzavřete do závorek.
#
# Očekávaný výsledek:
# Jedno číslo, 30.
#
# Interpretace:
# Jaký výsledek by vznikl bez závorek a proč?


# Hodnotu můžeme uložit do objektu pomocí <-.
pocet_nohou <- 4
pocet_nohou

# Objekt je nyní v paměti a objeví se v panelu Environment.
# Trvalý záznam ale představuje tento řádek ve skriptu, nikoli paměť.


#----------------------------------------#
### Úloha | L01-K02 -----
#----------------------------------------#

# Zadání:
# Běžný pták má 2 křídla. Uložte hodnotu 2 do objektu pocet_kridel
# a objekt zobrazte.

# Vaše řešení:


# Nápověda 1:
# Samotné přiřazení objekt vytvoří, ale ve skriptu automaticky nevypíše jeho
# hodnotu.
#
# Nápověda 2:
# Použijte <- a na další řádek napište jen pocet_kridel.
#
# Očekávaný výsledek:
# Environment obsahuje pocet_kridel s hodnotou 2.
#
# Interpretace:
# Proč se hodnota objektu nevypsala hned při přiřazení, ale až na dalším
# řádku?


#----------------------------------------#
### Úloha | L01-K03 -----
#----------------------------------------#

# Zadání:
# Najděte ve skriptu řádek, který vytváří pocet_nohou, jeho výstup
# v konzoli a objekt pocet_nohou v panelu Environment.
# Restart R (v RStudiu nabídka Session > Restart R) vymaže všechny objekty
# z paměti; uložené soubory na disku zůstanou. Restart teď nespouštějte.
# Do komentáře zapište, co by po restartu zůstalo: příkaz ve skriptu,
# nebo objekt pocet_nohou v paměti?

# Vaše řešení:


# Nápověda 1:
# Rozlišujte, co je zapsané v souboru skriptu a co vzniklo až spuštěním
# příkazu.
#
# Nápověda 2:
# Objekt pocet_nohou vznikl spuštěním řádku s <-. Co byste po restartu
# museli udělat, aby objekt znovu existoval?
#
# Očekávaný výsledek:
# Po restartu zůstane jen příkaz ve skriptu. Objekt pocet_nohou
# z Environment zmizí a vznikne znovu, až řádek opět spustíte.


#----------------------------------------------------------#
# Hlavní úlohy -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Od tabulky k objektům v R -----
#--------------------------------------------------#

# Načteme schválená data o savcích.
# Každý řádek představuje jeden druh zastoupený v datové tabulce.
data_savci <-
  read.csv(
    file = soubor_savci,
    na.strings = ""
  )

# Prohlédneme prvních šest řádků.
head(
  x = data_savci,
  n = 6
)

# Zjistíme počet řádků a sloupců.
nrow(x = data_savci)

ncol(x = data_savci)

# Zobrazíme názvy proměnných a technickou strukturu tabulky.
names(x = data_savci)

str(object = data_savci)


#----------------------------------------#
### Úloha | L01-K04 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_savci a s výstupy head(), nrow(), ncol(), names()
# a str() z ukázky. Slovně doplňte počet pozorování, počet proměnných
# a biologický význam jednoho řádku.

# Vaše řešení:


# Nápověda 1:
# Rozlište rozměry tabulky od biologického významu řádku.
#
# Nápověda 2:
# Počty přečtěte z nrow() a ncol(); význam řádku ověřte v prvních záznamech
# a popisu dat.
#
# Očekávaný výsledek:
# 83 řádků, 11 sloupců; jeden řádek je jeden zastoupený druh savce, nikoli
# jeden jedinec ani všechny druhy savců.
#
# Interpretace:
# Na jakou populaci nesmíme výsledky automaticky zobecnit?


# Vybereme jediný sloupec jako samostatný vektor.
vec_spanek <-
  data_savci$sleep_total

length(x = vec_spanek)

head(
  x = vec_spanek,
  n = 6
)


#----------------------------------------#
### Úloha | L01-K05 -----
#----------------------------------------#

# Zadání:
# Z data_savci vyberte sloupec awake a uložte ho jako objekt vec_bdeni.
# Zkontrolujte jeho délku a prvních šest hodnot.

# Vaše řešení:


# Nápověda 1:
# Sloupec tabulky vyberete pomocí znaku $.
#
# Nápověda 2:
# Použijte data_savci$awake, potom length() a head().
#
# Očekávaný výsledek:
# Vektor má 83 hodnot; první jsou 11.9, 7, 9.6, 9.1, 20 a 9.6 hodiny.
#
# Interpretace:
# Co představuje jedna hodnota ve vektoru vec_bdeni?


#--------------------------------------------------#
## Data nejprve zobrazíme -----
#--------------------------------------------------#

# Každou dobu spánku zobrazíme jako jeden bod.
stripchart(
  x = vec_spanek,
  method = "stack",
  pch = 16,
  col = "#2C7FB8",
  xlab = "Celková doba spánku za den (hodiny)",
  main = "Doba spánku zastoupených druhů savců"
)


#----------------------------------------#
### Úloha | L01-K06 -----
#----------------------------------------#

# Zadání:
# V bodovém grafu vec_spanek najděte přibližnou nejnižší a nejvyšší
# hodnotu a oblast, ve které se body nejvíce hromadí.

# Vaše řešení:


# Nápověda 1:
# Každý bod představuje jednu hodnotu jednoho zastoupeného druhu.
#
# Nápověda 2:
# Na vodorovné ose najděte oba krajní body a úsek, kde je bodů nad sebou
# nejvíce.
#
# Očekávaný výsledek:
# Rozsah je přibližně 2-20 hodin a mnoho hodnot leží zhruba mezi 8 a 14
# hodinami.
#
# Interpretace:
# Kterou informaci bychom z jediného průměru neviděli?


# Histogram seskupí hodnoty do intervalů.
hist(
  x = vec_spanek,
  breaks = seq(
    from = 0,
    to = 22,
    by = 2
  ),
  col = "#9ECAE1",
  border = "white",
  xlab = "Celková doba spánku za den (hodiny)",
  main = "Histogram doby spánku"
)


#----------------------------------------#
### Úloha | L01-K07 -----
#----------------------------------------#

# Zadání:
# Podle ukázky hist() výše vytvořte z vec_spanek nový histogram
# s intervaly širokými čtyři hodiny.

# Vaše řešení:


# Nápověda 1:
# Šířku intervalů určuje způsob vytvoření jejich hranic.
#
# Nápověda 2:
# V argumentu breaks použijte seq() s hranicemi 0 a 22 a nastavte by = 4.
#
# Očekávaný výsledek:
# Graf má méně a širších sloupců, ale obsahuje stejných 83 pozorování a
# stejný rozsah hodnot.
#
# Interpretace:
# Co určila data a co jste zvolili vy?


# Krabicový graf zhušťuje hodnoty do několika souhrnů.
boxplot(
  x = vec_spanek,
  horizontal = TRUE,
  col = "#FDD0A2",
  xlab = "Celková doba spánku za den (hodiny)",
  main = "Krabicový graf doby spánku"
)


#----------------------------------------#
### Úloha | L01-K08 -----
#----------------------------------------#

# Zadání:
# Porovnejte krabicový graf vec_spanek s předchozím bodovým grafem.
# Napište jednu informaci, kterou krabicový graf zvýrazní, a jednu
# informaci, kterou proti bodovému grafu skryje.

# Vaše řešení:


# Nápověda 1:
# Krabicový graf hodnoty shrnuje, bodový graf je ukazuje jednotlivě.
#
# Nápověda 2:
# V krabici najděte čáru mediánu a potom porovnejte, zda v obou grafech
# vidíte jednotlivé hodnoty a jejich hromadění.
#
# Očekávaný výsledek:
# Zvýrazní medián, prostřední polovinu a rozsah bez možných odlehlých
# hodnot; skryje jednotlivé hodnoty a jejich hromadění.
#
# Interpretace:
# Proč může být užitečné vidět více než jeden typ grafu?


# Kategoriální proměnnou nejprve shrneme četnostmi.
tab_typ_potravy <-
  table(
    typ_potravy = data_savci$vore,
    useNA = "ifany"
  )

tab_typ_potravy

barplot(
  height = tab_typ_potravy,
  col = "#74C476",
  ylab = "Počet zastoupených druhů",
  main = "Typ potravy"
)


#----------------------------------------#
### Úloha | L01-K09 -----
#----------------------------------------#

# Zadání:
# Z tabulky tab_typ_potravy a jejího sloupcového grafu určete nejčastější
# známou kategorii a počet chybějících údajů.

# Vaše řešení:


# Nápověda 1:
# Výška sloupce a číslo v tabulce vyjadřují stejnou četnost.
#
# Nápověda 2:
# Najděte známou kategorii s nejvyšší četností a samostatně řádek nebo
# sloupec označený <NA>.
#
# Očekávaný výsledek:
# Nejčastější známá kategorie je herbi s 32 druhy; typ potravy chybí u 7
# zastoupených druhů.
#
# Interpretace:
# Proč nesmíme sedm chybějících údajů označit za nový typ potravy?


#--------------------------------------------------#
## Střed a variabilita patří ke grafu -----
#--------------------------------------------------#

# Vypočítáme souhrny stejného vektoru.
min(x = vec_spanek)

max(x = vec_spanek)

mean(x = vec_spanek)

median(x = vec_spanek)

quantile(
  x = vec_spanek,
  probs = c(0.25, 0.5, 0.75)
)

IQR(x = vec_spanek)

sd(x = vec_spanek)


#----------------------------------------#
### Úloha | L01-K10 -----
#----------------------------------------#

# Zadání:
# Z výstupů pro vec_spanek výše doplňte minimum, maximum, průměr, první
# kvartil, medián, třetí kvartil, IQR a SD. U každé hodnoty ponechte
# jednotku.

# Vaše řešení:


# Nápověda 1:
# Rozdělte výstupy na polohu, variabilitu a krajní hodnoty; všechny ponechte
# v původní jednotce proměnné.
#
# Nápověda 2:
# Q1 a Q3 ohraničují prostředních 50 % hodnot a jejich rozdíl je IQR; průměr
# a SD tvoří druhou přirozenou dvojici.
#
# Očekávaný výsledek:
# 1.9; 19.9; přibližně 10.43; 7.85; 10.1; 13.75; 5.9 a přibližně 4.45
# hodiny.
#
# Interpretace:
# Jak spolu Q1, Q3 a IQR popisují prostřední polovinu hodnot? Která dvojice
# polohy a variability se přirozeně doplňuje?


# Ukážeme citlivost průměru a mediánu na extrémní hodnotu.
vec_maly_puvodni <-
  c(8, 9, 10, 11, 12)

vec_maly_s_extremem <-
  c(8, 9, 10, 11, 40)

mean(x = vec_maly_puvodni)

median(x = vec_maly_puvodni)

mean(x = vec_maly_s_extremem)

median(x = vec_maly_s_extremem)


#----------------------------------------#
### Úloha | L01-K11 -----
#----------------------------------------#

# Zadání:
# Porovnejte souhrny vec_maly_puvodni a vec_maly_s_extremem. Popište,
# který souhrn se po změně hodnoty 12 na 40 posunul více.

# Vaše řešení:


# Nápověda 1:
# Extrémní hodnota nemusí ovlivnit všechny míry středu stejně.
#
# Nápověda 2:
# Porovnejte oba výstupy mean() a oba výstupy median(); do součtu pro průměr
# vstupuje celá velikost hodnoty 40.
#
# Očekávaný výsledek:
# Průměr se změnil z 10 na 15.6, medián pouze z 10 na 10.
#
# Interpretace:
# Který souhrn je v tomto příkladu odolnější vůči extrému?


#--------------------------------------------------#
## Typ proměnné určuje smysluplný popis -----
#--------------------------------------------------#

# Připravíme čtyři různé významy proměnných.
vec_doba_spanku <-
  data_savci$sleep_total

tab_druhy_v_radu <-
  table(
    rad = data_savci$order
  )

vec_pocet_druhu_v_radu <-
  as.numeric(
    x = tab_druhy_v_radu
  )

vec_typ_potravy <-
  factor(
    x = data_savci$vore
  )

# Následující malý vektor je uměle vytvořený příklad pro ukázku
# uspořádaných kategorií. Není převzatý ze sloupce tabulky msleep.
vec_velikost_savce <-
  factor(
    x = c("malý", "střední", "velký", "střední"),
    levels = c("malý", "střední", "velký"),
    ordered = TRUE
  )

# Technická reprezentace v R není totéž co statistický typ.
class(x = vec_doba_spanku)

typeof(x = vec_doba_spanku)

str(object = vec_doba_spanku)


#----------------------------------------#
### Úloha | L01-K13 -----
#----------------------------------------#

# Zadání:
# Ke každému ze čtyř objektů vec_doba_spanku, vec_pocet_druhu_v_radu,
# vec_typ_potravy a vec_velikost_savce přiřaďte typ proměnné: spojitá,
# diskrétní, nominální, nebo ordinální.

# Vaše řešení:


# Nápověda 1:
# Typ určujte podle významu a způsobu vzniku hodnot, nikoli jen podle jejich
# vzhledu v R.
#
# Nápověda 2:
# Měření je spojité, počet diskrétní, názvy bez pořadí nominální a názvy s
# přirozeným pořadím ordinální.
#
# Očekávaný výsledek:
# doba spánku je spojitá; počet druhů diskrétní; typ potravy nominální;
# velikostní kategorie ordinální.
#
# Interpretace:
# Proč může být číslo někdy kategorií a text někdy pořadím?


#----------------------------------------#
### Úloha | L01-K14 -----
#----------------------------------------#

# Zadání:
# Pro každý ze čtyř objektů vec_doba_spanku, vec_pocet_druhu_v_radu,
# vec_typ_potravy a vec_velikost_savce zvolte vhodný první graf a číselný
# souhrn. Svou volbu jednou větou zdůvodněte.

# Vaše řešení:


# Nápověda 1:
# Číselné a kategoriální proměnné nepopisujeme stejným způsobem.
#
# Nápověda 2:
# Pro kategorie použijte četnosti a sloupcový graf; pro číselná data graf
# rozdělení a souhrn středu i variability.
#
# Očekávaný výsledek:
# Pro spojitou proměnnou bodový graf, histogram nebo boxplot a dvojice
# medián + IQR nebo průměr + SD podle tvaru; pro diskrétní četnosti a
# bodový, sloupcový nebo vhodný histogram; pro nominální četnosti a
# sloupcový graf; pro ordinální četnosti a sloupcový graf se zachovaným
# pořadím kategorií.
#
# Interpretace:
# Proč neexistuje jeden nejlepší graf a souhrn pro všechny typy?


#--------------------------------------------------#
## Integrovaný úkol: kolik váží „typický“ savec? -----
#--------------------------------------------------#

# Vrátíme se k otázce z úvodu L01.
vec_hmotnost <-
  data_savci$bodywt


#----------------------------------------#
### Úloha | L01-K15 -----
#----------------------------------------#

# Zadání:
# Z vec_hmotnost (tělesná hmotnost v kilogramech) vytvořte histogram
# a krabicový graf.

# Vaše řešení:


# Nápověda 1:
# Jeden graf má ukázat tvar rozdělení a druhý jeho kvartilový souhrn.
#
# Nápověda 2:
# Použijte hist() a boxplot(); u boxplot() nastavte horizontal = TRUE.
#
# Očekávaný výsledek:
# Většina hodnot je stlačena u nízkých hmotností a několik velmi vysokých
# hodnot výrazně prodlužuje pravý konec rozdělení.
#
# Interpretace:
# Je rozdělení přibližně symetrické?


#----------------------------------------#
### Úloha | L01-K16 -----
#----------------------------------------#

# Zadání:
# Vypočítejte průměr a medián tělesné hmotnosti vec_hmotnost.

# Vaše řešení:


# Nápověda 1:
# Potřebujete jednu míru využívající všechny velikosti hodnot a jednu míru
# založenou na jejich pořadí.
#
# Nápověda 2:
# Použijte mean() a median(); oběma předejte vec_hmotnost argumentem x.
#
# Očekávaný výsledek:
# Průměr je přibližně 166.14 kg, medián 1.67 kg.
#
# Interpretace:
# Který souhrn více ovlivnili nejtěžší savci?


#----------------------------------------#
### Úloha | L01-K17 -----
#----------------------------------------#

# Zadání:
# Na základě grafů a výsledků z L01-K15 a L01-K16 napište dvě až tři
# věty: zvolte vhodnější popis typické hmotnosti, zdůvodněte ho tvarem dat
# a omezte závěr na správnou jednotku pozorování.

# Vaše řešení:


# Nápověda 1:
# U silně pravostranných dat hledejte souhrn, který méně ovlivní několik
# mimořádně velkých hodnot.
#
# Nápověda 2:
# Porovnejte citlivost průměru a mediánu a z L01-K04 převezměte správnou
# jednotku pozorování i hranici zobecnění.
#
# Očekávaný výsledek:
# Medián 1.67 kg lépe popisuje prostřední zastoupený druh v silně
# pravostranném rozdělení. Závěr se týká druhů zastoupených v tabulce,
# nikoli jednotlivých savců ani automaticky všech druhů savců.
#
# Interpretace:
# Jak by se význam průměru změnil, kdyby každý řádek byl jedinec?


#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#

# Následující úlohy nejsou součástí hlavních úloh.
# Vyberte si skupinu, kterou potřebujete procvičit.


#--------------------------------------------------#
## Objekty a orientace v datech -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha navíc | L01-N01 -----
#----------------------------------------#

# Zadání:
# Uložte hodnoty 6, 8, 7, 9 a 10 hodin do objektu vec_spanek_peti_druhu.

# Vaše řešení:


# Nápověda 1:
# Nejprve spojte jednotlivé hodnoty do jednoho objektu.
#
# Nápověda 2:
# Hodnoty vložte do c() a výsledek přiřaďte pomocí <-.
#
# Očekávaný výsledek:
# Číselný vektor délky 5 v uvedeném pořadí.
#
# Interpretace:
# Co by v biologické tabulce představovala jedna hodnota?


#----------------------------------------#
### Úloha navíc | L01-N02 -----
#----------------------------------------#

# Zadání:
# Zjistěte délku vektoru vec_spanek z hlavní části a zobrazte jeho první
# tři hodnoty.

# Vaše řešení:


# Nápověda 1:
# Jedna kontrola má popsat velikost vektoru, druhá jeho začátek.
#
# Nápověda 2:
# Použijte length() a v head() nastavte n = 3.
#
# Očekávaný výsledek:
# Délka 83; hodnoty 12.1, 17 a 14.4.


#----------------------------------------#
### Úloha navíc | L01-N03 -----
#----------------------------------------#

# Zadání:
# Zobrazte názvy proměnných data_savci a poslední čtyři řádky tabulky.

# Vaše řešení:


# Nápověda 1:
# Potřebujete jednu funkci pro sloupce a jinou pro konec tabulky.
#
# Nápověda 2:
# Použijte names() a tail() s argumentem n = 4.
#
# Očekávaný výsledek:
# 11 názvů proměnných a čtyři poslední druhy.
#
# Interpretace:
# Proč samotný název sloupce nemusí stačit k pochopení proměnné?


#----------------------------------------#
### Úloha navíc | L01-N04 -----
#----------------------------------------#

# Zadání:
# Ze sloupce brainwt v data_savci vytvořte vec_hmotnost_mozku a zjistěte
# jeho délku.

# Vaše řešení:


# Nápověda 1:
# Vyberte požadovaný sloupec pomocí $ a uložte jej jako vektor.
#
# Nápověda 2:
# Použijte data_savci$brainwt a délku ověřte pomocí length().
#
# Očekávaný výsledek:
# Vektor délky 83; některé hodnoty chybí.
#
# Interpretace:
# Znamená délka 83, že známe hmotnost mozku pro všech 83 druhů?


#--------------------------------------------------#
## Číselné souhrny -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha navíc | L01-N05 -----
#----------------------------------------#

# Zadání:
# Vypočítejte minimum a maximum data_savci$awake.

# Vaše řešení:


# Nápověda 1:
# Hledáte oba krajní body číselných hodnot.
#
# Nápověda 2:
# Použijte min() a max() a sloupec předejte argumentem x.
#
# Očekávaný výsledek:
# Minimum 4.1 a maximum 22.1 hodiny.
#
# Interpretace:
# Jak souvisejí tyto hodnoty s dobou spánku během 24 hodin?


#----------------------------------------#
### Úloha navíc | L01-N06 -----
#----------------------------------------#

# Zadání:
# Vypočítejte průměr a medián data_savci$awake.

# Vaše řešení:


# Nápověda 1:
# Porovnejte míru založenou na součtu s mírou založenou na pořadí.
#
# Nápověda 2:
# Použijte mean() a median() s proměnnou v argumentu x.
#
# Očekávaný výsledek:
# Průměr přibližně 13.57 a medián 13.9 hodiny.
#
# Interpretace:
# Jsou si souhrny bližší než u tělesné hmotnosti?


#----------------------------------------#
### Úloha navíc | L01-N07 -----
#----------------------------------------#

# Zadání:
# Vypočítejte 25., 50. a 75. percentil vec_hmotnost.

# Vaše řešení:


# Nápověda 1:
# Hledané percentily odpovídají třem podílům mezi 0 a 1.
#
# Nápověda 2:
# V quantile() nastavte probs = c(0.25, 0.50, 0.75).
#
# Očekávaný výsledek:
# Přibližně 0.174, 1.670 a 41.750 kg.
#
# Interpretace:
# Jak je možné, že 75 % hodnot nepřesahuje 41.75 kg, ale průměr je přibližně
# 166 kg?


#----------------------------------------#
### Úloha navíc | L01-N08 -----
#----------------------------------------#

# Zadání:
# Vypočítejte IQR a směrodatnou odchylku vec_hmotnost.

# Vaše řešení:


# Nápověda 1:
# Jedna míra popisuje prostřední polovinu hodnot, druhá využívá odchylky
# všech hodnot od průměru.
#
# Nápověda 2:
# Použijte IQR() a sd() s vec_hmotnost v argumentu x.
#
# Očekávaný výsledek:
# IQR je přibližně 41.58 kg, SD přibližně 786.84 kg.
#
# Interpretace:
# Který souhrn silněji odráží několik mimořádně těžkých druhů?


#----------------------------------------#
### Úloha navíc | L01-N09 -----
#----------------------------------------#

# Zadání:
# Ve výsledcích L01-N07 odečtěte první kvartil od třetího a porovnejte
# výsledek s IQR().

# Vaše řešení:


# Nápověda 1:
# IQR je šířka intervalu obsahujícího prostřední polovinu hodnot.
#
# Nápověda 2:
# Z výstupu quantile() odečtěte Q1 od Q3 a výsledek porovnejte
# s IQR(x = vec_hmotnost).
#
# Očekávaný výsledek:
# Rozdíl je přibližně 41.58 kg a shoduje se s IQR().
#
# Interpretace:
# Proč medián do šířky prostřední poloviny nevstupuje?


# Dva připravené vektory se stejným průměrem:
vec_uzky <- c(8, 9, 10, 11, 12)
vec_siroky <- c(2, 6, 10, 14, 18)

#----------------------------------------#
### Úloha navíc | L01-N25 -----
#----------------------------------------#

# Zadání:
# Pro vektory vec_uzky a vec_siroky z ukázky výše vypočítejte průměr
# a směrodatnou odchylku. Před spuštěním odhadněte, které výsledky budou
# stejné a které odlišné.

# Vaše řešení:


# Nápověda 1:
# Stejná poloha nevylučuje odlišnou variabilitu.
#
# Nápověda 2:
# Pro každý vektor spusťte mean() a sd(), tedy celkem čtyři samostatné
# výpočty.
#
# Očekávaný výsledek:
# Oba průměry jsou 10. Směrodatná odchylka je přibližně 1.58 pro vec_uzky a
# 6.32 pro vec_siroky.
#
# Interpretace:
# Proč samotný průměr nestačí k popisu těchto vektorů?


#--------------------------------------------------#
## Grafy a analytická rozhodnutí -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha navíc | L01-N10 -----
#----------------------------------------#

# Zadání:
# Z vec_spanek vytvořte histogram jednou s 5 a jednou s 20 intervaly.

# Vaše řešení:


# Nápověda 1:
# Počet intervalů mění rozlišení histogramu, nikoli vstupní data.
#
# Nápověda 2:
# Spusťte hist() dvakrát a v argumentu breaks použijte nejprve 5 a potom 20.
#
# Očekávaný výsledek:
# Jemnější členění ukáže více lokálních nerovností, ale oba grafy zobrazují
# stejná data.
#
# Interpretace:
# Který prvek grafu je volbou analytika?


#----------------------------------------#
### Úloha navíc | L01-N11 -----
#----------------------------------------#

# Zadání:
# vec_hmotnost obsahuje pouze kladné hodnoty. Vytvořte histogram
# log10(vec_hmotnost) a osu x označte log10(kg).

# Vaše řešení:


# Nápověda 1:
# Nejdříve změňte škálu hodnot a teprve potom je zobrazte.
#
# Nápověda 2:
# Do argumentu x funkce hist() vložte log10(vec_hmotnost) a popisek nastavte
# argumentem xlab.
#
# Očekávaný výsledek:
# Hodnoty se na logaritmické škále rozloží po ose rovnoměrněji než v
# původních kilogramech.
#
# Interpretace:
# Které pořadí a biologické informace se zachovaly a které číselné
# vzdálenosti se na log10 škále změnily?


#----------------------------------------#
### Úloha navíc | L01-N12 -----
#----------------------------------------#

# Zadání:
# Z data_savci$conservation vytvořte tabulku četností včetně NA
# a následně sloupcový graf.

# Vaše řešení:


# Nápověda 1:
# Chybějící hodnoty musí zůstat ve výpočtu četností viditelné.
#
# Nápověda 2:
# V table() nastavte useNA = "ifany" a výslednou tabulku předejte argumentu
# height v barplot().
#
# Očekávaný výsledek:
# Nejvyšší četnost má NA s 29 záznamy; z pojmenovaných kategorií má lc 27
# záznamů.
#
# Interpretace:
# Proč nelze chybějící údaj interpretovat jako stupeň ohrožení?


#--------------------------------------------------#
## Typy proměnných -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha navíc | L01-N13 -----
#----------------------------------------#

# Zadání:
# Pomocí table() spočítejte v data_savci$order zastoupené druhy v každém
# řádu.

# Vaše řešení:


# Nápověda 1:
# Kategorie řádu shrňte podle počtu jejich výskytů.
#
# Nápověda 2:
# Sloupec order vyberte pomocí $ a jeho hodnoty předejte funkci table() jako
# pojmenovaný vstup rad.
#
# Očekávaný výsledek:
# Tabulka obsahuje 19 zastoupených řádů savců; nejvíce je Rodentia s 22
# zastoupenými druhy.
#
# Interpretace:
# Jak se změnila jednotka pozorování proti data_savci?


#----------------------------------------#
### Úloha navíc | L01-N14 -----
#----------------------------------------#

# Zadání:
# Pro vec_typ_potravy navrhněte vhodný graf a číselný souhrn a oba
# vytvořte.

# Vaše řešení:


# Nápověda 1:
# Nominální proměnnou popisujte četnostmi, nikoli průměrem.
#
# Nápověda 2:
# Četnosti vytvořte pomocí table() a zobrazte pomocí barplot().
#
# Očekávaný výsledek:
# Smysluplná je tabulka četností a sloupcový graf; průměr ani SD pro názvy
# kategorií význam nemají.
#
# Interpretace:
# Proč pořadí kategorií není biologickou informací?


#----------------------------------------#
### Úloha navíc | L01-N15 -----
#----------------------------------------#

# Zadání:
# Pro vec_velikost_savce vytvořte četnosti a sloupcový graf.

# Vaše řešení:


# Nápověda 1:
# U ordinální proměnné musí graf zachovat přirozené pořadí kategorií.
#
# Nápověda 2:
# Pořadí je uloženo v levels faktoru; použijte table() a jeho výsledek
# předejte do barplot().
#
# Očekávaný výsledek:
# Kategorie jsou v pořadí malý, střední, velký, nikoli v abecedním pořadí.
#
# Interpretace:
# Co by se ztratilo, kdybychom pořadí hladin neuložili?


#----------------------------------------#
### Úloha navíc | L01-N16 -----
#----------------------------------------#

# Zadání:
# Pro data_savci$sleep_total a vec_pocet_druhu_v_radu spusťte class()
# a typeof(). Potom určete jejich statistický typ.

# Vaše řešení:


# Nápověda 1:
# Technické uložení objektu a statistický význam proměnné jsou dvě různé
# otázky.
#
# Nápověda 2:
# Uložení zjistěte pomocí class() a typeof(); statistický typ určete podle
# toho, zda hodnoty vznikly měřením nebo počítáním.
#
# Očekávaný výsledek:
# R může oba objekty popsat jako numeric/double, ale doba spánku je spojitá
# a počet druhů diskrétní proměnná.
#
# Interpretace:
# Proč technické uložení samo nestačí k volbě grafu?


#--------------------------------------------------#
## Chybějící hodnoty -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha navíc | L01-N17 -----
#----------------------------------------#

# Zadání:
# data_savci$sleep_rem obsahuje NA. Vypočítejte jeho mean() bez argumentu
# na.rm a prohlédněte výsledek.

# Vaše řešení:


# Nápověda 1:
# Nejdříve pozorujte výchozí chování funkce při výskytu NA.
#
# Nápověda 2:
# Zavolejte mean() s příslušným sloupcem v argumentu x a argument na.rm
# zatím nepřidávejte.
#
# Očekávaný výsledek:
# Funkce vrátí NA, protože alespoň jedna hodnota chybí.
#
# Interpretace:
# Znamená NA, že průměr známých hodnot neexistuje?


#----------------------------------------#
### Úloha navíc | L01-N18 -----
#----------------------------------------#

# Zadání:
# V data_savci$sleep_rem zjistěte počet chybějících hodnot a vypočítejte
# průměr ze známých hodnot.

# Vaše řešení:


# Nápověda 1:
# Logické hodnoty TRUE lze sečíst a chybějící hodnoty lze při výpočtu
# výslovně odstranit.
#
# Nápověda 2:
# Použijte sum(is.na(...)) a v mean() nastavte na.rm = TRUE.
#
# Očekávaný výsledek:
# Chybí 22 hodnot; průměr 61 známých hodnot je přibližně 1.88 hodiny.
#
# Interpretace:
# Ke kolika druhům se vypočítaný průměr skutečně vztahuje?


#----------------------------------------#
### Úloha navíc | L01-N19 -----
#----------------------------------------#

# Zadání:
# Vypočítejte průměr a medián data_savci$sleep_rem po vynechání NA.

# Vaše řešení:


# Nápověda 1:
# Obě míry středu musí pracovat se stejnou sadou známých hodnot.
#
# Nápověda 2:
# Použijte mean() a median() a v obou nastavte na.rm = TRUE.
#
# Očekávaný výsledek:
# Průměr je přibližně 1.88 hodiny, medián 1.5 hodiny.
#
# Interpretace:
# Co musíme uvést, aby čtenář věděl, jak jsme naložili s NA?


#--------------------------------------------------#
## Integrované výzvy -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha navíc | L01-N20 -----
#----------------------------------------#

# Zadání:
# Pro data_savci$awake zkontrolujte délku a NA, vytvořte vhodný graf,
# vypočítejte průměr, medián, IQR a SD a napište interpretaci o dvou
# větách.

# Vaše řešení:


# Nápověda 1:
# Úplnost dat a tvar rozdělení určují, jak opatrně budete později číst
# číselné souhrny.
#
# Nápověda 2:
# Začněte length() a sum(is.na(...)), potom navazujte postupem použitým pro
# vec_spanek.
#
# Očekávaný výsledek:
# 83 známých hodnot; průměr přibližně 13.57, medián 13.9 hodiny.
# Interpretace musí mluvit o zastoupených druzích.
#
# Interpretace:
# Která informace z grafu se nevešla do jediného souhrnu?


#----------------------------------------#
### Úloha navíc | L01-N21 -----
#----------------------------------------#

# Zadání:
# Pro data_savci$brainwt zjistěte počet známých hodnot, vytvořte graf
# a po vynechání NA porovnejte průměr s mediánem.

# Vaše řešení:


# Nápověda 1:
# Nejdříve oddělte známé hodnoty od NA a potom posuďte tvar jejich
# rozdělení.
#
# Nápověda 2:
# Počet známých hodnot zjistěte pomocí sum(!is.na(...)) a u mean() i
# median() nastavte na.rm = TRUE.
#
# Očekávaný výsledek:
# Známe 56 hodnot; průměr je přibližně 0.282 kg, medián přibližně 0.0124 kg
# a rozdělení je silně pravostranné.
#
# Interpretace:
# Který souhrn lépe popisuje prostřední známou hodnotu a proč?


#--------------------------------------------------#
## Bezpečné hledání chyb -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha navíc | L01-N22 -----
#----------------------------------------#

# Zadání:
# Následující zakomentovaný řádek je záměrně chybný:
#
#   vec_zvirata <- c(kočka, pes, morče)
#
# Přepište ho tak, aby vznikl textový vektor tří názvů.

# Vaše řešení:


# Nápověda 1:
# R rozlišuje textovou hodnotu od jména objektu podle zápisu.
#
# Nápověda 2:
# Každý název uzavřete do uvozovek; funkce c() zůstává stejná.
#
# Očekávaný výsledek:
# Vektor obsahuje "kočka", "pes" a "morče" a příkaz nevyžaduje předem
# existující objekty těchto jmen.
#
# Interpretace:
# Jakou chybovou zprávu by vyvolal původní řádek?


#----------------------------------------#
### Úloha navíc | L01-N23 -----
#----------------------------------------#

# Zadání:
# Následující zakomentovaný příkaz je záměrně chybný:
#
#   mean(x = vec_spanek_savcu)
#
# Opravte ho pomocí objektu vytvořeného v hlavní části.

# Vaše řešení:


# Nápověda 1:
# Chyba „object not found“ často znamená nesprávné jméno objektu.
#
# Nápověda 2:
# Porovnejte příkaz s Environment; správný objekt se jmenuje vec_spanek.
#
# Očekávaný výsledek:
# Průměr je přibližně 10.43 hodiny.
#
# Interpretace:
# Proč je přesné a stabilní pojmenování důležité?


#--------------------------------------------------#
## Reflexe nad rozhodnutími -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha navíc | L01-N24 -----
#----------------------------------------#

# Zadání:
# Projděte všechny grafy a souhrny z tohoto cvičení. Zařaďte následující
# položky jako pozorované údaje, vlastnost designu či definice dat, nebo
# volbu analytika: počet pozorování, šířka intervalů histogramu, naměřená
# hmotnost, barva grafu, zvolený souhrn středu a jednotka pozorování.

# Vaše řešení:


# Nápověda 1:
# Ptejte se, zda položka vznikla pozorováním, návrhem tabulky, nebo
# rozhodnutím při analýze.
#
# Nápověda 2:
# Naměřené hodnoty oddělte od jednotky pozorování; mezi volby analytika
# zařaďte to, co lze změnit úpravou grafu nebo souhrnu.
#
# Očekávaný výsledek:
# Počet pozorování a naměřené hmotnosti jsou údaje; jednotka pozorování
# vyplývá z designu a definice tabulky; šířka intervalů, barva a volba
# souhrnu jsou rozhodnutí analytika.
#
# Interpretace:
# Které analytické rozhodnutí mělo největší vliv na váš závěr?


#----------------------------------------------------------#
# Ohlédnutí a vlastní kontrola -----
#----------------------------------------------------------#

# Hlavní úlohy jste zvládli, pokud dokážete vlastními slovy odpovědět:
#
# 1. Co v data_savci představuje jeden řádek, sloupec a hodnota?
# 2. Proč data zobrazujeme dříve, než je shrneme jedním číslem?
# 3. Kdy se přirozeně doplňují průměr a SD a kdy medián a IQR?
# 4. Jak rozlišíte spojitou, diskrétní, nominální a ordinální proměnnou?
# 5. Jak pro každý typ zvolíte vhodný první graf a číselný souhrn?
# 6. Proč class() nebo typeof() samy neurčí statistický typ proměnné?
# 7. Proč medián lépe než průměr popisuje prostřední hmotnost
#    druhu zastoupeného v tabulce msleep?
#
# Pokud některou odpověď ještě neumíte vysvětlit, vraťte se k odpovídající
# hlavní úloze nebo si vyberte podobnou úlohu z části Úlohy navíc.
