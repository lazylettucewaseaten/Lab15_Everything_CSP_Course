#!/bin/bash
INPUT_FILE="heart.csv"
awk -F',' '
{
    # Column $2 is sex (1 = male, 0 = female), column $14 is target (heart disease)
    if ($2 == 1) {  # Male
        if ($14 == 1) {
            gender["male_1"]++
        } else if ($14 == 0) {
            gender["male_0"]++
        }
    } else if ($2 == 0) {  # Female
        if ($14 == 1) {
            gender["female_1"]++
        } else if ($14 == 0) {
            gender["female_0"]++
        }
    }
}
END {
    # Ensure all categories are initialized if missing
    if (!( "male_0" in gender )) gender["male_0"]=0
    if (!( "male_1" in gender )) gender["male_1"]=0
    if (!( "female_0" in gender )) gender["female_0"]=0
    if (!( "female_1" in gender )) gender["female_1"]=0
    print "female", gender["female_0"], gender["female_1"]
    print "male", gender["male_0"], gender["male_1"]
    
}
' $INPUT_FILE > temp4a.dat
echo "Data preparation completed!"

