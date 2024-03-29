# HTML ----
# Lecture du fichier HTML
readLines("hdr.html") |>
  # Remplacement de chaîne, sans expression régulière
  stringi::stri_replace_all_fixed(
    # Motif à remplacer: fin de citation grasse + citation normale
    pattern = ')</span></strong>+<span class="citation">(',
    # Remplacement par un point-virgule
    replacement = '</span></strong>; <span class="citation">'
  ) |>
  stringi::stri_replace_all_fixed(
    # Motif à remplacer: fin de citation normale + citation grasse
    pattern = ')</span>+<strong><span class="citation">(',
    # Remplacement par un point-virgule
    replacement = '</span>; <strong><span class="citation">'
  ) |>
  # Fichier final
  writeLines(con = "hdr_final.html")

# TeX ----
readLines("hdr.tex") |>
  stringi::stri_replace_all_fixed(
    # Motif à remplacer: fin de citation grasse + citation normale
    pattern = ')}+(',
    replacement = '}; '
  ) |>
  stringi::stri_replace_all_fixed(
    # Motif à remplacer: fin de citation normale + citation grasse
    pattern = ')+\\textbf{(',
    replacement = '; \\textbf{'
  ) |>
  writeLines(con = "hdr_final.tex")
# Compilation
tinytex::xelatex(file = "hdr_final.tex")

