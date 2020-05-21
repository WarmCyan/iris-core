base_registry_path="$DATA_DIR/iris"
common_registry=""
setup_list="$DATA_DIR/iris/setup_list" # NOTE: warning, if this is every changed in manager, this could be problematic?

function set_registry_path {
	common_registry="$base_registry_path/$1"
}

function clean_from_registry {
	if [ -f $common_registry ]; then
		echo "Cleaning all files on previous registry '$common_registry'"
		rm -rfd $(cat $common_registry) > /dev/null 2>&1
		rm $common_registry
	fi
}

function register {
	echo $1 >> $common_registry
}

# checks if a specific setup is used in the current system install or not
function is_setup_requested {
	return $(grep -Fxq "$1" $setup_list)
	# if grep -Fxq "$1" $setup_list
	# then
	# 	return 1
	# fi
	# return 0
}
