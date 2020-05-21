#!/bin/bash

# NOTE: don't run this, meant to be sourced by update scripts

# NOTE: assumes that $source_dir already correctly defined

setup_list=$DATA_DIR/iris/setup_list

function print_help {
	echo "Usage: update[-local] [SETUPNAME|all|ls|list] [source SOURCEDIR]"
	echo -e "\tupdate - run config and bin setups"
	echo -e "\tupdate all - run all setups"
	echo -e "\tupdate ls|list - list all configured setups"

	echo -e "\tIf source included, SOURCEDIR should be the parent directory of 'iris-core'"
	echo -e "\tDefault source directory for update-local is '$LAB_DIR'"

	echo -e "\n\nConfigured setups:"
	cat $setup_list
}

# returns 0 if handled, 1 if should continue handling in caller
function handle_common_help_args {
	if [[ "$1" == "help" ]]; then
		print_help
		return 0
		
	elif [[ "$1" == "ls" || "$1" == "list" ]]; then
		cat "$setup_list"
		return 0
	fi
	return 1
}

function update_iris_core {
	echo "Updating local iris core repo..."
	pushd $PKG_DIR/iris-core > /dev/null
	git pull
	popd > /dev/null 
}

function print_source {
	echo "Sourcing from $source_dir..."
}

function update_specific {
	echo "Update of $1 requested..."
	print_source
	bash $source_dir/iris-core/setups/$1.setup
}

function update_all {
	echo "Running all configured updates..."
	print_source

	while IFS="" read -r setup || [ -n "$setup" ]
	do
		echo "Setting up $setup..."
		bash $source_dir/iris-core/setups/$setup.setup
	done < $setup_list
}

function update_default {
	echo "Updating configs and bins..."
	print_source
	if [ `grep "configs" $setup_list` ]; then
		bash $source_dir/iris-core/setups/configs.setup
	fi
	bash $source_dir/iris-core/setups/bin.setup
	if [ `grep "tools" $setup_list` ]; then
		bash $source_dir/iris-core/setups/tools.setup
	fi
}
