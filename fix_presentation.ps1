# Fix all Czech typos and FFFD corruption in presentation.qmd
$file = 'd:\GITHUB\CUNI-NATUR-Biostatistics\L-example\Presentation\presentation.qmd'
$f = [char]0xFFFD

$text = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

function Rep($t, $old, $new) { 
    $result = $t.Replace($old, $new)
    if ($result -eq $t) { Write-Warning "NO MATCH: [$old]" }
    return $result
}

# ── HEADINGS (already partially fixed, but clean up any remaining) ──────────
$text = Rep $text "## Výsledky ucení" "## Výsledky učení"

# ── FIXES FOR WRONG-BUT-VALID UNICODE CHARS (no FFFD) ──────────────────────
# Line 124
$text = Rep $text "Vydíme se na louku a začneme sbírat kopretiny." "Vydáme se na louku a začneme sbírat kopretiny."

# ── SLIDE TEXT: Kopretiny data collection (5 variants) ─────────────────────
# Version 1 (line 136): počet and okvetních already correct, but FFFD in lístků/Můžeme/mít
$old1 = "Zapisujeme jsi po" + [char]0x010D + "et okvetn" + [char]0x00ED + "ch l" + $f + "stku u kopretiny. Mu" + $f + "eme m" + $f + "t 5, 6, 7, 8, ... l" + $f + "stku."
$new1 = "Zapisujeme si po" + [char]0x010D + "et okv" + [char]0x011B + "tn" + [char]0x00ED + "ch l" + [char]0x00ED + "stk" + [char]0x016F + " u kopretiny. M" + [char]0x016F + [char]0x017E + "eme m" + [char]0x00ED + "t 5, 6, 7, 8, ... l" + [char]0x00ED + "stk" + [char]0x016F + "."
$text = Rep $text $old1 $new1

# Version 2 (lines 147/156/166/177): pocet and okvetn+FFFD+ch, with trailing spaces
$old2 = "Zapisujeme jsi pocet okvetn" + $f + "ch l" + $f + "stku u kopretiny. Mu" + $f + "eme m" + $f + "t 5, 6, 7, 8, ... l" + $f + "stku."
$new2 = "Zapisujeme si po" + [char]0x010D + "et okv" + [char]0x011B + "tn" + [char]0x00ED + "ch l" + [char]0x00ED + "stk" + [char]0x016F + " u kopretiny. M" + [char]0x016F + [char]0x017E + "eme m" + [char]0x00ED + "t 5, 6, 7, 8, ... l" + [char]0x00ED + "stk" + [char]0x016F + "."
$text = Rep $text $old2 $new2

# Table headers
$old_tbl = "| Kvetina | Pocet l" + $f + "stku |"
$new_tbl = "| Kv" + [char]0x011B + "tina | Po" + [char]0x010D + "et l" + [char]0x00ED + "stk" + [char]0x016F + " |"
$text = Rep $text $old_tbl $new_tbl

# ── 100 kopretiny slides ────────────────────────────────────────────────────
$old_nasb = "Nasb" + $f + "rali jsme 100 kopretin a zapsali pocet l" + $f + "stku u ka" + $f + "d" + $f + " z nich."
$new_nasb = "Nasb" + [char]0x00ED + "rali jsme 100 kopretin a zapsali po" + [char]0x010D + "et l" + [char]0x00ED + "stk" + [char]0x016F + " u ka" + [char]0x017E + "d" + [char]0x00E9 + " z nich."
$text = Rep $text $old_nasb $new_nasb

# ── R code: plot labels ─────────────────────────────────────────────────────
$old_ylab = 'y = "Pocet okvetn' + $f + 'ch l' + $f + 'stku"'
$new_ylab = 'y = "Po' + [char]0x010D + 'et okv' + [char]0x011B + 'tn' + [char]0x00ED + 'ch l' + [char]0x00ED + 'stk' + [char]0x016F + '"'
$text = Rep $text $old_ylab $new_ylab

$old_ylab2 = 'y = "Pocet okvetn' + $f + 'ch l' + $f + 'stku",'
$new_ylab2 = 'y = "Po' + [char]0x010D + 'et okv' + [char]0x011B + 'tn' + [char]0x00ED + 'ch l' + [char]0x00ED + 'stk' + [char]0x016F + '",'
$text = Rep $text $old_ylab2 $new_ylab2

$old_xlab = 'x = "Pocet okvetn' + $f + 'ch l' + $f + 'stku",'
$new_xlab = 'x = "Po' + [char]0x010D + 'et okv' + [char]0x011B + 'tn' + [char]0x00ED + 'ch l' + [char]0x00ED + 'stk' + [char]0x016F + '",'
$text = Rep $text $old_xlab $new_xlab

$old_xlab2 = 'x = "Pocet okvetn' + $f + 'ch l' + $f + 'stku"'
$new_xlab2 = 'x = "Po' + [char]0x010D + 'et okv' + [char]0x011B + 'tn' + [char]0x00ED + 'ch l' + [char]0x00ED + 'stk' + [char]0x016F + '"'
$text = Rep $text $old_xlab2 $new_xlab2

$old_title_nasb = 'title = stringr::str_glue("Pocet nasb' + $f + 'ran' + $f + 'ch kopretin: {i}")'
$new_title_nasb = 'title = stringr::str_glue("Po' + [char]0x010D + 'et nasb' + [char]0x00ED + 'ran' + [char]0x00FD + 'ch kopretin: {i}")'
$text = Rep $text $old_title_nasb $new_title_nasb

# ── Nyní máme data ─────────────────────────────────────────────────────────
$old_nyn = "Nyn" + $f + " m" + $f + "me data. Jak je **vizualizovat**?"
$new_nyn = "Nyn" + [char]0x00ED + " m" + [char]0x00E1 + "me data. Jak je **vizualizovat**?"
$text = Rep $text $old_nyn $new_nyn

