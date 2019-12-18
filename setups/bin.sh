#!/bin/bash

# copy over all the tools and scripts

script_loc=$(dirname $0)

echo "Installing IRIS management scripts..."
cp -r $script_loc/../iris/* $BIN_DIR
