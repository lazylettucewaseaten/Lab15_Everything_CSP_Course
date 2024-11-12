set terminal pdf
set output 'age_groups_chart.pdf'
set title 'Age Group Distribution with Heart Disease'
set key outside top box
set style fill solid 1.0 border -1

set angles degrees
set xrange [-1:1]
set yrange [-1:1]
set size square
set obj 1 circle at 0,0 size 1 front arc [0:14.1177] fc rgb "red"
set obj 2 circle at 0,0 size 1 front arc [14.1177:131.765] fc rgb "orange"
set obj 3 circle at 0,0 size 1 front arc [131.765:207.059] fc rgb "yellow"
set obj 4 circle at 0,0 size 1 front arc [207.059:360] fc rgb "green"
plot NaN title '40-50' with lines lc rgb "red",      NaN title '50-60' with lines lc rgb "orange",      NaN title '60-70' with lines lc rgb "yellow",      NaN title '70-80' with lines lc rgb "green",      NaN title '80-90' with lines lc rgb "blue",      NaN title '90-100' with lines lc rgb "purple"