# ── Bodový graf text ────────────────────────────────────────────────────────
$old_beeswarm = "Ka" + $f + "d" + $f + " bod = jedna kopretina. Vid" + $f + "me **v" + $f + "echna data** najednou."
$new_beeswarm = "Ka" + [char]0x017E + "d" + [char]0x00FD + " bod = jedna kopretina. Vid" + [char]0x00ED + "me **v" + [char]0x0161 + "echna data** najednou."
$text = Rep $text $old_beeswarm $new_beeswarm

# ── Histogram text ──────────────────────────────────────────────────────────
# "Skupinujeme kopretiny do ?košů?" according poctu lístků. Výška..."
$old_hist = "Skupinujeme kopretiny do " + $f + "ko" + $f + "u" + [char]0x22 + " podle poctu l" + $f + "stku. V" + $f + $f + "ka sloupce = pocet kopretin v dan" + $f + "m ko" + $f + "u."
$new_hist = "Skupinujeme kopretiny do " + [char]0x201E + "ko" + [char]0x0161 + [char]0x016F + [char]0x201C + " podle po" + [char]0x010D + "tu l" + [char]0x00ED + "stk" + [char]0x016F + ". V" + [char]0x00FD + [char]0x0161 + "ka sloupce = po" + [char]0x010D + "et kopretin v dan" + [char]0x00E9 + "m ko" + [char]0x0161 + "i."
$text = Rep $text $old_hist $new_hist

# ── Graf hustoty text ───────────────────────────────────────────────────────
$old_den = "Graf hustoty (density plot) je " + $f + "vyhlazen" + $f + [char]0x22 + " histogram " + $f + " neukazuje pocty, ale **relativn" + $f + " " + "cetnost** hodnot."
$new_den = "Graf hustoty (density plot) je " + [char]0x201E + "vyhlazen" + [char]0x00FD + [char]0x201C + " histogram " + [char]0x2013 + " neukazuje po" + [char]0x010D + "ty, ale **relativn" + [char]0x00ED + " " + [char]0x010D + "etnost** hodnot."
$text = Rep $text $old_den $new_den

# ── Minimum/Maximum texts ───────────────────────────────────────────────────
$old_min_text = "Minimum n" + $f + "m r" + $f + "k" + $f + ", kolik l" + $f + "stku mela ta kopretina s nejmen" + $f + $f + "m poctem l" + $f + "stku."
$new_min_text = "Minimum n" + [char]0x00E1 + "m " + [char]0x0159 + [char]0x00ED + "k" + [char]0x00E1 + ", kolik l" + [char]0x00ED + "stk" + [char]0x016F + " m" + [char]0x011B + "la ta kopretina s nejmen" + [char]0x0161 + [char]0x00ED + "m po" + [char]0x010D + "tem l" + [char]0x00ED + "stk" + [char]0x016F + "."
$text = Rep $text $old_min_text $new_min_text

$old_min_lab = '"Minimum l' + $f + 'stku: {min(pocet_listku)}"'
$new_min_lab = '"Minimum l' + [char]0x00ED + 'stk' + [char]0x016F + ': {min(pocet_listku)}"'
$text = Rep $text $old_min_lab $new_min_lab

$old_max_text = "Maximum n" + $f + "m r" + $f + "k" + $f + ", kolik l" + $f + "stku mela ta kopretina s nejvet" + $f + $f + "m poctem l" + $f + "stku."
$new_max_text = "Maximum n" + [char]0x00E1 + "m " + [char]0x0159 + [char]0x00ED + "k" + [char]0x00E1 + ", kolik l" + [char]0x00ED + "stk" + [char]0x016F + " m" + [char]0x011B + "la ta kopretina s nejv" + [char]0x011B + "t" + [char]0x0161 + [char]0x00ED + "m po" + [char]0x010D + "tem l" + [char]0x00ED + "stk" + [char]0x016F + "."
$text = Rep $text $old_max_text $new_max_text

$old_max_lab = '"Maximum l' + $f + 'stku: {max(pocet_listku)}"'
$new_max_lab = '"Maximum l' + [char]0x00ED + 'stk' + [char]0x016F + ': {max(pocet_listku)}"'
$text = Rep $text $old_max_lab $new_max_lab

# ── Percentil text ──────────────────────────────────────────────────────────
$old_perc = "Percentil r" + $f + "k" + $f + ", jakou hodnotu nepresahuje dan" + $f + " procento dat."
$new_perc = "Percentil " + [char]0x0159 + [char]0x00ED + "k" + [char]0x00E1 + ", jakou hodnotu nep" + [char]0x0159 + "esahuje dan" + [char]0x00E9 + " procento dat."
$text = Rep $text $old_perc $new_perc

$old_perc50 = "- **50. percentil** = polovina kopretin m" + $f + " m" + $f + "ne, polovina v" + $f + "ce"
$new_perc50 = "- **50. percentil** = polovina kopretin m" + [char]0x00E1 + " m" + [char]0x00E9 + [char]0x0148 + "e, polovina v" + [char]0x00ED + "ce"
$text = Rep $text $old_perc50 $new_perc50

$old_perc_sum = "Percentily rozdeluj" + $f + " data na c" + $f + "sti " + $f + " 25. a 75. percentil jsou zvl" + $f + "te dule" + $f + "it" + $f + "."
$new_perc_sum = "Percentily rozd" + [char]0x011B + "luj" + [char]0x00ED + " data na " + [char]0x010D + "sti " + [char]0x2013 + " 25. a 75. percentil jsou zvl" + [char]0x00E1 + [char]0x0161 + "t" + [char]0x011B + " d" + [char]0x016F + "le" + [char]0x017E + "it" + [char]0x00E9 + "."
$text = Rep $text $old_perc_sum $new_perc_sum

# ── Medián section ──────────────────────────────────────────────────────────
$old_median_h = "### Medi" + $f + "n"
$new_median_h = "### Medi" + [char]0x00E1 + "n"
$text = Rep $text $old_median_h $new_median_h

