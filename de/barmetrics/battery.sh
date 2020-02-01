#!/bin/bash

normalcolor=$1
cautioncolor=$2
dangercolor=$3

cautionlevel=$4 # 50 ?
dangerlevel=$5 # 25 ?

plugchar="\uf1e6"

batt=$(acpi | sed -n "s/^.*, \([0-9]*\)%.*/\1/p")

count=0
avg=0
for n in $batt; do
	((avg+=n))
	((count+=1))
done

avg=$((avg / count))
battavg=$avg


#notifstring="<span color='#AAAAAA'>Batt </span><span color="
notifstring="<span color="

if [[ $battavg -lt $dangerlevel ]]; then
	notifstring="$notifstring'$dangercolor'>"
elif [[ $battavg -lt $cautionlevel ]]; then
	notifstring="$notifstring'$cautioncolor'>"
else
	notifstring="$notifstring'$normalcolor'>"
fi

notifstring="$notifstring$battavg%</span>"

if [ $count -gt 1 ]; then
	notifstring="$notifstring <span color='$normalcolor'>"

	for n in $batt; do
		notifstring="$notifstring($n%) "
	done
	
	# https://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-a-bash-variable
	notifstring="$(echo -e "${notifstring}" | sed -e 's/[[:space:]]*$//')"
	notifstring="$notifstring</span>"
fi

# show a plug icon if no battery detected
if [ $count -eq 0 ]; then
	notifstring="<span font-desc='fontawesome'>$plugchar</span>"
fi


echo -e "$notifstring"
