#!/bin/bash

# =========================================
# IRIS base setup script
# Date Created: 2019.12.12
# Date Edited: 2019.12.17
# Copyright (c) 2019 Digital Warrior Labs
# Author: Nathan Martindale
# Description: Minimum system base infrastructure setup
# =========================================

# NOTE: fundamentally I want a minimal setup that doesn't install external software (if I have no permissions) and a couple different setups for either a terminal system or a desktop system

# TODO: Is this setup ever rerun to install new setups? If so, should probably display from data dir which setups have been run already? (because if this file is run multiple times, that setup_list file will get out of sync if you don't select the same things again
# TODO: probably just want to move the setups selection to its own script that can be run independently

# meta information
VERSION="0.1.0"
VERSION_DATE="2019.12.17"

# color constants
C_CYAN_L="\033[1;36m"
C_RED="\033[0;31m"
C_GREEN="\033[0;32m"
C_YELLOW_L="\033[1;33m"
C_RESET="\033[0m"

# variables
home_target=$HOME # TODO: check if passed as cmdline arg
script_loc=$(dirname $0)

# welcome message
echo -e "\n${C_CYAN_L}IRIS${C_RESET} base setup script"
echo -e "Digital Warrior Labs"
echo -e "\nVersion ${VERSION}"
echo -e "Date ${VERSION_DATE}\n"

echo -e "$(date)"
echo -e "Running setup script in $script_loc\n"

# ---------------------------------
# Base folder structure setup
# ---------------------------------

# check setup script location and if the target folders have been set up
echo "Ensuring base folder structure..."
bin_dir=$home_target/bin
conf_dir=$home_target/conf
data_dir=$home_target/data
lab_dir=$home_target/lab
lib_dir=$home_target/lib
pkg_dir=$home_target/pkg
tmp_dir=$home_target/tmp

echo -e "\t$bin_dir"
echo -e "\t$conf_dir"
echo -e "\t$data_dir"
echo -e "\t$lab_dir"
echo -e "\t$lib_dir"
echo -e "\t$pkg_dir"
echo -e "\t$tmp_dir"

mkdir -p $bin_dir $lib_dir $conf_dir $data_dir $pkg_dir $tmp_dir $lab_dir

# ---------------------------------
# .env file creation
# ---------------------------------

# create the .env file
echo -e "Creating environment vars script..."
echo "export BIN_DIR=\"$bin_dir\"" > $home_target/.env
echo "export CONF_DIR=\"$conf_dir\"" >> $home_target/.env
echo "export DATA_DIR=\"$data_dir\"" >> $home_target/.env
echo "export LAB_DIR=\"$lab_dir\"" >> $home_target/.env
echo "export LIB_DIR=\"$lib_dir\"" >> $home_target/.env
echo "export PKG_DIR=\"$pkg_dir\"" >> $home_target/.env
echo "export TMP_DIR=\"$tmp_dir\"" >> $home_target/.env

# create the local .env file
touch $conf_dir/.env_l
echo '[[ -f $CONF_DIR/.env_l ]] && . $CONF_DIR/.env_l' >> $home_target/.env

# update the path to include the bin
echo 'export PATH=${PATH}:$BIN_DIR' >> $home_target/.env

. $home_target/.env

# ---------------------------------
# Script run location 
# ---------------------------------

# check run location of current script and move it to the core folder structure as necessary
echo "Checking current script location..."
if [ "$script_loc" != "$pkg_dir/iris-core/setups" ]; then
	echo "Running from non-base setup file, copying setup into base structure..."
	cp -r $script_loc/../ $pkg_dir/iris-core

	echo "Transferring control to relocated setup scripts..."
	bash $pkg_dir/iris-core/setups/initial_setup.sh
	exit
fi
echo "Script running from base folder structure, continuing happily!"

# ---------------------------------
# Determine which setups to run
# ---------------------------------

core=true
nvim=true
arch_desktop=false
configs=true

function print_menu {
	echo -e "Selection menu"
	echo -e "\t${C_YELLOW_L}c${C_RESET} - core installs"
	echo -e "\t${C_YELLOW_L}n${C_RESET} - nvim install"
	echo -e "\t${C_YELLOW_L}d${C_RESET} - arch desktop installs"
	echo -e "\t${C_YELLOW_L}f${C_RESET} - configs"
}

function print_selected {
	echo -en "\nCurrently selected\n\t"
	if [ "$core" = true ]; then
		echo -en "core(${C_YELLOW_L}c${C_RESET}) "
	fi
	if [ "$nvim" = true ]; then
		echo -en "nvim(${C_YELLOW_L}n${C_RESET}) "
	fi
	if [ "$arch_desktop" = true ]; then
		echo -en "arch desktop(${C_YELLOW_L}d${C_RESET}) "
	fi
	if [ "$configs" = true ]; then
		echo -en "configs(${C_YELLOW_L}f${C_RESET}) " 
	fi
	echo ""
}

echo "Query which setups to run..."
userchoice="0"
while [[ "$userchoice" != "" ]]; do
	echo -e "\nPlease select the additional setup scripts to run (enter to finalize)"
	print_selected
	print_menu
	read -p "Input: " -n1 userchoice
	echo ""

	if [[ "$userchoice" == "c" ]]; then
		if [ "$core" = true ]; then
			core=false
		else
			core=true
		fi
	elif [[ "$userchoice" == "n" ]]; then
		if [ "$nvim" = true ]; then
			nvim=false
		else
			nvim=true
		fi
	elif [[ "$userchoice" == "d" ]]; then
		if [ "$arch_desktop" = true ]; then
			arch_desktop=false
		else
			arch_desktop=true
		fi
	elif [[ "$userchoice" == "f" ]]; then
		if [ "$configs" = true ]; then
			configs=false
		else
			configs=true
		fi
	elif [[ "$userchoice" == "" ]]; then
		echo "Selection finalized"
	else
		echo "Unrecognized input"
	fi
done

# ---------------------------------
# Run the chosen setups
# ---------------------------------

echo "Running selected install scripts..."
mkdir -p $DATA_DIR/iris
setup_list="$DATA_DIR/iris/setup_list"
rm $setup_list # ignore last run (this is unwise and this whole thing should eventually be moved out into a separate script
touch $setup_list
if [ "$core" == true ]; then
	echo "Running core installs..."
	echo "core" >> $setup_list
	. $script_loc/core.sh
fi

if [ "$nvim" == true ]; then
	echo "Running nvim install..."
	echo "nvim" >> $setup_list
	. $script_loc/nvim.sh
fi

if [ "$arch_desktop" == true ]; then
	echo "Running arch linux desktop installs..."
	echo "arch_desktop" >> $setup_list
	. $script_loc/arch_desktop.sh
fi

if [ "$configs" == true ]; then
	echo "Running config file setups..."
	echo "configs" >> $setup_list
	. $script_loc/configs.sh
fi

# NOTE: bin isn't optional! I need my tools!
echo "Running bin installs..."
echo "bin" >> $setup_list
. $script_loc/bin.sh
