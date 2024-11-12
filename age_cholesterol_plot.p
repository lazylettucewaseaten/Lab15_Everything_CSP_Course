set term pdf 
set output 'age_cholesterol_chart.pdf'
set title 'Age vs. Cholesterol for Individuals without Heart Disease'
set xlabel 'Age'
set ylabel 'Cholesterol Level'
set datafile separator ','
set key out

plot 'age_cholesterol_data.csv' using 1:2 with linespoints title 'Age vs. Cholesterol'
