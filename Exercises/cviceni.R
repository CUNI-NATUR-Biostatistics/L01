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

#--------------------------------------------------#
## Jak se skriptem pracovat -----
#--------------------------------------------------#

# Ve výuce postupujte po společné trase označené ZÁKLAD,
# VYZKOUŠEJTE a KONTROLA. Vyučující bude říkat, kdy se zastavit.
#
# Při samostudiu:
# 1. Začněte v čisté relaci R.
# 2. Spouštějte skript shora dolů pomocí Ctrl + Enter.
# 3. Vlastní kód pište pod řádek "Vaše řešení".
# 4. Výsledek porovnejte s komentářem "Očekávaný výsledek".
# 5. Nápovědy čtěte postupně, až když je potřebujete.
#
# Úlohy NAVÍC jsou dobrovolné. Slouží rychlejším skupinám
# a pozdějšímu procvičení; nemusíte je dokončit během praktika.
#
# Řádky začínající znakem # jsou komentáře. R je nespouští.


#--------------------------------------------------#
## Výsledky učení -----
#--------------------------------------------------#

# Po dokončení společné trasy dokážete:
# - rozpoznat řádek, sloupec a hodnotu v datové tabulce;
# - vytvořit a zkontrolovat vektor v R;
# - zobrazit jednu proměnnou vhodným grafem;
# - vypočítat a interpretovat základní popisné statistiky;
# - rozlišit čtyři základní typy proměnných;
# - propojit otázku, kontrolu dat, graf, čísla a biologický závěr.


#--------------------------------------------------#
## Technická kontrola -----
#--------------------------------------------------#

# Pro toto cvičení potřebujeme balíček {ggplot2}, protože obsahuje
# datovou tabulku msleep. Balíček nepřipojujeme pomocí library().

if (
  !requireNamespace(
    package = "ggplot2",
    quietly = TRUE
  )) {
  stop(
    "Chybí balíček {ggplot2}. Podle pokynů kurzu jej nainstalujte a spusťte skript znovu.",
    call. = FALSE
  )
}

# Pokud pracujete mimo připravené kurzové prostředí a kontrola selhala,
# můžete po domluvě s vyučujícím jednou spustit:
# install.packages(pkgs = "ggplot2")


#----------------------------------------------------------#
# Připomenutí základů práce v R -----
#----------------------------------------------------------#

# Tento blok zůstává v L01 jako rychlé připomenutí. Vyučující jej může
# přeskočit, pokud skupina základní práci v R bezpečně ovládá.
#
# V RStudiu pracujeme hlavně se čtyřmi místy:
# - skript uchovává příkazy jako záznam postupu;
# - konzole ukazuje spuštěné příkazy a jejich výsledky;
# - Environment ukazuje objekty v paměti aktuální relace;
# - Plots ukazuje vytvořené grafy.

# ZÁKLAD | Spusťte následující řádek pomocí Ctrl + Enter.
2 + 3

# Hranatá závorka [1] ve výstupu označuje první zobrazenou hodnotu.


#----------------------------------------#
### VYZKOUŠEJTE | L01-K01 -----
#----------------------------------------#

# Účel: Ověřit, že R respektuje pořadí matematických operací.
# Vstup: Čísla 8, 2 a 3.
# Úkol: Spočítejte nejprve součet 8 + 2 a výsledek vynásobte třemi.

# Vaše řešení:


# Očekávaný výsledek: Jedno číslo, 30.
# Nápověda 1: R bez závorek provádí násobení před sčítáním;
# budete potřebovat operátory + a *.
# Nápověda 2: Součet, který se má provést první, uzavřete do závorek.
# Interpretace: Jaký výsledek by vznikl bez závorek a proč?


# ZÁKLAD | Hodnotu můžeme uložit do objektu pomocí <-.
pocet_nohou <- 4
pocet_nohou

# Objekt je nyní v paměti a objeví se v panelu Environment.
# Trvalý záznam ale představuje tento řádek ve skriptu, nikoli paměť.


#----------------------------------------#
### VYZKOUŠEJTE | L01-K02 -----
#----------------------------------------#

# Účel: Vytvořit vlastní objekt a znovu jej použít.
# Vstup: Počet křídel běžného ptáka je 2.
# Úkol: Uložte hodnotu 2 do objektu pocet_kridel a objekt zobrazte.

# Vaše řešení:


# Očekávaný výsledek: Environment obsahuje pocet_kridel s hodnotou 2.
# Nápověda 1: Samotné přiřazení objekt vytvoří, ale ve skriptu
# automaticky nevypíše jeho hodnotu.
# Nápověda 2: Použijte <- a na další řádek napište jen pocet_kridel.
# Interpretace: Co by po restartu R zůstalo — objekt v paměti, nebo příkaz ve skriptu?


#----------------------------------------#
### ZÁKLAD | L01-K03 | Rychlá společná kontrola -----
#----------------------------------------#

# Ukažte řádek, který vytváří pocet_nohou, jeho výstup v konzoli
# a objekt v Environment. Příkaz ve skriptu zůstává i po restartu R;
# objekt v paměti aktuální relace nikoli.


