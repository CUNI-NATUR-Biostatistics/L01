# L01 presentation story map — retrospective maintenance record

**Artifact:** `L01/Presentation/presentation.qmd`  
**Compiled:** 2026-10-01  
**Status:** Complete 81-slide map approved by the course author after the maintenance review and revised to include the logarithmic-axis explanation.  
**Scope decisions:** The introductory L01 opening is an approved exception to the usual opening order. PollsLive integration is intentionally deferred by the course author.

## Slide-by-slide map

| Order | Internal role | Student-facing heading | Speaker note |
|---:|---|---|---|
| 1 | Opening hook | Kolik váží „typický“ savec? | Collect quick intuitions; do not define “typical” yet. |
| 2 | Instructor introduction | Ondřej Mottl | Establish who is teaching and the ecological perspective. |
| 3 | Research context | Co mě zajímá? | Connect the course to biodiversity, data, and open science. |
| 4 | Course expectations | Co se od vás očekává? | Set expectations for participation and independent work. |
| 5 | Course navigation | Materiály najdete na webu kurzu (HUB) | Point students to the course website (HUB) and Moodle’s limited role. |
| 6 | Course format | Výuka je dobrovolná, kompetence povinné | Explain how teaching and consultation work. |
| 7 | Assessment | Zápočet a zkouška ověřují jiné dovednosti | Clarify the route through assessment. |
| 8 | Section divider | Kolik váží běžný savec? | Re-enter the motivating question with biological examples. |
| 9 | Visual pause | Bez titulku | Let the contrasting mammals carry the question visually. |
| 10 | Learning outcomes | Výsledky učení | Make the lesson destination explicit. |
| 11 | Participation routine | Jak budeme pracovat? | Introduce prediction, discussion, and revision of answers. |
| 12 | Prompt pause | Bez titulku | Give quiet thinking time before peer discussion. |
| 13 | Peer instruction | Přesvědčte souseda | Require a reason, not only a vote. |
| 14 | Deferred resolution | Odpověď zatím odložíme | Preserve the motivating uncertainty for later. |
| 15 | Section divider | Od organismu k datům | Shift from the biological question to data representation. |
| 16 | Observation unit | Začneme jedním savcem | Introduce one organism as one observation. |
| 17 | Measurement meaning | První pozorování přidá první řádek | Attach units to the recorded value. |
| 18 | Repeated observation | Další druh přidá další řádek | Extend the same structure to another species. |
| 19 | Small dataset | Čtyři druhy, čtyři řádky | Make the emerging dataset visible. |
| 20 | Data semantics | Co představuje jeden řádek? | Check that students distinguish organism, variable, and value. |
| 21 | Tabular structure | Jeden řádek = jeden zastoupený druh | Establish the row-as-observation convention. |
| 22 | Vector introduction | Jak uložíme jednu hodnotu v R? | Introduce a numeric vector as a collection of values. |
| 23 | Vector extension | Druhý řádek přidá druhou hodnotu | Add a second value of the same measured variable. |
| 24 | Representation comparison | Stejné čtyři hodnoty zapíšeme do vektoru | Connect the picture, table, and code representations. |
| 25 | Operations preview | Základní operace | Show that stored values can be summarized reproducibly. |
| 26 | Table introduction | Celá tabulka přidává další proměnné | Name the data-frame structure and its roles. |
| 27 | Section divider | Od tabulky ke grafu | Move from storage to visual exploration. |
| 28 | Need for visualization | Data přibývají druh po druhu | Motivate plots as the dataset becomes harder to scan. |
| 29 | First plot | Jak vypadá spánek všech zastoupených druhů? | Read individual values from a plot. |
| 30 | Grouped view | Stejná data, seskupená do intervalů | Notice what grouping reveals and hides. |
| 31 | Alternative geometry | Stejná data, ale jako hladký tvar | Compare a different encoding of the same values. |
| 32 | Graph choice | Který graf byste použili? | Match analytical purpose to graphical form. |
| 33 | Representation synthesis | Tři grafy, tři různé otázky | Summarize complementary views rather than rank them absolutely. |
| 34 | Section divider | Deskriptivní statistiky | Introduce compact numerical summaries. |
| 35 | Shared example | Devět druhů, devět dob spánku | Establish the visible vector reused in following calculations. |
| 36 | Minimum | Minimum (*minimum*): nejmenší pozorovaná hodnota | Identify the lower observed extreme. |
| 37 | Maximum | Maximum (*maximum*): největší pozorovaná hodnota | Identify the upper observed extreme. |
| 38 | Mean | Průměr: hodnoty sečteme a rozdělíme | Interpret the mean as a balance point. |
| 39 | Ordering | Seřadíme hodnoty a hledáme prostřední | Prepare the positional summaries. |
| 40 | Quartiles | Kvartily rozdělí seřazené hodnoty na čtvrtiny | Locate the median and quartiles. |
| 41 | IQR | IQR je šířka prostřední poloviny | Define robust spread through the middle half. |
| 42 | Contrast case | Oba soubory mají průměr 10 hodin — jsou stejné? | Motivate a separate measure of spread. |
| 43 | Deviation concept | Odchylka od průměru | Define signed distance from the mean. |
| 44 | Worked deviation | Odchylka u kočky | Calculate one concrete deviation. |
| 45 | Cancellation problem | Odchylky se navzájem vyruší | Show why signed deviations cannot simply be averaged. |
| 46 | Squaring step | Odchylky umocníme na druhou | Introduce the square of a deviation. |
| 47 | Worked square | Stejný krok rozepíšeme pro všech devět druhů | Apply the transformation across all values. |
| 48 | Sample variance | Výběrový rozptyl | Connect the sum of squares to sample variance. |
| 49 | Formula compression | Vzorec shrnuje stejný výpočet | Map the compact notation back to the worked steps. |
| 50 | Standard deviation | Směrodatná odchylka | Interpret the square root and return to the original units. |
| 51 | Applied comparison | Stejná průměrná mzda, jiné SD | Separate centre from spread in a realistic scenario. |
| 52 | Summary selection | Které souhrny patří k sobě? | Ask students to choose compatible centre-spread pairs. |
| 53 | Summary rule | Dvě užitečné dvojice | Consolidate mean-SD and median-IQR. |
| 54 | Section divider | Zpět k titulku | Return to the original biological question. |
| 55 | Outlier influence | Malý netopýr a velký slon jsou v jedné tabulce | Show how an extreme value affects summaries. |
| 56 | Revisit prediction | Vracíme se k tělesné hmotnosti | Invite revision of the opening answer. |
| 57 | Scale choice | Stejná data na logaritmické ose | Show how scale changes visual interpretation. |
| 58 | Scale explanation | Co znamená logaritmická osa? | Re-establish that equal distances encode equal ratios and note the restriction to positive values. |
| 59 | Communication comparison | Jak dvě redakce počítaly? | Return to the opening headlines and identify the mean and median behind them. |
| 60 | Statistical interpretation | Statistická redakce: opravte titulek | Emphasize transparent analytical choices. |
| 61 | Limitation | Co z tabulky smíme tvrdit? | Distinguish description from explanation and causation. |
| 62 | Section divider | Statistiky jako vizualizace | Introduce graphical encodings of summaries. |
| 63 | Boxplot centre | Správný titulek můžeme doplnit grafem | Introduce the median as the centre layer of the boxplot. |
| 64 | Boxplot middle half | Přidáme prostřední polovinu | Add the IQR as the middle half of the observations. |
| 65 | Boxplot range | Přidáme vousy | Add the outer non-outlying range. |
| 66 | Boxplot synthesis | Z bodů vznikl krabicový graf | Assemble the components into the conventional plot. |
| 67 | Information loss | Co krabice schovala? | Identify values and shape hidden by summaries. |
| 68 | Distribution shape | Houslový graf vrací tvar | Contrast boxplot and violin plot information. |
| 69 | Section divider | Typy proměnných | Shift from summaries to variable classification. |
| 70 | Classification hook | Jeden netopýr, různé typy údajů | Ground variable types in one organism record. |
| 71 | Ambiguity | Číslo 37 může znamenat čtyři různé věci | Separate numeric-looking labels from quantities. |
| 72 | Analytical consequence | Typ určuje význam a možné operace | Link variable type to valid summaries and plots. |
| 73 | Continuous variable | Doba spánku vznikla měřením | Classify a measured quantity. |
| 74 | Discrete variable | Počet druhů v řádu jsme spočítali | Classify a count. |
| 75 | Nominal variable | Typ potravy je název bez pořadí | Classify unordered categories. |
| 76 | Ordinal variable | Velikostní kategorie: lehký–střední–těžký | Classify ordered categories. |
| 77 | Retrieval practice | Určete typ proměnné | Apply the four-way classification. |
| 78 | Decision link | Od typu proměnné k prvnímu popisu | Connect classification to the next analytical choice. |
| 79 | Section divider | Závěr | Signal synthesis and closure. |
| 80 | Lesson synthesis | Shrnutí | Reassemble the main conceptual chain. |
| 81 | Forward bridge | Co potřebujete vědět, než řeknete „typický“? | State preparation and point toward the next lesson. |

