#!/bin/bash

# Core software I need on any system and any setup
# ----------------------------------
# git - I do almost all coding through git VCS
# python - the best language! Many of my tools are written in python, this isn't optional
# tmux - the only acceptable terminal multiplexer
# vim - the only acceptable terminal editor
# python-pip - I gotta be able to install python stuff
# htop - top is awful and unusable by itself

C_RED="\033[0;31m"
C_RESET="\033[0m"

echo "Preparing to run core system software installation..."

echo "Collecting system information..."
. /etc/os-release

if [ "$NAME" == "Arch Linux" ]; then
	echo "Running core system software installs for Arch Linux..."
	sudo pacman --noconfirm -S \
		git \
		python \
		python-pip \
		tmux \
		vim \
		htop
	
elif [ "$NAME" == "Ubuntu" ]; then
	echo "Running core system software installs for Ubuntu..."
	sudo apt-get install -y \
		git \
		python \
		python-dev \
		python-pip \
		python3-dev \
		python3-pip \
		tmux \
		vim \
		htop
	
elif [ "$NAME" == "Raspbian GNU/Linux" ]; then
	echo "Running core system software installs for Raspbian..."
	sudo apt-get install -y \
		git \
		python \
		python-pip \
		python-dev \
		python3-dev \
		python3-pip \
		tmux \
		vim \
		htop
	
elif [ "$NAME" == "Debian GNU/Linux" ]; then
	echo "Running core system software installs for Debian..."
	sudo apt-get install -y \
		git \
		python \
		python-pip \
		python-dev \
		python3-dev \
		python3-pip \
		tmux \
		vim \
		htop
	
else 
	echo -e "${C_RED}ERROR - Unsure how to install on $NAME${C_RESET}"
	# TODO: handle this
fi
echo "Core system software installs complete!"