#----------------------------------------------------------#
# Společná trasa: ZÁKLAD -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Od tabulky k objektům v R -----
#--------------------------------------------------#

# ZÁKLAD | Načteme schválená data o savcích.
# Každý řádek představuje jeden druh zastoupený v datové tabulce.
data_savci <-
  ggplot2::msleep

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
### KONTROLA | L01-K04 -----
#----------------------------------------#

# Účel: Spojit strukturu tabulky s biologickým významem.
# Vstup: data_savci a výstupy head(), nrow(), ncol(), names() a str().
# Úkol: Doplňte slovně počet pozorování, počet proměnných
# a biologický význam jednoho řádku.

# Vaše odpověď:


# Očekávaný výsledek: 83 řádků, 11 sloupců; jeden řádek je jeden
# zastoupený druh savce, nikoli jeden jedinec ani všechny druhy savců.
# Nápověda 1: Rozlište rozměry tabulky od biologického významu řádku.
# Nápověda 2: Počty přečtěte z nrow() a ncol(); význam řádku ověřte
# v prvních záznamech a popisu dat.
# Interpretace: Na jakou populaci nesmíme výsledky automaticky zobecnit?


# ZÁKLAD | Vybereme jediný sloupec jako samostatný vektor.
vec_spanek <-
  data_savci$sleep_total

length(x = vec_spanek)

head(
  x = vec_spanek,
  n = 6
)


#----------------------------------------#
### VYZKOUŠEJTE | L01-K05 -----
#----------------------------------------#

# Účel: Vybrat jinou spojitou proměnnou z tabulky.
# Vstup: data_savci a sloupec awake.
# Úkol: Vytvořte objekt vec_bdeni a zkontrolujte jeho délku a prvních šest hodnot.

# Vaše řešení:


# Očekávaný výsledek: Vektor má 83 hodnot; první jsou 11.9, 7, 9.6,
# 9.1, 20 a 9.6 hodiny.
# Nápověda 1: Sloupec tabulky vyberete pomocí znaku $.
# Nápověda 2: Použijte data_savci$awake, potom length() a head().
# Interpretace: Co představuje jedna hodnota ve vektoru vec_bdeni?


#--------------------------------------------------#
## Data nejprve zobrazíme -----
#--------------------------------------------------#

# ZÁKLAD | Každou dobu spánku zobrazíme jako jeden bod.
stripchart(
  x = vec_spanek,
  method = "stack",
  pch = 16,
  col = "#2C7FB8",
  xlab = "Celková doba spánku za den (hodiny)",
  main = "Doba spánku zastoupených druhů savců"
)


#----------------------------------------#
### KONTROLA | L01-K06 -----
#----------------------------------------#

# Účel: Přečíst graf jednotlivých hodnot.
# Vstup: Bodový graf vec_spanek.
# Úkol: Najděte přibližnou nejnižší a nejvyšší hodnotu a oblast,
# ve které se body nejvíce hromadí.

# Vaše odpověď:


# Očekávaný výsledek: Rozsah je přibližně 2-20 hodin a mnoho hodnot
# leží zhruba mezi 8 a 14 hodinami.
# Nápověda 1: Každý bod představuje jednu hodnotu jednoho zastoupeného druhu.
# Nápověda 2: Na vodorovné ose najděte oba krajní body a úsek,
# kde je bodů nad sebou nejvíce.
# Interpretace: Kterou informaci bychom z jediného průměru neviděli?


# ZÁKLAD | Histogram seskupí hodnoty do intervalů.
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
### VYZKOUŠEJTE | L01-K07 -----
#----------------------------------------#

# Účel: Pozorovat vliv analytického rozhodnutí na vzhled histogramu.
# Vstup: vec_spanek a ukázka hist() výše.
# Úkol: Vytvořte nový histogram s intervaly širokými čtyři hodiny.

# Vaše řešení:


# Očekávaný výsledek: Graf má méně a širších sloupců, ale obsahuje
# stejných 83 pozorování a stejný rozsah hodnot.
# Nápověda 1: Šířku intervalů určuje způsob vytvoření jejich hranic.
# Nápověda 2: V argumentu breaks použijte seq() s hranicemi 0 a 22
# a nastavte by = 4.
# Interpretace: Co určila data a co jste zvolili vy?


# ZÁKLAD | Krabicový graf zhušťuje hodnoty do několika souhrnů.
boxplot(
  x = vec_spanek,
  horizontal = TRUE,
  col = "#FDD0A2",
  xlab = "Celková doba spánku za den (hodiny)",
  main = "Krabicový graf doby spánku"
)


#----------------------------------------#
### KONTROLA | L01-K08 -----
#----------------------------------------#

# Účel: Rozlišit, co krabicový graf ukazuje a skrývá.
# Vstup: Krabicový graf vec_spanek a předchozí bodový graf.
# Úkol: Napište jednu informaci, kterou krabicový graf zvýrazní,
# a jednu informaci, kterou proti bodovému grafu skryje.

# Vaše odpověď:


