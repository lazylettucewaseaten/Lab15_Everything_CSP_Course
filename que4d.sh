awk -F',' '
$14==1 {
    if ($1 >= 40 && $1 < 50) ageDistribution["40-50"]++
    else if ($1 >= 50 && $1 < 60) ageDistribution["50-60"]++
    else if ($1 >= 60 && $1 < 70) ageDistribution["60-70"]++
    else if ($1 >= 70 && $1 < 80) ageDistribution["70-80"]++
    else if ($1 >= 80 && $1 < 90) ageDistribution["80-90"]++
    else if ($1 >= 90 && $1 < 100) ageDistribution["90-100"]++
}
END {
    for (range in ageDistribution) print range "," ageDistribution[range]
}' heart.csv > age_groups.csv

total_count=$(awk -F',' '{total += $2} END {print total}' age_groups.csv)

initial_angle=0
colors=("red" "orange" "yellow" "green" "blue" "purple")

cat <<END_PLOT > age_groups_plot.p
set terminal pdf
set output 'age_groups_chart.pdf'
set title 'Age Group Distribution with Heart Disease'
set key outside top box
set style fill solid 1.0 border -1

set angles degrees
set xrange [-1:1]
set yrange [-1:1]
set size square
END_PLOT

index=0
while IFS=, read -r ageRange value; do
    percentage=$(awk "BEGIN {print ($value / $total_count) * 100}")
    end_angle=$(awk "BEGIN {print $initial_angle + ($percentage * 3.6)}")
    
    echo "set obj $(($index + 1)) circle at 0,0 size 1 front arc [$initial_angle:$end_angle] fc rgb \"${colors[$index]}\"" >> age_groups_plot.p

    initial_angle=$end_angle
    index=$((index+1))
done < age_groups.csv

cat <<END_PLOT >> age_groups_plot.p
plot NaN title '40-50' with lines lc rgb "red", \
     NaN title '50-60' with lines lc rgb "orange", \
     NaN title '60-70' with lines lc rgb "yellow", \
     NaN title '70-80' with lines lc rgb "green", \
     NaN title '80-90' with lines lc rgb "blue", \
     NaN title '90-100' with lines lc rgb "purple"
END_PLOT

echo 'Processed data into age_groups.csv and created gnuplot script age_groups_plot.p'
gnuplot age_groups_plot.p
echo 'Pie chart generated as age_groups_chart.pdf'

