#!/bin/bash

# This gets its own install because there's a lot involved and it might change as I add new things!
# NOTE: this assumes python is already installed

# TODO: since this is a setup that might get run multiple times, be sure to add some file to data to know that it should be updated when a command gets run?

# TODO: grab any additional packages (like python black etc)

C_RED="\033[0;31m"
C_RESET="\033[0m"

echo "Preparing to run neovim installation..."

echo "Collecting system information..."
. /etc/os-release

if [ "$NAME" == "Arch Linux" ]; then
	echo "Running neovim installation for Arch Linux..."
	sudo pacman -S \
		neovim \
		python-pynvim
	
elif [ "$NAME" == "Ubuntu" ]; then
	echo "Running neovim installation for Ubuntu..."
	sudo apt-get install -y \
		neovim \
		python-neovim \
		python3-neovim

	# if this failed, we must be on older version of ubuntu
	if [ $? -ne 0 ]; then
		echo "Neovim package install failed, attempting PPA method for older Ubuntu versions..."

		sudo apt-get install -y software-properties-common
		sudo add-apt-repository -y ppa:neovim-ppa/stable
		sudo apt-get update
		sudo apt-get install -y neovim
	fi
	
elif [ "$NAME" == "Raspbian GNU/Linux" ]; then
	echo "Running neovim installation for Raspbian..."
	# thanks to https://wilkins.tech/posts/neovim-raspberry-pi/
	sudo apt-get install -y \
		cmake \
		automake \
		libtool \
		libtool-bin \
		gettext

	git clone https://github.com/neovim/neovim.git $PKG_DIR/neovim
	pushd $PKG_DIR/neovim
		make -j8 CMAKE_BUILD_TYPE=RelWithDebInfo
		sudo make install
		sudo pip3 install neovim
	popd # /$PKG_DIR/neovim
	
elif [ "$NAME" == "Debian GNU/Linux" ]; then
	echo "Running neovim installation for Debian..."
	sudo apt-get install -y \
		neovim \
		python-neovim \
		python3-neovim
	
else 
	echo -e "${C_RED}ERROR - Unsure how to install nvim on $NAME${C_RESET}"
	# TODO: handle this
fi
echo "Neovim install complete!"