# Očekávaný výsledek: Zvýrazní medián, prostřední polovinu a rozsah
# bez možných odlehlých hodnot; skryje jednotlivé hodnoty a jejich hromadění.
# Nápověda 1: Krabicový graf hodnoty shrnuje, bodový graf je ukazuje jednotlivě.
# Nápověda 2: V krabici najděte čáru mediánu a potom porovnejte,
# zda v obou grafech vidíte jednotlivé hodnoty a jejich hromadění.
# Interpretace: Proč může být užitečné vidět více než jeden typ grafu?


# ZÁKLAD | Kategoriální proměnnou nejprve shrneme četnostmi.
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
### KONTROLA | L01-K09 -----
#----------------------------------------#

# Účel: Přečíst četnosti kategoriální proměnné.
# Vstup: tab_typ_potravy a jeho sloupcový graf.
# Úkol: Určete nejčastější známou kategorii a počet chybějících údajů.

# Vaše odpověď:


# Očekávaný výsledek: Nejčastější známá kategorie je herbi s 32 druhy;
# typ potravy chybí u 7 zastoupených druhů.
# Nápověda 1: Výška sloupce a číslo v tabulce vyjadřují stejnou četnost.
# Nápověda 2: Najděte známou kategorii s nejvyšší četností
# a samostatně řádek nebo sloupec označený <NA>.
# Interpretace: Proč nesmíme sedm chybějících údajů označit za nový typ potravy?


#--------------------------------------------------#
## Střed a variabilita patří ke grafu -----
#--------------------------------------------------#

# ZÁKLAD | Vypočítáme souhrny stejného vektoru.
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
### KONTROLA | L01-K10 -----
#----------------------------------------#

# Účel: Propojit funkce s významem vypočítaných souhrnů.
# Vstup: Výstupy pro vec_spanek výše.
# Úkol: Doplňte minimum, maximum, průměr, první kvartil, medián,
# třetí kvartil, IQR a SD
# a u každého ponechte jednotku.

# Vaše odpověď:


# Očekávaný výsledek: 1.9; 19.9; přibližně 10.43; 7.85; 10.1;
# 13.75; 5.9 a přibližně 4.45 hodiny.
# Nápověda 1: Rozdělte výstupy na polohu, variabilitu a krajní hodnoty;
# všechny ponechte v původní jednotce proměnné.
# Nápověda 2: Q1 a Q3 ohraničují prostředních 50 % hodnot a jejich
# rozdíl je IQR; průměr a SD tvoří druhou přirozenou dvojici.
# Interpretace: Jak spolu Q1, Q3 a IQR popisují prostřední polovinu hodnot?
# Která dvojice polohy a variability se přirozeně doplňuje?


# ZÁKLAD | Ukážeme citlivost průměru a mediánu na extrémní hodnotu.
vec_maly_puvodni <-
  c(8, 9, 10, 11, 12)

vec_maly_s_extremem <-
  c(8, 9, 10, 11, 40)

mean(x = vec_maly_puvodni)

median(x = vec_maly_puvodni)

mean(x = vec_maly_s_extremem)

median(x = vec_maly_s_extremem)


#----------------------------------------#
### KONTROLA | L01-K11 -----
#----------------------------------------#

# Účel: Porovnat citlivost průměru a mediánu.
# Vstup: vec_maly_puvodni a vec_maly_s_extremem.
# Úkol: Popište, který souhrn se po změně 12 na 40 posunul více.

# Vaše odpověď:


# Očekávaný výsledek: Průměr se změnil z 10 na 15.6,
# medián pouze z 10 na 10.
# Nápověda 1: Extrémní hodnota nemusí ovlivnit všechny míry středu stejně.
# Nápověda 2: Porovnejte oba výstupy mean() a oba výstupy median();
# do součtu pro průměr vstupuje celá velikost hodnoty 40.
# Interpretace: Který souhrn je v tomto příkladu odolnější vůči extrému?


#--------------------------------------------------#
## Typ proměnné určuje smysluplný popis -----
#--------------------------------------------------#

# ZÁKLAD | Připravíme čtyři různé významy proměnných.
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
### KONTROLA | L01-K13 -----
#----------------------------------------#

# Účel: Rozlišit čtyři statistické typy proměnných.
# Vstup: Čtyři objekty vec_doba_spanku, vec_pocet_druhu_v_radu,
# vec_typ_potravy a vec_velikost_savce.
# Úkol: Ke každému přiřaďte typ: spojitá, diskrétní, nominální, ordinální.

# Vaše odpověď:


# Očekávaný výsledek: doba spánku je spojitá; počet druhů diskrétní;
# typ potravy nominální; velikostní kategorie ordinální.
# Nápověda 1: Typ určujte podle významu a způsobu vzniku hodnot,
# nikoli jen podle jejich vzhledu v R.
# Nápověda 2: Měření je spojité, počet diskrétní, názvy bez pořadí
# nominální a názvy s přirozeným pořadím ordinální.
# Interpretace: Proč může být číslo někdy kategorií a text někdy pořadím?