$old_median_t = "Medi" + $f + "n je **50. percentil** " + $f + " polovina kopretin m" + $f + " m" + $f + "ne l" + $f + "stku, polovina v" + $f + "ce."
$new_median_t = "Medi" + [char]0x00E1 + "n je **50. percentil** " + [char]0x2013 + " polovina kopretin m" + [char]0x00E1 + " m" + [char]0x00E9 + [char]0x0148 + "e l" + [char]0x00ED + "stk" + [char]0x016F + ", polovina v" + [char]0x00ED + "ce."
$text = Rep $text $old_median_t $new_median_t

$old_median_lab = '"Medi' + $f + 'n l' + $f + 'stku: {median(pocet_listku)}"'
$new_median_lab = '"Medi' + [char]0x00E1 + 'n l' + [char]0x00ED + 'stk' + [char]0x016F + ': {median(pocet_listku)}"'
$text = Rep $text $old_median_lab $new_median_lab

# ── IQR section ─────────────────────────────────────────────────────────────
$old_iqr_t = "IQR = Q3 - Q1 " + $f + " rozpet" + $f + " prostredn" + $f + " poloviny dat."
$new_iqr_t = "IQR = Q3 - Q1 " + [char]0x2013 + " rozp" + [char]0x011B + "t" + [char]0x00ED + " prost" + [char]0x0159 + "edn" + [char]0x00ED + " poloviny dat."
$text = Rep $text $old_iqr_t $new_iqr_t

$old_iqr_bq = "IQR je odoln" + $f + " vuci odlehl" + $f + "m hodnot" + $f + "m " + $f + " popisuje **prostredn" + $f + " 50 %** dat."
$new_iqr_bq = "IQR je odoln" + [char]0x00FD + " v" + [char]0x016F + [char]0x010D + "i odlehl" + [char]0x00FD + "m hodnot" + [char]0x00E1 + "m " + [char]0x2013 + " popisuje **prost" + [char]0x0159 + "edn" + [char]0x00ED + " 50 %** dat."
$text = Rep $text $old_iqr_bq $new_iqr_bq

# ── Průměr section ──────────────────────────────────────────────────────────
$old_prumer_t = "Prumer (mean) n" + $f + "m r" + $f + "k" + $f + ", jak" + $f + " je typick" + $f + " hodnota poctu l" + $f + "stku pres v" + $f + "echny kopretiny."
$new_prumer_t = "Pr" + [char]0x016F + "m" + [char]0x011B + "r (mean) n" + [char]0x00E1 + "m " + [char]0x0159 + [char]0x00ED + "k" + [char]0x00E1 + ", jak" + [char]0x00E1 + " je typick" + [char]0x00E1 + " hodnota po" + [char]0x010D + "tu l" + [char]0x00ED + "stk" + [char]0x016F + " p" + [char]0x0159 + "es v" + [char]0x0161 + "echny kopretiny."
$text = Rep $text $old_prumer_t $new_prumer_t

$old_prumer_lab = '"Prumer l' + $f + 'stku: {round(mean(pocet_listku), 1)}"'
$new_prumer_lab = '"Pr' + [char]0x016F + 'm' + [char]0x011B + 'r l' + [char]0x00ED + 'stk' + [char]0x016F + ': {round(mean(pocet_listku), 1)}"'
$text = Rep $text $old_prumer_lab $new_prumer_lab

# ── Průměr vs. Medián ───────────────────────────────────────────────────────
$old_pvm_t = "Prumer a medi" + $f + "n mohou b" + $f + "t velmi odli" + $f + "n" + $f + ", pokud jsou v datech **odlehl" + $f + " hodnoty** (outliers)."
$new_pvm_t = "Pr" + [char]0x016F + "m" + [char]0x011B + "r a medi" + [char]0x00E1 + "n mohou b" + [char]0x00FD + "t velmi odli" + [char]0x0161 + "n" + [char]0x00E9 + ", pokud jsou v datech **odlehl" + [char]0x00E9 + " hodnoty** (outliers)."
$text = Rep $text $old_pvm_t $new_pvm_t

$old_kopretina50 = "Co kdybychom sebrali opravdu divnou kopretinu s 50 l" + $f + "stky?"
$new_kopretina50 = "Co kdybychom sebrali opravdu divnou kopretinu s 50 l" + [char]0x00ED + "stky?"
$text = Rep $text $old_kopretina50 $new_kopretina50

$old_bez_out = "**Bez odlehl" + $f + " hodnoty**"
$new_bez_out = "**Bez odlehl" + [char]0x00E9 + " hodnoty**"
$text = Rep $text $old_bez_out $new_bez_out

$old_prumer_cit = "Prumer je citliv" + $f + " na odlehl" + $f + " hodnoty. Medi" + $f + "n je odolnej" + $f + $f + " " + $f + " popisuje " + $f + "typick" + $f + [char]0x22 + " pr" + $f + "pad l" + $f + "pe, pokud data nejsou symetrick" + $f + "."
$new_prumer_cit = "Pr" + [char]0x016F + "m" + [char]0x011B + "r je citliv" + [char]0x00FD + " na odlehl" + [char]0x00E9 + " hodnoty. Medi" + [char]0x00E1 + "n je odolnej" + [char]0x0161 + [char]0x00ED + " " + [char]0x2013 + " popisuje " + [char]0x201E + "typick" + [char]0x00FD + [char]0x201C + " p" + [char]0x0159 + [char]0x00ED + "pad l" + [char]0x00E9 + "pe, pokud data nejsou symetrick" + [char]0x00E1 + "."
$text = Rep $text $old_prumer_cit $new_prumer_cit

# ── SD section ──────────────────────────────────────────────────────────────
$old_minmax = "Min, max, prumer a medi" + $f + "n n" + $f + "m r" + $f + "kaj" + $f + ", kde jsou data. Ale jak moc jsou data **rozpt" + $f + "lena**?"
$new_minmax = "Min, max, pr" + [char]0x016F + "m" + [char]0x011B + "r a medi" + [char]0x00E1 + "n n" + [char]0x00E1 + "m " + [char]0x0159 + [char]0x00ED + "kaj" + [char]0x00ED + ", kde jsou data. Ale jak moc jsou data **rozpt" + [char]0x00FD + "lena**?"
$text = Rep $text $old_minmax $new_minmax

