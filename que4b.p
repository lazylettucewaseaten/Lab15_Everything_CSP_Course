set term pdf
set output 'age_bp_correlation.pdf'
set title 'Age vs. Resting Blood Pressure Correlation'
set xlabel 'Age'
set ylabel 'Resting Blood Pressure (trestbps)'
set style data points
set datafile separator ','

plot 'heart.csv' using 1:4 title 'Age vs. Resting Blood Pressure' with points pointtype 5 pointsize 0.6 linecolor rgb 'green'