#----------------------------------------#
### VYZKOUŠEJTE | L01-K14 -----
#----------------------------------------#

# Účel: Zvolit popis odpovídající statistickému typu proměnné.
# Vstup: vec_doba_spanku, vec_pocet_druhu_v_radu,
# vec_typ_potravy a vec_velikost_savce.
# Úkol: Pro každý objekt zvolte vhodný první graf a číselný souhrn
# a svou volbu jednou větou zdůvodněte.

# Vaše řešení:


# Očekávaný výsledek: Pro spojitou proměnnou bodový graf, histogram
# nebo boxplot a dvojice medián + IQR nebo průměr + SD podle tvaru;
# pro diskrétní četnosti a bodový, sloupcový nebo vhodný histogram;
# pro nominální četnosti a sloupcový graf; pro ordinální četnosti
# a sloupcový graf se zachovaným pořadím kategorií.
# Nápověda 1: Číselné a kategoriální proměnné nepopisujeme stejným způsobem.
# Nápověda 2: Pro kategorie použijte četnosti a sloupcový graf;
# pro číselná data graf rozdělení a souhrn středu i variability.
# Interpretace: Proč neexistuje jeden nejlepší graf a souhrn pro všechny typy?


#--------------------------------------------------#
## Integrovaný úkol: kolik váží „typický“ savec? -----
#--------------------------------------------------#

# ZÁKLAD | Vrátíme se k otázce z úvodu L01.
vec_hmotnost <-
  data_savci$bodywt


#----------------------------------------#
### VYZKOUŠEJTE | L01-K15 -----
#----------------------------------------#

# Účel: Zkontrolovat tvar rozdělení před volbou jednoho souhrnu.
# Vstup: vec_hmotnost v kilogramech.
# Úkol: Vytvořte histogram a krabicový graf tělesné hmotnosti.

# Vaše řešení:


# Očekávaný výsledek: Většina hodnot je stlačena u nízkých hmotností
# a několik velmi vysokých hodnot výrazně prodlužuje pravý konec rozdělení.
# Nápověda 1: Jeden graf má ukázat tvar rozdělení a druhý jeho kvartilový souhrn.
# Nápověda 2: Použijte hist() a boxplot(); u boxplot() nastavte
# horizontal = TRUE.
# Interpretace: Je rozdělení přibližně symetrické?


#----------------------------------------#
### VYZKOUŠEJTE | L01-K16 -----
#----------------------------------------#

# Účel: Porovnat dvě možné odpovědi na otázku po typické hmotnosti.
# Vstup: vec_hmotnost.
# Úkol: Vypočítejte průměr a medián tělesné hmotnosti.

# Vaše řešení:


# Očekávaný výsledek: Průměr je přibližně 166.14 kg,
# medián 1.67 kg.
# Nápověda 1: Potřebujete jednu míru využívající všechny velikosti hodnot
# a jednu míru založenou na jejich pořadí.
# Nápověda 2: Použijte mean() a median(); oběma předejte
# vec_hmotnost argumentem x.
# Interpretace: Který souhrn více ovlivnili nejtěžší savci?


#----------------------------------------#
### KONTROLA | L01-K17 -----
#----------------------------------------#

# Účel: Vytvořit biologicky opatrný závěr z grafu a souhrnů.
# Vstup: Grafy a výsledky z L01-K15 a L01-K16.
# Úkol: Napište dvě až tři věty: zvolte vhodnější popis typické hmotnosti,
# zdůvodněte jej tvarem dat a omezte závěr na správnou jednotku pozorování.

# Vaše odpověď:


# Očekávaný výsledek: Medián 1.67 kg lépe popisuje prostřední zastoupený
# druh v silně pravostranném rozdělení. Závěr se týká druhů zastoupených
# v tabulce, nikoli jednotlivých savců ani automaticky všech druhů savců.
# Nápověda 1: U silně pravostranných dat hledejte souhrn,
# který méně ovlivní několik mimořádně velkých hodnot.
# Nápověda 2: Porovnejte citlivost průměru a mediánu a z L01-K04
# převezměte správnou jednotku pozorování i hranici zobecnění.
# Interpretace: Jak by se význam průměru změnil, kdyby každý řádek byl jedinec?


#----------------------------------------------------------#
# Dobrovolná banka úloh: NAVÍC -----
#----------------------------------------------------------#

# Následující úlohy nejsou součástí povinné společné trasy.
# Vyberte si skupinu, kterou potřebujete procvičit.


#--------------------------------------------------#
## NAVÍC A: Objekty a orientace v datech -----
#--------------------------------------------------#


#----------------------------------------#
### NAVÍC | L01-N01 -----
#----------------------------------------#

# Účel: Procvičit vytvoření číselného vektoru.
# Vstup: Hodnoty 6, 8, 7, 9 a 10 hodin.
# Úkol: Uložte hodnoty do objektu vec_spanek_peti_druhu.

# Vaše řešení:


