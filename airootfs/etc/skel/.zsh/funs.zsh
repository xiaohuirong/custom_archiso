pdf-embed () {
    gs -q -dNOPAUSE -dBATCH -dPDFSETTINGS=/prepress -sDEVICE=pdfwrite -sFONTPATH="/usr/share/fonts/truetype/msttcorefonts" -sOutputFile="embed_${1}" "${1}"
}