$old_smod = "Smerodatn" + $f + " odchylka (standard deviation) n" + $f + "m r" + $f + "k" + $f + ", jak daleko jsou typicky hodnoty od prumeru."
$new_smod = "Sm" + [char]0x011B + "rodatn" + [char]0x00E1 + " odchylka (standard deviation) n" + [char]0x00E1 + "m " + [char]0x0159 + [char]0x00ED + "k" + [char]0x00E1 + ", jak daleko jsou typicky hodnoty od pr" + [char]0x016F + "m" + [char]0x011B + "ru."
$text = Rep $text $old_smod $new_smod

$old_rozptyl = "Rozptyl (variance) = SD" + $f + ". V praxi se vet" + $f + "inou pou" + $f + $f + "v" + $f + " SD " + $f + " je ve stejn" + $f + "ch jednotk" + $f + "ch jako data."
$new_rozptyl = "Rozptyl (variance) = SD" + [char]0x00B2 + ". V praxi se v" + [char]0x011B + "t" + [char]0x0161 + "inou pou" + [char]0x017E + [char]0x00ED + "v" + [char]0x00E1 + " SD " + [char]0x2013 + " je ve stejn" + [char]0x00FD + "ch jednotk" + [char]0x00E1 + "ch jako data."
$text = Rep $text $old_rozptyl $new_rozptyl

# ── Proč je SD důležité? ────────────────────────────────────────────────────
$old_dve = "Dve skupiny kopretin mohou m" + $f + "t **stejn" + $f + " prumer**, ale velmi **ruzne rozpt" + $f + "len" + $f + "** data."
$new_dve = "Dv" + [char]0x011B + " skupiny kopretin mohou m" + [char]0x00ED + "t **stejn" + [char]0x00FD + " pr" + [char]0x016F + "m" + [char]0x011B + "r**, ale velmi **r" + [char]0x016F + "zn" + [char]0x011B + " rozpt" + [char]0x00FD + "len" + [char]0x00E1 + "** data."
$text = Rep $text $old_dve $new_dve

$old_prumer_comm = "mean_val <- 8  # pevn" + $f + " prumer pro obe skupiny"
$new_prumer_comm = "mean_val <- 8  # pevn" + [char]0x00FD + " pr" + [char]0x016F + "m" + [char]0x011B + "r pro obe skupiny"
$text = Rep $text $old_prumer_comm $new_prumer_comm

$old_mala_sd = 'skupina = "Mal' + $f + ' SD"'
$new_mala_sd = 'skupina = "Mal' + [char]0x00E9 + ' SD"'
$text = Rep $text $old_mala_sd $new_mala_sd

$old_velka_sd = 'skupina = "Velk' + $f + ' SD"'
$new_velka_sd = 'skupina = "Velk' + [char]0x00E9 + ' SD"'
$text = Rep $text $old_velka_sd $new_velka_sd

$old_prumer_stejn = '"Prumer je stejn' + $f + ', SD se li' + $f + $f + '"'
$new_prumer_stejn = '"Pr' + [char]0x016F + 'm' + [char]0x011B + 'r je stejn' + [char]0x00FD + ', SD se li' + [char]0x0161 + [char]0x00ED + '"'
$text = Rep $text $old_prumer_stejn $new_prumer_stejn

# Blockquote: Stejný průměr ≠ stejná data...
$old_neq = "Stejn" + $f + " prumer ? stejn" + $f + " data. Smerodatn" + $f + " odchylka n" + $f + "m r" + $f + "k" + $f + ", jak moc jsou data " + $f + "rozta" + $f + "en" + $f + [char]0x22 + "."
$new_neq = "Stejn" + [char]0x00FD + " pr" + [char]0x016F + "m" + [char]0x011B + "r " + [char]0x2260 + " stejn" + [char]0x00E1 + " data. Sm" + [char]0x011B + "rodatn" + [char]0x00E1 + " odchylka n" + [char]0x00E1 + "m " + [char]0x0159 + [char]0x00ED + "k" + [char]0x00E1 + ", jak moc jsou data " + [char]0x201E + "rozta" + [char]0x017E + "en" + [char]0x00E1 + [char]0x201C + "."
$text = Rep $text $old_neq $new_neq

# ── Od statistik ke grafu ───────────────────────────────────────────────────
$old_odstat = "Prumer " + $f + " SD jsme videli jako c" + $f + "sla a jako p" + $f + "smo na grafu."
$new_odstat = "Pr" + [char]0x016F + "m" + [char]0x011B + "r " + [char]0x2013 + " SD jsme vid" + [char]0x011B + "li jako " + [char]0x010D + [char]0x00ED + "sla a jako p" + [char]0x00E1 + "smo na grafu."
$text = Rep $text $old_odstat $new_odstat

$old_ylab_prumer = 'y = "Pocet okvetn' + $f + 'ch l' + $f + 'stku",'
$new_ylab_prumer = 'y = "Po' + [char]0x010D + 'et okv' + [char]0x011B + 'tn' + [char]0x00ED + 'ch l' + [char]0x00ED + 'stk' + [char]0x016F + '",'
$text = Rep $text $old_ylab_prumer $new_ylab_prumer

# ── Boxplot sections ─────────────────────────────────────────────────────────
$old_zacneme = "Zacneme s t" + $f + "m, co u" + $f + " zn" + $f + "me: **medi" + $f + "n**."
$new_zacneme = "Za" + [char]0x010D + "neme s t" + [char]0x00ED + "m, co u" + [char]0x017E + " zn" + [char]0x00E1 + "me: **medi" + [char]0x00E1 + "n**."
$text = Rep $text $old_zacneme $new_zacneme

$old_median_bp = '"Medi' + $f + 'n: {med_val}"'
$new_median_bp = '"Medi' + [char]0x00E1 + 'n: {med_val}"'
$text = Rep $text $old_median_bp $new_median_bp