# Očekávaný výsledek: Číselný vektor délky 5 v uvedeném pořadí.
# Nápověda 1: Nejprve spojte jednotlivé hodnoty do jednoho objektu.
# Nápověda 2: Hodnoty vložte do c() a výsledek přiřaďte pomocí <-.
# Interpretace: Co by v biologické tabulce představovala jedna hodnota?


#----------------------------------------#
### NAVÍC | L01-N02 -----
#----------------------------------------#

# Účel: Zkontrolovat velikost a začátek vektoru.
# Vstup: vec_spanek z hlavní části.
# Úkol: Zjistěte délku vektoru a zobrazte první tři hodnoty.

# Vaše řešení:


# Očekávaný výsledek: Délka 83; hodnoty 12.1, 17 a 14.4.
# Nápověda 1: Jedna kontrola má popsat velikost vektoru, druhá jeho začátek.
# Nápověda 2: Použijte length() a v head() nastavte n = 3.


#----------------------------------------#
### NAVÍC | L01-N03 -----
#----------------------------------------#

# Účel: Procvičit orientaci v celé datové tabulce.
# Vstup: data_savci.
# Úkol: Zobrazte názvy proměnných a poslední čtyři řádky.

# Vaše řešení:


# Očekávaný výsledek: 11 názvů proměnných a čtyři poslední druhy.
# Nápověda 1: Potřebujete jednu funkci pro sloupce a jinou pro konec tabulky.
# Nápověda 2: Použijte names() a tail() s argumentem n = 4.
# Interpretace: Proč samotný název sloupce nemusí stačit k pochopení proměnné?


#----------------------------------------#
### NAVÍC | L01-N04 -----
#----------------------------------------#

# Účel: Přenést výběr sloupce na novou proměnnou.
# Vstup: Sloupec brainwt v data_savci.
# Úkol: Vytvořte vec_hmotnost_mozku a zjistěte jeho délku.

# Vaše řešení:


# Očekávaný výsledek: Vektor délky 83; některé hodnoty chybí.
# Nápověda 1: Vyberte požadovaný sloupec pomocí $ a uložte jej jako vektor.
# Nápověda 2: Použijte data_savci$brainwt a délku ověřte pomocí length().
# Interpretace: Znamená délka 83, že známe hmotnost mozku pro všech 83 druhů?


#--------------------------------------------------#
## NAVÍC B: Číselné souhrny -----
#--------------------------------------------------#


#----------------------------------------#
### NAVÍC | L01-N05 -----
#----------------------------------------#

# Účel: Popsat dobu bdění krajními hodnotami.
# Vstup: data_savci$awake.
# Úkol: Vypočítejte minimum a maximum.

# Vaše řešení:


# Očekávaný výsledek: Minimum 4.1 a maximum 22.1 hodiny.
# Nápověda 1: Hledáte oba krajní body číselných hodnot.
# Nápověda 2: Použijte min() a max() a sloupec předejte argumentem x.
# Interpretace: Jak souvisejí tyto hodnoty s dobou spánku během 24 hodin?


#----------------------------------------#
### NAVÍC | L01-N06 -----
#----------------------------------------#

# Účel: Porovnat průměr a medián doby bdění.
# Vstup: data_savci$awake.
# Úkol: Vypočítejte oba souhrny.

# Vaše řešení:


# Očekávaný výsledek: Průměr přibližně 13.57 a medián 13.9 hodiny.
# Nápověda 1: Porovnejte míru založenou na součtu s mírou založenou na pořadí.
# Nápověda 2: Použijte mean() a median() s proměnnou v argumentu x.
# Interpretace: Jsou si souhrny bližší než u tělesné hmotnosti?


#----------------------------------------#
### NAVÍC | L01-N07 -----
#----------------------------------------#

# Účel: Procvičit kvartily na tělesné hmotnosti.
# Vstup: vec_hmotnost.
# Úkol: Vypočítejte 25., 50. a 75. percentil.

# Vaše řešení:


# Očekávaný výsledek: Přibližně 0.174, 1.670 a 41.750 kg.
# Nápověda 1: Hledané percentily odpovídají třem podílům mezi 0 a 1.
# Nápověda 2: V quantile() nastavte probs = c(0.25, 0.50, 0.75).
# Interpretace: Jak je možné, že 75 % hodnot nepřesahuje 41.75 kg,
# ale průměr je přibližně 166 kg?


#----------------------------------------#
### NAVÍC | L01-N08 -----
#----------------------------------------#

# Účel: Porovnat dvě míry variability tělesné hmotnosti.
# Vstup: vec_hmotnost.
# Úkol: Vypočítejte IQR a směrodatnou odchylku.

# Vaše řešení:


# Očekávaný výsledek: IQR je přibližně 41.58 kg,
# SD přibližně 786.84 kg.
# Nápověda 1: Jedna míra popisuje prostřední polovinu hodnot,
# druhá využívá odchylky všech hodnot od průměru.
# Nápověda 2: Použijte IQR() a sd() s vec_hmotnost v argumentu x.
# Interpretace: Který souhrn silněji odráží několik mimořádně těžkých druhů?


#----------------------------------------#
### NAVÍC | L01-N09 -----
#----------------------------------------#