## Knowledge-state ledger

| Slides | Students can now… | Deliberately not assumed yet |
|---|---|---|
| 1–7 | navigate the course and state the motivating question | a statistical definition of “typical” |
| 8–14 | articulate competing intuitive answers and justify a prediction | a preferred summary statistic |
| 15–26 | distinguish observation, variable, value, vector, and data frame | distributional reasoning |
| 27–33 | explain that different plots answer different questions | formal numerical summaries |
| 34–41 | calculate and interpret minimum, maximum, mean, median, quartiles, and IQR | variance and SD |
| 42–51 | explain deviation, squared deviation, sample variance, and SD | a universal best centre-spread pair |
| 52–53 | pair mean with SD and median with IQR in context | causal interpretation |
| 54–61 | revisit “typical,” explain the ratio logic of a logarithmic axis, and qualify a statistical claim | explanation of biological mechanisms |
| 62–68 | read boxplots and violin plots and name what each hides or reveals | inferential statistics |
| 69–78 | classify continuous, discrete, nominal, and ordinal variables and connect type to analysis | formal hypothesis testing |
| 79–81 | summarize the data-to-description workflow and identify the next preparation step | content reserved for later lessons |

## Human confirmation

- Approver: Ondřej Mottl
- Date: 2026-10-01
- Decision: approved
- Requested revisions: add one explanatory slide after the logarithmic-axis graph, restore the opening headlines on the following comparison slide, centre the research illustrations, and correct the practical duration to 120 minutes
