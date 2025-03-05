pdf-embed () {
    gs -q -dNOPAUSE -dBATCH -dPDFSETTINGS=/prepress -sDEVICE=pdfwrite -sFONTPATH="/usr/share/fonts/truetype/msttcorefonts" -sOutputFile="embed_${1}" "${1}"
}

() { # TIMEFMT {{{3
  local white_b=$'\e[97m' blue=$'\e[94m' rst=$'\e[0m'
  TIMEFMT=("== TIME REPORT FOR $white_b%J$rst =="$'\n'
    "  User: $blue%U$rst"$'\t'"System: $blue%S$rst  Total: $blue%*Es${rst}"$'\n'
    "  CPU:  $blue%P$rst"$'\t'"Mem:    $blue%M MiB$rst")
}