$old_pridat_iqr = "Prid" + $f + "me **mezikvartilov" + $f + " rozpet" + $f + "** (IQR): od 25. do 75. percentilu."
$new_pridat_iqr = "P" + [char]0x0159 + "id" + [char]0x00E1 + "me **mezikvartilv" + [char]0x00E9 + " rozp" + [char]0x011B + "t" + [char]0x00ED + "** (IQR): od 25. do 75. percentilu."
# NOTE: 'mezikvartilové' correction
$new_pridat_iqr = "P" + [char]0x0159 + "id" + [char]0x00E1 + "me **mezikvartilove rozp" + [char]0x011B + "t" + [char]0x00ED + "** (IQR): od 25. do 75. percentilu."
$new_pridat_iqr = "P" + [char]0x0159 + "id" + [char]0x00E1 + "me **mezikvartilov" + [char]0x00E9 + " rozp" + [char]0x011B + "t" + [char]0x00ED + "** (IQR): od 25. do 75. percentilu."
$text = Rep $text $old_pridat_iqr $new_pridat_iqr

$old_median_krok2 = '"Medi' + $f + 'n: {med_val},  Q1: {q1_val},  Q3: {q3_val},  IQR: {q3_val - q1_val}"'
$new_median_krok2 = '"Medi' + [char]0x00E1 + 'n: {med_val},  Q1: {q1_val},  Q3: {q3_val},  IQR: {q3_val - q1_val}"'
$text = Rep $text $old_median_krok2 $new_median_krok2

$old_pridat_vousy = "Prid" + $f + "me **vousy** (1,5" + $f + " IQR od krabice) a **odlehl" + $f + " hodnoty** (body mimo vousy)."
$new_pridat_vousy = "P" + [char]0x0159 + "id" + [char]0x00E1 + "me **vousy** (1,5" + [char]0x00D7 + " IQR od krabice) a **odlehl" + [char]0x00E9 + " hodnoty** (body mimo vousy)."
$text = Rep $text $old_pridat_vousy $new_pridat_vousy

$old_median_krok3 = '"Medi' + $f + 'n + IQR + vousy + odlehl' + $f + ' hodnoty"'
$new_median_krok3 = '"Medi' + [char]0x00E1 + 'n + IQR + vousy + odlehl' + [char]0x00E9 + ' hodnoty"'
$text = Rep $text $old_median_krok3 $new_median_krok3

$old_tlusta = "- Tlust" + $f + " c" + $f + "ra = **medi" + $f + "n**"
$new_tlusta = "- Tlust" + [char]0x00E1 + " " + [char]0x010D + [char]0x00E1 + "ra = **medi" + [char]0x00E1 + "n**"
$text = Rep $text $old_tlusta $new_tlusta

$old_krabice = "- Krabice = **IQR** (Q1" + $f + "Q3)"
$new_krabice = "- Krabice = **IQR** (Q1" + [char]0x2013 + "Q3)"
$text = Rep $text $old_krabice $new_krabice

$old_vousy = "- Vousy = 1,5" + $f + " IQR od krabice"
$new_vousy = "- Vousy = 1,5" + [char]0x00D7 + " IQR od krabice"
$text = Rep $text $old_vousy $new_vousy

$old_body = "- Body = **odlehl" + $f + " hodnoty**"
$new_body = "- Body = **odlehl" + [char]0x00E9 + " hodnoty**"
$text = Rep $text $old_body $new_body

$old_toto = "*Toto je standardn" + $f + " ggplot2 boxplot " + $f + " tot" + $f + ", akor" + $f + "t nakreslen" + $f + " automaticky.*"
$new_toto = "*Toto je standardn" + [char]0x00ED + " ggplot2 boxplot " + [char]0x2013 + " tot" + [char]0x00E9 + [char]0x017E + ", akor" + [char]0x00E1 + "t nakreslen" + [char]0x00FD + " automaticky.*"
$text = Rep $text $old_toto $new_toto

$old_vidime = "Boxplot + beeswarm dohromady: vid" + $f + "me statistiky i ka" + $f + "d" + $f + " jednotliv" + $f + " bod."
$new_vidime = "Boxplot + beeswarm dohromady: vid" + [char]0x00ED + "me statistiky i ka" + [char]0x017E + "d" + [char]0x00FD + " jednotliv" + [char]0x00FD + " bod."
$text = Rep $text $old_vidime $new_vidime

$old_boxplot_bq = "Boxplot nen" + $f + " nov" + $f + " koncept " + $f + " je to jen statistiky, kter" + $f + " zn" + $f + "te, nakreslen" + $f + " jako tvar."
$new_boxplot_bq = "Boxplot nen" + [char]0x00ED + " nov" + [char]0x00FD + " koncept " + [char]0x2013 + " je to jen statistiky, kter" + [char]0x00E9 + " zn" + [char]0x00E1 + "te, nakreslen" + [char]0x00FD + " jako tvar."
$text = Rep $text $old_boxplot_bq $new_boxplot_bq

# ── Typy proměnných: R code comments ────────────────────────────────────────
$old_spojita = "# Spojit" + $f + ": d" + $f + "lka okvetn" + $f + "ho l" + $f + "stku v mm"
$new_spojita = "# Spojit" + [char]0x00E1 + ": d" + [char]0x00E9 + "lka okv" + [char]0x011B + "tn" + [char]0x00ED + "ho l" + [char]0x00ED + "stku v mm"
$text = Rep $text $old_spojita $new_spojita

$old_nominal = "# Nomin" + $f + "ln" + $f + ": barva kvetu"
$new_nominal = "# Nomin" + [char]0x00E1 + "ln" + [char]0x00ED + ": barva kvetu"
$text = Rep $text $old_nominal $new_nominal

$old_barvy_data = 'c("' + $f + 'ed' + $f + '", "' + $f + 'lut' + $f + '", "fialov' + $f + '"),'
$new_barvy_data = 'c("' + [char]0x0161 + 'ed' + [char]0x00E1 + '", "' + [char]0x017E + 'lut' + [char]0x00E1 + '", "fialov' + [char]0x00E1 + '"),'
$text = Rep $text $old_barvy_data $new_barvy_data