# Účel: Ověřit výpočet IQR z kvartilů.
# Vstup: Výsledky L01-N07.
# Úkol: Odečtěte první kvartil od třetího a porovnejte výsledek s IQR().

# Vaše řešení:


# Očekávaný výsledek: Rozdíl je přibližně 41.58 kg a shoduje se s IQR().
# Nápověda 1: IQR je šířka intervalu obsahujícího prostřední polovinu hodnot.
# Nápověda 2: Z výstupu quantile() odečtěte Q1 od Q3 a výsledek
# porovnejte s IQR(x = vec_hmotnost).
# Interpretace: Proč medián do šířky prostřední poloviny nevstupuje?


#----------------------------------------#
### NAVÍC | L01-N25 -----
#----------------------------------------#

# Účel: Oddělit polohu hodnot od jejich variability.
# Vstup: Dva připravené vektory se stejným průměrem.
vec_uzky <- c(8, 9, 10, 11, 12)
vec_siroky <- c(2, 6, 10, 14, 18)
# Úkol: Pro oba vektory vypočítejte průměr a směrodatnou odchylku.
# Před spuštěním odhadněte, které výsledky budou stejné a které odlišné.

# Vaše řešení:


# Očekávaný výsledek: Oba průměry jsou 10. Směrodatná odchylka
# je přibližně 1.58 pro vec_uzky a 6.32 pro vec_siroky.
# Nápověda 1: Stejná poloha nevylučuje odlišnou variabilitu.
# Nápověda 2: Pro každý vektor spusťte mean() a sd(), tedy celkem
# čtyři samostatné výpočty.
# Interpretace: Proč samotný průměr nestačí k popisu těchto vektorů?


#--------------------------------------------------#
## NAVÍC C: Grafy a analytická rozhodnutí -----
#--------------------------------------------------#


#----------------------------------------#
### NAVÍC | L01-N10 -----
#----------------------------------------#

# Účel: Porovnat dvě členění stejného histogramu.
# Vstup: vec_spanek.
# Úkol: Vytvořte histogram jednou s 5 a jednou s 20 intervaly.

# Vaše řešení:


# Očekávaný výsledek: Jemnější členění ukáže více lokálních nerovností,
# ale oba grafy zobrazují stejná data.
# Nápověda 1: Počet intervalů mění rozlišení histogramu, nikoli vstupní data.
# Nápověda 2: Spusťte hist() dvakrát a v argumentu breaks použijte
# nejprve 5 a potom 20.
# Interpretace: Který prvek grafu je volbou analytika?


#----------------------------------------#
### NAVÍC | L01-N11 -----
#----------------------------------------#

# Účel: Prozkoumat silně pravostranné hodnoty na odvozené log10 škále.
# Vstup: vec_hmotnost, která obsahuje pouze kladné hodnoty.
# Úkol: Vytvořte histogram log10(vec_hmotnost) a osu x označte log10(kg).

# Vaše řešení:


# Očekávaný výsledek: Hodnoty se na logaritmické škále rozloží
# po ose rovnoměrněji než v původních kilogramech.
# Nápověda 1: Nejdříve změňte škálu hodnot a teprve potom je zobrazte.
# Nápověda 2: Do argumentu x funkce hist() vložte log10(vec_hmotnost)
# a popisek nastavte argumentem xlab.
# Interpretace: Které pořadí a biologické informace se zachovaly
# a které číselné vzdálenosti se na log10 škále změnily?


#----------------------------------------#
### NAVÍC | L01-N12 -----
#----------------------------------------#

# Účel: Zobrazit chybějící kategorii ve sloupcovém grafu.
# Vstup: data_savci$conservation.
# Úkol: Vytvořte tabulku četností včetně NA a následně sloupcový graf.

# Vaše řešení:


# Očekávaný výsledek: Nejvyšší četnost má NA s 29 záznamy;
# z pojmenovaných kategorií má lc 27 záznamů.
# Nápověda 1: Chybějící hodnoty musí zůstat ve výpočtu četností viditelné.
# Nápověda 2: V table() nastavte useNA = "ifany" a výslednou tabulku
# předejte argumentu height v barplot().
# Interpretace: Proč nelze chybějící údaj interpretovat jako stupeň ohrožení?


#--------------------------------------------------#
## NAVÍC D: Typy proměnných -----
#--------------------------------------------------#


#----------------------------------------#
### NAVÍC | L01-N13 -----
#----------------------------------------#

# Účel: Odvodit diskrétní proměnnou počítáním druhů.
# Vstup: data_savci$order.
# Úkol: Spočítejte zastoupené druhy v každém řádu pomocí table().

# Vaše řešení:


# Očekávaný výsledek: Tabulka obsahuje 19 zastoupených řádů savců;
# nejvíce je Rodentia
# s 22 zastoupenými druhy.
# Nápověda 1: Kategorie řádu shrňte podle počtu jejich výskytů.
# Nápověda 2: Sloupec order vyberte pomocí $ a jeho hodnoty předejte
# funkci table() jako pojmenovaný vstup rad.
# Interpretace: Jak se změnila jednotka pozorování proti data_savci?


