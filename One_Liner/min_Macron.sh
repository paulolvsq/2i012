grep -e ^$1 Presidentielle_2017_Resultats_Communes_Tour_2_c.csv | sort -t ";" -nr -k9 | head -n15 | sort -t ";" -nk24 | cut -d ";" -f4,24 | tr ";" " " | head -n1