$old_ordinal = "# Ordin" + $f + "ln" + $f + ": stupen po" + $f + "kozen" + $f + " listu"
$new_ordinal = "# Ordin" + [char]0x00E1 + "ln" + [char]0x00ED + ": stupe" + [char]0x0148 + " po" + [char]0x0161 + "kozen" + [char]0x00ED + " listu"
$text = Rep $text $old_ordinal $new_ordinal

$old_levels_data = 'c("0 - ' + $f + $f + 'dn' + $f + '", "1 - m' + $f + 'rn' + $f + '", "2 - stredn' + $f + '", "3 - siln' + $f + '"),'
$new_levels_data = 'c("0 - ' + [char]0x017E + [char]0x00E1 + 'dn' + [char]0x00E9 + '", "1 - m' + [char]0x00ED + 'rn' + [char]0x00E9 + '", "2 - st' + [char]0x0159 + 'edn' + [char]0x00ED + '", "3 - siln' + [char]0x00E9 + '"),'
$text = Rep $text $old_levels_data $new_levels_data

$old_levels_factor = 'levels = c("0 - ' + $f + $f + 'dn' + $f + '", "1 - m' + $f + 'rn' + $f + '", "2 - stredn' + $f + '", "3 - siln' + $f + '"),'
$new_levels_factor = 'levels = c("0 - ' + [char]0x017E + [char]0x00E1 + 'dn' + [char]0x00E9 + '", "1 - m' + [char]0x00ED + 'rn' + [char]0x00E9 + '", "2 - st' + [char]0x0159 + 'edn' + [char]0x00ED + '", "3 - siln' + [char]0x00E9 + '"),'
$text = Rep $text $old_levels_factor $new_levels_factor

# ── Kvantitativní – diskrétní slide ─────────────────────────────────────────
$old_pocet_listku_b = "- pocet okvetn" + $f + "ch l" + $f + "stku u kopretiny"
$new_pocet_listku_b = "- po" + [char]0x010D + "et okv" + [char]0x011B + "tn" + [char]0x00ED + "ch l" + [char]0x00ED + "stk" + [char]0x016F + " u kopretiny"
$text = Rep $text $old_pocet_listku_b $new_pocet_listku_b

$old_ptaku = "- pocet druhu pt" + $f + "ku na lokalite"
$new_ptaku = "- po" + [char]0x010D + "et druh" + [char]0x016F + " pt" + [char]0x00E1 + "k" + [char]0x016F + " na lokalit" + [char]0x011B
$text = Rep $text $old_ptaku $new_ptaku

$old_planety = "- pocet planet ve Slunecn" + $f + " soustave"
$new_planety = "- po" + [char]0x010D + "et planet ve Slune" + [char]0x010D + "n" + [char]0x00ED + " soustav" + [char]0x011B
$text = Rep $text $old_planety $new_planety

$old_celocis = "Promenn" + $f + " nab" + $f + "vaj" + $f + "c" + $f + " pouze **celoc" + $f + "seln" + $f + "ch** hodnot " + $f + " nelze m" + $f + "t 7,3 stromu."
$new_celocis = "Prom" + [char]0x011B + "nn" + [char]0x00E1 + " nab" + [char]0x00FD + "vaj" + [char]0x00ED + "c" + [char]0x00ED + " pouze **celo" + [char]0x010D + [char]0x00ED + "seln" + [char]0x00FD + "ch** hodnot " + [char]0x2013 + " nelze m" + [char]0x00ED + "t 7,3 stromu."
$text = Rep $text $old_celocis $new_celocis

$old_cela_cisla = "c(8L, 6L, 7L, 8L) # cel" + $f + " c" + $f + "sla"
$new_cela_cisla = "c(8L, 6L, 7L, 8L) # cel" + [char]0x00E1 + " " + [char]0x010D + [char]0x00ED + "sla"
$text = Rep $text $old_cela_cisla $new_cela_cisla

# ── Kvantitativní – spojitá slide ────────────────────────────────────────────
$old_delka_b = "- d" + $f + "lka okvetn" + $f + "ho l" + $f + "stku v mm"
$new_delka_b = "- d" + [char]0x00E9 + "lka okv" + [char]0x011B + "tn" + [char]0x00ED + "ho l" + [char]0x00ED + "stku v mm"
$text = Rep $text $old_delka_b $new_delka_b

$old_mnozstvi = "- mno" + $f + "stv" + $f + " sr" + $f + "ek"
$new_mnozstvi = "- mno" + [char]0x017E + "stv" + [char]0x00ED + " sr" + [char]0x00E1 + [char]0x017E + "ek"
$text = Rep $text $old_mnozstvi $new_mnozstvi

$old_hmotnost = "- hmotnost zv" + $f + "rete"
$new_hmotnost = "- hmotnost zv" + [char]0x00ED + [char]0x0159 + "ete"
$text = Rep $text $old_hmotnost $new_hmotnost

$old_jakekoli = "Promenn" + $f + " nab" + $f + "vaj" + $f + "c" + $f + " **jak" + $f + "koli hodnoty** v intervalu " + $f + " d" + $f + "lka mu" + $f + "e b" + $f + "t 24,7 mm nebo 25,13"
$new_jakekoli = "Prom" + [char]0x011B + "nn" + [char]0x00E1 + " nab" + [char]0x00FD + "vaj" + [char]0x00ED + "c" + [char]0x00ED + " **jak" + [char]0x00E9 + "koli hodnoty** v intervalu " + [char]0x2013 + " d" + [char]0x00E9 + "lka m" + [char]0x016F + [char]0x017E + "e b" + [char]0x00FD + "t 24,7 mm nebo 25,13"
$text = Rep $text $old_jakekoli $new_jakekoli

$old_desetinna = "c(24.7, 25.1, 23.5, 26.8) # desetinn" + $f + " c" + $f + "sla"
$new_desetinna = "c(24.7, 25.1, 23.5, 26.8) # desetinn" + [char]0x00E1 + " " + [char]0x010D + [char]0x00ED + "sla"
$text = Rep $text $old_desetinna $new_desetinna

