# bulk_rename_penguins.ps1
# Safe bulk text replacement for L-example pivot: kopretiny -> tucnaci
# Writes UTF-8 WITHOUT BOM back to each file.
# All Czech characters are specified via [char]0xXXXX — never inline literals.

param(
    [string[]]$Files = @(
        "Learning_materials\skripta.qmd",
        "Presentation\presentation.qmd"
    )
)

Set-Location $PSScriptRoot

# ---------- Czech char helpers ----------
$c_hk = [char]0x010D  # c with caron:  c with hook (c with caron = č)
$e_hk = [char]0x011B  # e with caron:  ě
$i_ac = [char]0x00ED  # i acute:       í
$u_rg = [char]0x016F  # u with ring:   ů
$n_hk = [char]0x0148  # n with caron:  ň
$a_ac = [char]0x00E1  # a acute:       á
$e_ac = [char]0x00E9  # e acute:       é
$u_ac = [char]0x00FA  # u acute:       ú
$r_hk = [char]0x0159  # r with caron:  ř
$s_hk = [char]0x0161  # s with caron:  š
$z_hk = [char]0x017E  # z with caron:  ž

# ---------- Build Czech source strings ----------
# "Počet okvětních lístků"
$old_pocet_listku_label_y  = "Po${c_hk}et okv${e_hk}tn${i_ac}ch l${i_ac}stk${u_rg}"
# "Počet tučňáků (na průzkum)"
$new_pocet_tucnaku_label_y = "Po${c_hk}et tu${c_hk}${n_hk}${a_ac}k${u_rg} (na pr${u_rg}zkum)"
# "Počet kopretin"
$old_pocet_kopretin  = "Po${c_hk}et kopretin"
# "Počet průzkumů"
$new_pocet_pruzkumu  = "Po${c_hk}et pr${u_rg}zkum${u_rg}"
# "Délka okvětního lístku"
$old_delka_okvetniho = "D${e_ac}lka okv${e_hk}tn${i_ac}ho l${i_ac}stku"
# "Délka lístku (mm)"
$old_delka_listku_mm = "D${e_ac}lka l${i_ac}stku (mm)"
# "Délka lístku"
$old_delka_listku    = "D${e_ac}lka l${i_ac}stku"
# "Délka ploutve (mm)"
$new_delka_plutvy_mm = "D${e_ac}lka ploutve (mm)"
# "Délka ploutve"
$new_delka_plutvy    = "D${e_ac}lka ploutve"
# "Barva květu"
$old_barva_kvetu = "Barva kv${e_hk}tu"
# "Druh tučňáka"
$new_druh_tucnaka = "Druh tu${c_hk}${n_hk}${a_ac}ka"
$y_ac = [char]0x00FD   # ý

foreach ($relPath in $Files) {
    $fullPath = Join-Path $PSScriptRoot $relPath
    if (-not (Test-Path $fullPath)) {
        Write-Warning "File not found: $fullPath"
        continue
    }

    Write-Host "Processing $relPath ..."
    $bytes = [System.IO.File]::ReadAllBytes($fullPath)
    $txt   = [System.Text.Encoding]::UTF8.GetString($bytes)

    # ---- ORDER MATTERS: do longest/most-specific patterns first ----

    # 1. pocet_listku_outlier before pocet_listku
    $txt = $txt -replace "pocet_listku_outlier", "pocet_tucnaku_outlier"
    # 2. pocet_listku_ukazka before pocet_listku
    $txt = $txt -replace "pocet_listku_ukazka",  "pocet_tucnaku_ukazka"
    # 3. vzorek_pocet_listku before pocet_listku
    $txt = $txt -replace "vzorek_pocet_listku",   "vzorek_poctu_tucnaku"
    # 4. data_pocet_listku before pocet_listku
    $txt = $txt -replace "data_pocet_listku",      "data_poctu_tucnaku"
    # 5. pocet_nasbiranych_kopretin (column name in presentation)
    $txt = $txt -replace "pocet_nasbiranych_kopretin", "cislo_pruzkumu"
    # 6. nasbiranych_kopretin catch-all (for any remaining uses)
    $txt = $txt -replace "nasbiranych_kopretin",   "cislo_pruzkumu"
    # 7. pocet_listku -> pocet_tucnaku (remaining)
    $txt = $txt -replace "pocet_listku",           "pocet_tucnaku"

    # 8-10. delka_listku variants
    $txt = $txt -replace "delka_listku_ukazka",    "delka_plutvy_ukazka"
    $txt = $txt -replace "vec_delka_listku",        "vec_delka_plutvy"
    $txt = $txt -replace "data_delka_listku",       "data_delka_plutvy"
    $txt = $txt -replace "delka_listku",            "delka_plutvy"

    # 11-14. barva_kvetiny variants (longer before shorter)
    $txt = $txt -replace "vec_barva_kvetiny",       "vec_druh_tucnaku"
    $txt = $txt -replace "data_barva_kvetiny",      "data_druh_tucnaku"
    $txt = $txt -replace "barvy_kvetin",            "barvy_druhu"
    $txt = $txt -replace "barva_kvetiny",           "druh_tucnaku"
    $txt = $txt -replace "barva_ukazka",            "druh_ukazka"

    # 15-19. stupen_poskozeni variants
    $txt = $txt -replace "vec_stupen_poskozeni",    "vec_kategorie_hmotnosti"
    $txt = $txt -replace "data_stupen_poskozeni",   "data_kategorie_hmotnosti"
    $txt = $txt -replace "stupen_ukazka",           "hmotnost_ukazka"
    $txt = $txt -replace "stupen_poskozeni",        "kategorie_hmotnosti"

    # 20. hustota variable name
    $txt = $txt -replace "hustota_listku",          "hustota_tucnaku"

    # 21. Scale breaks: seq(0, 15, by = 1) -> seq(0, 55, by = 5)
    $txt = $txt -replace [regex]::Escape("seq(0, 15, by = 1)"), "seq(0, 55, by = 5)"
    # seq(1:12) stays (used in motivace chart which keeps small values)
    # breaks = 1:12 stays

    # 22. Hist breaks in student-visible code
    $txt = $txt -replace [regex]::Escape("seq(3.5, 13.5, by = 1)"), "seq(4.5, 49.5, by = 5)"

    # ---- Czech text axis labels (remaining plotting chunks) ----
    # 23. "Počet okvětních lístků" -> "Počet tučňáků (na průzkum)"
    $txt = $txt.Replace($old_pocet_listku_label_y, $new_pocet_tucnaku_label_y)
    # 24. "Počet kopretin" -> "Počet průzkumů"
    $txt = $txt.Replace($old_pocet_kopretin, $new_pocet_pruzkumu)
    # 25. "Délka okvětního lístku" -> "Délka ploutve" (longer pattern first)
    $txt = $txt.Replace($old_delka_okvetniho, $new_delka_plutvy)
    # 26. "Délka lístku (mm)" -> "Délka ploutve (mm)"
    $txt = $txt.Replace($old_delka_listku_mm, $new_delka_plutvy_mm)
    # 27. "Délka lístku" -> "Délka ploutve" (remaining without (mm))
    $txt = $txt.Replace($old_delka_listku, $new_delka_plutvy)
    # 28. "Barva květu" -> "Druh tučňáka"
    $txt = $txt.Replace($old_barva_kvetu, $new_druh_tucnaka)

    # ---- Write back (no BOM) ----
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($fullPath, $txt, $utf8NoBom)
    Write-Host "  Done: $relPath"
}

Write-Host "Bulk rename complete."
