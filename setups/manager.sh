#!/bin/bash


# color constants
C_CYAN_L="\033[1;36m"
C_RED="\033[0;31m"
C_GREEN="\033[0;32m"
C_YELLOW_L="\033[1;33m"
C_RESET="\033[0m"

script_loc=$(dirname $0)
setup_registry="$DATA_DIR/iris/bin_setup_registry"

# data dictionaries
declare -A setups
declare -A setups_to_run
declare -A keys

pushd $script_loc > /dev/null

# https://superuser.com/questions/335160/how-to-list-files-based-on-matching-only-part-of-their-filename
# https://superuser.com/questions/559824/how-to-get-only-names-from-find-command-without-path
# for filename in $(find $script_loc -type f -name "*.setup" | sed 's!.*/!!')
for filename in $(find $script_loc -type f -name "*.setup" -exec basename {} \;)
do
	description=$(sed '2q;d' $filename | sed "s/#\ //")
	key=$(sed '3q;d' $filename | sed "s/#\ key:\ //")
	clean_filename=$(echo "$filename" | sed "s/\.setup//")
	
	
	#setups+=([$filename]=$description)
	setups[$clean_filename]=$description
	setups_to_run[$clean_filename]=0
	keys[$clean_filename]=$key
	
	# check if we've used this setup or not
	if [ -f $setup_registry ]; then
		# https://stackoverflow.com/questions/4749330/how-to-test-if-string-exists-in-file-with-bash
		if grep -Fxq "$clean_filename" $setup_registry
		then
			setups_to_run[$clean_filename]=1
		fi
	fi
done

function print_menu {
	echo -e "Selection menu"
	for key in "${!setups[@]}"
	do
		echo -e "\t${C_YELLOW_L}${keys[$key]}${C_RESET} - $key: ${setups[$key]}"
	done
}

function print_selected {
	echo "${setups_to_run[@]}"
	echo -en "\nCurrently selected\n\t"
	for key in "${!setups[@]}"
	do
		if [ "${setups_to_run[$key]}" -eq 1 ]; then
			echo -en "$key(${C_YELLOW_L}${keys[$key]}${C_RESET}) "
		fi
	done
	echo ""
}

# loop and get all of the user's chosen packages
echo "Query which setups to run..."
userchoice="0"
while [[ "$userchoice" != "" ]]; do
	echo -e "\nPlease select the additional setup scripts to run (enter to finalize)"
	print_selected
	print_menu
	read -p "Input: " -n1 userchoice
	echo ""

	# iterate and find the associated setup for the key we pressed
	for key in "${!setups[@]}"
	do
		if [[ "${keys[$key]}" == "$userchoice" ]]; then
			if [[ "${setups_to_run[$key]}" == 0 ]]; then
				setups_to_run[$key]=1
			else
				setups_to_run[$key]=0
			fi
		fi
	done

	if [[ "$userchoice" == "" ]]; then
		echo "Selection finalized"
	#else
		#echo "Unrecognized input"
	fi
done


popd > /dev/null