$old_ruzne = "Ruzn" + $f + " vizualizace odhaluj" + $f + " ruzn" + $f + " vlastnosti dat."
$new_ruzne = "R" + [char]0x016F + "zn" + [char]0x00E9 + " vizualizace odhaluj" + [char]0x00ED + " r" + [char]0x016F + "zn" + [char]0x00E9 + " vlastnosti dat."
$text = Rep $text $old_ruzne $new_ruzne

$old_delka_lab = 'x = "D' + $f + 'lka l' + $f + 'stku (mm)",'
$new_delka_lab = 'x = "D' + [char]0x00E9 + 'lka l' + [char]0x00ED + 'stku (mm)",'
$text = Rep $text $old_delka_lab $new_delka_lab

$old_bodovy_title = '"Bodov' + $f + ' graf"'
$new_bodovy_title = '"Bodov' + [char]0x00FD + ' graf"'
$text = Rep $text $old_bodovy_title $new_bodovy_title

# ── Kategorická – nominální ──────────────────────────────────────────────────
$old_barva_b = "- barva kvetu (b" + $f + "l" + $f + ", " + $f + "lut" + $f + ", fialov" + $f + ")"
$new_barva_b = "- barva kvetu (b" + [char]0x00ED + "l" + [char]0x00E1 + ", " + [char]0x017E + "lut" + [char]0x00E1 + ", fialov" + [char]0x00E1 + ")"
$text = Rep $text $old_barva_b $new_barva_b

$old_hmyz = "- druh hmyzu (vcela, cmel" + $f + "k, mot" + $f + "l)"
$new_hmyz = "- druh hmyzu (v" + [char]0x010D + "ela, " + [char]0x010D + "mel" + [char]0x00E1 + "k, mot" + [char]0x00FD + "l)"
$text = Rep $text $old_hmyz $new_hmyz

$old_stanoviste = "- typ stanovi" + $f + "te (les, louka, mokrad)"
$new_stanoviste = "- typ stanovi" + [char]0x0161 + "t" + [char]0x011B + " (les, louka, mok" + [char]0x0159 + "ad)"
$text = Rep $text $old_stanoviste $new_stanoviste

$old_krevni = "- krevn" + $f + " skupina (A, B, AB, 0)"
$new_krevni = "- krevn" + [char]0x00ED + " skupina (A, B, AB, 0)"
$text = Rep $text $old_krevni $new_krevni

$old_nelze = "Promenn" + $f + ", jejich" + $f + " hodnoty **nelze seradit** " + $f + " " + $f + $f + "ed" + $f + [char]0x22 + " nen" + $f + " v" + $f + "ce ani m" + $f + "ne ne" + $f + " " + $f + $f + "lut" + $f + [char]0x22 + "."
$new_nelze = "Prom" + [char]0x011B + "nn" + [char]0x00E1 + ", jej" + [char]0x00ED + [char]0x017E + " hodnoty **nelze se" + [char]0x0159 + "adit** " + [char]0x2013 + " " + [char]0x201E + [char]0x0161 + "ed" + [char]0x00E1 + [char]0x201C + " nen" + [char]0x00ED + " v" + [char]0x00ED + "c ani m" + [char]0x00E9 + "n" + [char]0x011B + " ne" + [char]0x017E + " " + [char]0x201E + [char]0x017E + "lut" + [char]0x00E1 + [char]0x201C + "."
$text = Rep $text $old_nelze $new_nelze

$old_barvy_c = 'c("' + $f + 'ed' + $f + '", "' + $f + 'lut' + $f + '", "' + $f + 'ed' + $f + '", "fialov' + $f + '")'
$new_barvy_c = 'c("' + [char]0x0161 + 'ed' + [char]0x00E1 + '", "' + [char]0x017E + 'lut' + [char]0x00E1 + '", "' + [char]0x0161 + 'ed' + [char]0x00E1 + '", "fialov' + [char]0x00E1 + '")'
$text = Rep $text $old_barvy_c $new_barvy_c

$old_kazda_kat = "Ka" + $f + "d" + $f + " kategorie dostane vlastn" + $f + " barvu " + $f + " vizu" + $f + "ln" + $f + " k" + $f + "d odpov" + $f + "d" + $f + " realite."
$new_kazda_kat = "Ka" + [char]0x017E + "d" + [char]0x00E1 + " kategorie dostane vlastn" + [char]0x00ED + " barvu " + [char]0x2013 + " vizu" + [char]0x00E1 + "ln" + [char]0x00ED + " k" + [char]0x00F3 + "d odpov" + [char]0x00ED + "d" + [char]0x00E1 + " realit" + [char]0x011B + "."
$text = Rep $text $old_kazda_kat $new_kazda_kat

$old_seda = '"' + $f + 'ed' + $f + '" = "gray70",'
$new_seda = '"' + [char]0x0161 + 'ed' + [char]0x00E1 + '" = "gray70",'
$text = Rep $text $old_seda $new_seda

$old_zluta = '"' + $f + 'lut' + $f + '" = "gold",'
$new_zluta = '"' + [char]0x017E + 'lut' + [char]0x00E1 + '" = "gold",'
$text = Rep $text $old_zluta $new_zluta

$old_fialova = '"fialov' + $f + '" = "mediumpurple"'
$new_fialova = '"fialov' + [char]0x00E1 + '" = "mediumpurple"'
$text = Rep $text $old_fialova $new_fialova

$old_proporce = "Chceme uk" + $f + "zat **proporce** (ne pocty)? Pou" + $f + "ijeme slo" + $f + "en" + $f + " sloupcov" + $f + " graf nebo waffle."
$new_proporce = "Chceme uk" + [char]0x00E1 + "zat **proporce** (ne po" + [char]0x010D + "ty)? Pou" + [char]0x017E + "ijeme slo" + [char]0x017E + "en" + [char]0x00FD + " sloupcov" + [char]0x00FD + " graf nebo waffle."
$text = Rep $text $old_proporce $new_proporce

