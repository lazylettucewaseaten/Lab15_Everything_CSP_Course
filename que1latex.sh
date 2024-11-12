#!/bin/bash

CSV_FILE="$1"
LATEX_FILE="output_table.tex"

echo "\\documentclass{article}" > "$LATEX_FILE"
echo "\\usepackage{csvsimple}" >> "$LATEX_FILE"
echo "\\usepackage{graphicx}" >> "$LATEX_FILE"
echo "\\title{SHELL SCRIPT TABLE}" >> "$LATEX_FILE"
echo "\\author{Ashish Ranjan}" >> "$LATEX_FILE"
echo "\\begin{document}" >> "$LATEX_FILE"
echo "\\maketitle" >> "$LATEX_FILE"
table_counter=1
row_counter=0
echo "\\begin{table}[h!]" >> "$LATEX_FILE"
echo "\\centering" >> "$LATEX_FILE"
echo "\\resizebox{\\textwidth}{!}{" >> "$LATEX_FILE"
echo "\\begin{tabular}{|c|c|c|c|c|c|c|c|c|c|c|c|c|c|}" >> "$LATEX_FILE"
echo "\\hline" >> "$LATEX_FILE"


while IFS=, read -r col1 col2 col3 col4 col5 col6 col7 col8 col9 col10 col11 col12 col13 col14; do
    echo "$col1 & $col2 & $col3 & $col4 & $col5 & $col6 & $col7 & $col8 & $col9 & $col10 & $col11 & $col12 & $col13 & $col14 \\\\" >> "$LATEX_FILE"
    echo "\\hline" >> "$LATEX_FILE"
    ((row_counter++))
    if ((row_counter >= 40)); then
        echo "\\end{tabular}" >> "$LATEX_FILE"
        echo "}" >> "$LATEX_FILE"
        echo "\\caption{Sample Data (Part $table_counter)}" >> "$LATEX_FILE"
        echo "\\end{table}" >> "$LATEX_FILE"
        row_counter=0
        ((table_counter++))
        echo "\\begin{table}[h!]" >> "$LATEX_FILE"
        echo "\\centering" >> "$LATEX_FILE"
        echo "\\resizebox{\\textwidth}{!}{" >> "$LATEX_FILE"
        echo "\\begin{tabular}{|c|c|c|c|c|c|c|c|c|c|c|c|c|c|}" >> "$LATEX_FILE"
        echo "\\hline" >> "$LATEX_FILE"
        echo "age & sex & cp & trestbps & chol & fbs & restecg & thalach & exang & oldpeak & slope & ca & thal & target \\\\" >> "$LATEX_FILE"
        echo "\\hline" >> "$LATEX_FILE"
    fi
done < "$CSV_FILE"
echo "\\end{tabular}" >> "$LATEX_FILE"
echo "}" >> "$LATEX_FILE"
echo "\\caption{Sample Data (Part $table_counter)}" >> "$LATEX_FILE"
echo "\\end{table}" >> "$LATEX_FILE"
echo "\\end{document}" >> "$LATEX_FILE"