#----------------------------------------#
### NAVÍC | L01-N14 -----
#----------------------------------------#

# Účel: Zvolit popis pro nominální proměnnou.
# Vstup: vec_typ_potravy.
# Úkol: Navrhněte vhodný graf a číselný souhrn a oba vytvořte.

# Vaše řešení:


# Očekávaný výsledek: Smysluplná je tabulka četností a sloupcový graf;
# průměr ani SD pro názvy kategorií význam nemají.
# Nápověda 1: Nominální proměnnou popisujte četnostmi, nikoli průměrem.
# Nápověda 2: Četnosti vytvořte pomocí table() a zobrazte pomocí barplot().
# Interpretace: Proč pořadí kategorií není biologickou informací?


#----------------------------------------#
### NAVÍC | L01-N15 -----
#----------------------------------------#

# Účel: Ověřit zachování přirozeného pořadí kategorií.
# Vstup: vec_velikost_savce.
# Úkol: Vytvořte četnosti a sloupcový graf.

# Vaše řešení:


# Očekávaný výsledek: Kategorie jsou v pořadí malý, střední, velký,
# nikoli v abecedním pořadí.
# Nápověda 1: U ordinální proměnné musí graf zachovat přirozené pořadí kategorií.
# Nápověda 2: Pořadí je uloženo v levels faktoru; použijte table()
# a jeho výsledek předejte do barplot().
# Interpretace: Co by se ztratilo, kdybychom pořadí hladin neuložili?


#----------------------------------------#
### NAVÍC | L01-N16 -----
#----------------------------------------#

# Účel: Rozlišit význam a technické uložení čísel.
# Vstup: data_savci$sleep_total a vec_pocet_druhu_v_radu.
# Úkol: Pro oba objekty spusťte class() a typeof(), potom určete
# jejich statistický typ.

# Vaše řešení:


# Očekávaný výsledek: R může oba objekty popsat jako numeric/double,
# ale doba spánku je spojitá a počet druhů diskrétní proměnná.
# Nápověda 1: Technické uložení objektu a statistický význam proměnné
# jsou dvě různé otázky.
# Nápověda 2: Uložení zjistěte pomocí class() a typeof(); statistický typ
# určete podle toho, zda hodnoty vznikly měřením nebo počítáním.
# Interpretace: Proč technické uložení samo nestačí k volbě grafu?


#--------------------------------------------------#
## NAVÍC E: Chybějící hodnoty -----
#--------------------------------------------------#


#----------------------------------------#
### NAVÍC | L01-N17 -----
#----------------------------------------#

# Účel: Pozorovat vliv chybějících hodnot na výpočet.
# Vstup: data_savci$sleep_rem, který obsahuje NA.
# Úkol: Vypočítejte mean() bez argumentu na.rm a prohlédněte výsledek.

# Vaše řešení:


# Očekávaný výsledek: Funkce vrátí NA, protože alespoň jedna hodnota chybí.
# Nápověda 1: Nejdříve pozorujte výchozí chování funkce při výskytu NA.
# Nápověda 2: Zavolejte mean() s příslušným sloupcem v argumentu x
# a argument na.rm zatím nepřidávejte.
# Interpretace: Znamená NA, že průměr známých hodnot neexistuje?


#----------------------------------------#
### NAVÍC | L01-N18 -----
#----------------------------------------#

# Účel: Spočítat chybějící hodnoty a výslovně je vynechat.
# Vstup: data_savci$sleep_rem.
# Úkol: Zjistěte počet chybějících hodnot a vypočítejte průměr
# ze známých hodnot.

# Vaše řešení:


# Očekávaný výsledek: Chybí 22 hodnot; průměr 61 známých hodnot
# je přibližně 1.88 hodiny.
# Nápověda 1: Logické hodnoty TRUE lze sečíst a chybějící hodnoty
# lze při výpočtu výslovně odstranit.
# Nápověda 2: Použijte sum(is.na(...)) a v mean() nastavte na.rm = TRUE.
# Interpretace: Ke kolika druhům se vypočítaný průměr skutečně vztahuje?


#----------------------------------------#
### NAVÍC | L01-N19 -----
#----------------------------------------#

# Účel: Popsat známé hodnoty dvěma souhrny středu.
# Vstup: data_savci$sleep_rem.
# Úkol: Vypočítejte průměr a medián po vynechání NA.

# Vaše řešení:


# Očekávaný výsledek: Průměr je přibližně 1.88 hodiny,
# medián 1.5 hodiny.
# Nápověda 1: Obě míry středu musí pracovat se stejnou sadou známých hodnot.
# Nápověda 2: Použijte mean() a median() a v obou nastavte na.rm = TRUE.
# Interpretace: Co musíme uvést, aby čtenář věděl, jak jsme naložili s NA?


#--------------------------------------------------#
## NAVÍC F: Integrované výzvy -----
#--------------------------------------------------#


#----------------------------------------#
### NAVÍC | L01-N20 -----
#----------------------------------------#

