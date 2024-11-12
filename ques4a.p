set terminal pdf
set output 'que4a.pdf'

set title "Gender vs Number of People with Heart Disease"
set style data histogram  
set style fill solid
set xlabel "Gender"
set ylabel "Count"

plot 'temp4a.dat'  using 2:xtic(1) ti "0" lc "red", "" using 3:xtic(1) ti "1" lc "blue" 

