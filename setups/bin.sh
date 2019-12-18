#!/bin/bash

# copy over all the tools and scripts

script_loc=$(dirname $0)

cp -r $script_loc/../iris $BIN_DIR