$old_podil = 'y = "Pod' + $f + 'l",'
$new_podil = 'y = "Pod' + [char]0x00ED + 'l",'
$text = Rep $text $old_podil $new_podil

$old_slozeny = '"Slo' + $f + 'en' + $f + ' sloupcov' + $f + ' graf"'
$new_slozeny = '"Slo' + [char]0x017E + 'en' + [char]0x00FD + ' sloupcov' + [char]0x00FD + ' graf"'
$text = Rep $text $old_slozeny $new_slozeny

# ── Kategorická – ordinální ──────────────────────────────────────────────────
$old_stupen_b = "- stupen po" + $f + "kozen" + $f + " listu (" + $f + $f + "dn" + $f + ", m" + $f + "rn" + $f + ", stredn" + $f + ", siln" + $f + ")"
$new_stupen_b = "- stupe" + [char]0x0148 + " po" + [char]0x0161 + "kozen" + [char]0x00ED + " listu (" + [char]0x017E + [char]0x00E1 + "dn" + [char]0x00E9 + ", m" + [char]0x00ED + "rn" + [char]0x00E9 + ", st" + [char]0x0159 + "edn" + [char]0x00ED + ", siln" + [char]0x00E9 + ")"
$text = Rep $text $old_stupen_b $new_stupen_b

$old_skolni = "- " + $f + "koln" + $f + " klasifikace (1, 2, 3, 4, 5)"
$new_skolni = "- " + [char]0x0161 + "koln" + [char]0x00ED + " klasifikace (1, 2, 3, 4, 5)"
$text = Rep $text $old_skolni $new_skolni

$old_souhlas = "- souhlas s v" + $f + "rokem (zcela souhlas" + $f + "m ? zcela nesouhlas" + $f + "m)"
$new_souhlas = "- souhlas s v" + [char]0x00FD + "rokem (zcela souhlas" + [char]0x00ED + "m " + [char]0x2013 + " zcela nesouhlas" + [char]0x00ED + "m)"
$text = Rep $text $old_souhlas $new_souhlas

$old_faze = "- f" + $f + "ze mes" + $f + "ce (nov" + $f + " ? " + $f + "plnek)"
$new_faze = "- f" + [char]0x00E1 + "ze m" + [char]0x011B + "s" + [char]0x00ED + "ce (nov " + [char]0x2013 + " " + [char]0x00FA + "pln" + [char]0x011B + "k)"
$text = Rep $text $old_faze $new_faze

$old_poradi = "Promenn" + $f + " s **porad" + $f + "m**, ale vzd" + $f + "lenost mezi stupni **nen" + $f + " nutne stejn" + $f + "** " + $f + " " + $f + "stredn" + $f + [char]0x22 + " po" + $f + "kozen" + $f + " nen" + $f + " presne dvakr" + $f + "t vet" + $f + $f + " ne" + $f + " " + $f + "m" + $f + "rn" + $f + [char]0x22 + "."
$new_poradi = "Prom" + [char]0x011B + "nn" + [char]0x00E1 + " s **po" + [char]0x0159 + "ad" + [char]0x00ED + "m**, ale vzd" + [char]0x00E1 + "lenost mezi stupni **nen" + [char]0x00ED + " nutn" + [char]0x011B + " stejn" + [char]0x00E1 + "** " + [char]0x2013 + " " + [char]0x201E + "st" + [char]0x0159 + "edn" + [char]0x00ED + [char]0x201C + " po" + [char]0x0161 + "kozen" + [char]0x00ED + " nen" + [char]0x00ED + " p" + [char]0x0159 + "esn" + [char]0x011B + " dvakr" + [char]0x00E1 + "t v" + [char]0x011B + "t" + [char]0x0161 + [char]0x00ED + " ne" + [char]0x017E + " " + [char]0x201E + "m" + [char]0x00ED + "rn" + [char]0x00E9 + [char]0x201C + "."
$text = Rep $text $old_poradi $new_poradi

$old_ord_c = 'c("m' + $f + 'rn' + $f + '", "siln' + $f + '", "' + $f + $f + 'dn' + $f + '", "stredn' + $f + '"),'
$new_ord_c = 'c("m' + [char]0x00ED + 'rn' + [char]0x00E9 + '", "siln' + [char]0x00E9 + '", "' + [char]0x017E + [char]0x00E1 + 'dn' + [char]0x00E9 + '", "st' + [char]0x0159 + 'edn' + [char]0x00ED + '"),'
$text = Rep $text $old_ord_c $new_ord_c

$old_ord_levels = 'levels = c("' + $f + $f + 'dn' + $f + '", "m' + $f + 'rn' + $f + '", "stredn' + $f + '", "siln' + $f + '"),'
$new_ord_levels = 'levels = c("' + [char]0x017E + [char]0x00E1 + 'dn' + [char]0x00E9 + '", "m' + [char]0x00ED + 'rn' + [char]0x00E9 + '", "st' + [char]0x0159 + 'edn' + [char]0x00ED + '", "siln' + [char]0x00E9 + '"),'
$text = Rep $text $old_ord_levels $new_ord_levels

$old_seraz = "Vizualizace: sloupcov" + $f + " graf s **serazenou** osou."
$new_seraz = "Vizualizace: sloupcov" + [char]0x00FD + " graf s **se" + [char]0x0159 + "azenou** osou."
$text = Rep $text $old_seraz $new_seraz

$old_stupen_lab = 'x = "Stupen po' + $f + 'kozen' + $f + ' listu",'
$new_stupen_lab = 'x = "Stupe' + [char]0x0148 + ' po' + [char]0x0161 + 'kozen' + [char]0x00ED + ' listu",'
$text = Rep $text $old_stupen_lab $new_stupen_lab

# ── Save ────────────────────────────────────────────────────────────────────
[System.IO.File]::WriteAllText($file, $text, [System.Text.Encoding]::UTF8)

# Report remaining FFFD
$remaining = ($text.ToCharArray() | Where-Object { [int]$_ -eq 0xFFFD }).Count
Write-Host "Done. Remaining FFFD: $remaining"
