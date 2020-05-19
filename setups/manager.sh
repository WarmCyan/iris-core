#!/bin/bash

C_CYAN_L="\033[1;36m"
C_RESET="\033[0m"
script_loc=$(dirname $0)

declare -A setups
for filename in $(ls $script_loc)
do
	#echo -n "$filename -"
	description=$(sed '2q;d' $filename | sed "s/#//")
	#echo -e ${C_CYAN_L}$description${C_RESET}
	setups+=([$filename]=$description)
	#sed '2q;d' $filename
	# echo $filename
done

for key in "${!setups[@]}"
do
	echo $key
done
