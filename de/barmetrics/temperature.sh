#!/bin/bash


normalcolor=$1
cautioncolor=$2
dangercolor=$3

cautionlevel=$4 # 55?
dangerlevel=$5 # 80?


temps=($(sensors -u | sed -n "s/^.*temp[0-9]_input: \([0-9]\{2,3\}\).*/\1/gp"))

# average temperatures
total=0
for i in "${temps[@]}"
do
	total=$[total+i]
done
#echo $total

average=$[total/${#temps[@]}]
#echo $average


#notifstring="<span color='#AAAAAA'>Core </span><span color="
notifstring="<span color="

if [ $average -gt $dangerlevel ]; then
	notifstring="$notifstring'$dangercolor'>"
elif [ $average -gt $cautionlevel ]; then
	notifstring="$notifstring'$cautioncolor'>"
else
	notifstring="$notifstring'$normalcolor'>"
fi

#notifstring="$notifstring$average</span>"
notifstring="$notifstring$average"

echo -e "$notifstring\u00B0C</span>"
