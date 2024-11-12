awk -F',' 'NR==1 || $14==0 {print $1","$5","$14}' heart.csv > age_cholesterol_data.csv

cat <<END_SCRIPT > age_cholesterol_plot.p
set term pdf 
set output 'age_cholesterol_chart.pdf'
set title 'Age vs. Cholesterol for Individuals without Heart Disease'
set xlabel 'Age'
set ylabel 'Cholesterol Level'
set datafile separator ','
set key out

plot 'age_cholesterol_data.csv' using 1:2 with linespoints title 'Age vs. Cholesterol'
END_SCRIPT

echo 'Data saved as age_cholesterol_data.csv and plot script created as age_cholesterol_plot.p'
gnuplot age_cholesterol_plot.p
echo 'Chart generated as age_cholesterol_chart.png'

