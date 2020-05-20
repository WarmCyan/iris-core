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
	description=$(sed '2q;d' $filename | sed "s/#//")
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
	for key in "${!setups[@]}"
	do
		echo -e "\t${C_YELLOW_L}${keys[$key]}${C_RESET} - $key: ${setups[$key]}"
		#echo -ne "c${C_RESET} - core installs"
	done
}
print_menu

popd > /dev/null