# Účel: Samostatně projít celý popis jedné úplné proměnné.
# Vstup: data_savci$awake.
# Úkol: Zkontrolujte délku a NA, vytvořte vhodný graf, vypočítejte
# průměr, medián, IQR a SD a napište dvouvětou interpretaci.

# Vaše řešení:


# Očekávaný výsledek: 83 známých hodnot; průměr přibližně 13.57,
# medián 13.9 hodiny. Interpretace musí mluvit o zastoupených druzích.
# Nápověda 1: Úplnost dat a tvar rozdělení určují, jak opatrně
# budete později číst číselné souhrny.
# Nápověda 2: Začněte length() a sum(is.na(...)), potom navazujte
# postupem použitým pro vec_spanek.
# Interpretace: Která informace z grafu se nevešla do jediného souhrnu?


#----------------------------------------#
### NAVÍC | L01-N21 -----
#----------------------------------------#

# Účel: Přizpůsobit pracovní postup neúplné a silně asymetrické proměnné.
# Vstup: data_savci$brainwt.
# Úkol: Zjistěte počet známých hodnot, vytvořte graf a porovnejte
# průměr s mediánem po vynechání NA.

# Vaše řešení:


# Očekávaný výsledek: Známe 56 hodnot; průměr je přibližně 0.282 kg,
# medián přibližně 0.0124 kg a rozdělení je silně pravostranné.
# Nápověda 1: Nejdříve oddělte známé hodnoty od NA a potom posuďte
# tvar jejich rozdělení.
# Nápověda 2: Počet známých hodnot zjistěte pomocí sum(!is.na(...))
# a u mean() i median() nastavte na.rm = TRUE.
# Interpretace: Který souhrn lépe popisuje prostřední známou hodnotu a proč?


#--------------------------------------------------#
## NAVÍC G: Bezpečné hledání chyb -----
#--------------------------------------------------#


#----------------------------------------#
### NAVÍC | L01-N22 -----
#----------------------------------------#

# Účel: Rozpoznat text, který R omylem chápe jako jména objektů.
# Vstup: Následující záměrně chybný, zakomentovaný řádek.
# vec_zvirata <- c(kocka, pes, morce)
# Úkol: Přepište řádek tak, aby vznikl textový vektor tří názvů.

# Vaše řešení:


# Očekávaný výsledek: Vektor obsahuje "kocka", "pes" a "morce"
# a příkaz nevyžaduje předem existující objekty těchto jmen.
# Nápověda 1: R rozlišuje textovou hodnotu od jména objektu podle zápisu.
# Nápověda 2: Každý název uzavřete do uvozovek; funkce c() zůstává stejná.
# Interpretace: Jakou chybovou zprávu by vyvolal původní řádek?


#----------------------------------------#
### NAVÍC | L01-N23 -----
#----------------------------------------#

# Účel: Najít odkaz na objekt, který neexistuje.
# Vstup: Následující záměrně chybný, zakomentovaný řádek.
# mean(x = vec_spanek_savcu)
# Úkol: Opravte příkaz pomocí objektu vytvořeného v hlavní části.

# Vaše řešení:


# Očekávaný výsledek: Průměr je přibližně 10.43 hodiny.
# Nápověda 1: Chyba „object not found“ často znamená nesprávné jméno objektu.
# Nápověda 2: Porovnejte příkaz s Environment; správný objekt se jmenuje
# vec_spanek.
# Interpretace: Proč je přesné a stabilní pojmenování důležité?


#--------------------------------------------------#
## NAVÍC H: Reflexe nad rozhodnutími -----
#--------------------------------------------------#


#----------------------------------------#
### NAVÍC | L01-N24 -----
#----------------------------------------#

# Účel: Oddělit vlastnosti dat od rozhodnutí analytika.
# Vstup: Všechny grafy a souhrny vytvořené v tomto cvičení.
# Úkol: Zařaďte následující položky jako pozorované údaje,
# vlastnost designu či definice dat, nebo volbu analytika:
# počet pozorování, šířka intervalů histogramu, naměřená hmotnost,
# barva grafu, zvolený souhrn středu a jednotka pozorování.

# Vaše odpověď:


# Očekávaný výsledek: Počet pozorování a naměřené hmotnosti jsou údaje;
# jednotka pozorování vyplývá z designu a definice tabulky;
# šířka intervalů, barva a volba souhrnu jsou rozhodnutí analytika.
# Nápověda 1: Ptejte se, zda položka vznikla pozorováním, návrhem tabulky,
# nebo rozhodnutím při analýze.
# Nápověda 2: Naměřené hodnoty oddělte od jednotky pozorování; mezi volby
# analytika zařaďte to, co lze změnit úpravou grafu nebo souhrnu.
# Interpretace: Které analytické rozhodnutí mělo největší vliv na váš závěr?


#----------------------------------------------------------#
# Shrnutí a sebekontrola -----
#----------------------------------------------------------#

# Společnou trasu jste dokončili, pokud dokážete vlastními slovy odpovědět:
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
# úloze KONTROLA nebo si vyberte podobnou úlohu z části NAVÍC.
