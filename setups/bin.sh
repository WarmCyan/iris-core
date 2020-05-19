#!/bin/bash
# Simple bin installs

# copy over all the tools and scripts

script_loc=$(dirname $0)

setup_registry="$DATA_DIR/iris/bin_setup_registry"

# if there was previous file listing installed files, remove all of them
if [ -f $setup_registry ]; then
	echo "Cleaning all files on previous bin registry..."
	
	pushd $BIN_DIR > /dev/null
		rm -rfd $(cat $setup_registry) > /dev/null 2>&1
		# for file in $(cat $setup_registry)
		# do
		# 	rm -rfd $file > /dev/null 2>&1
		# done
	popd > /dev/null # $BIN_DIR
fi

echo "Installing IRIS management scripts..."
cp -r $script_loc/../iris/* $BIN_DIR

# Save the new list of installed files to data
echo "Saving new bin registry..."
pushd $script_loc/../iris/ > /dev/null
	ls > $setup_registry
popd > /dev/null # $script_loc/../iris/ 
