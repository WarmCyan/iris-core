#!/bin/bash
# Copy over my various config files
# ------------------------------
# .bashrc
# .vimrc (also nvim config)
# .tmux.conf

# TODO: there should be some file that can be sourced to get commonly used paths (instead of requiring script_loc)
# TODO: theming
# TODO: use data dir to see if there are any recorded changes (maybe one system doesn't want a tmux conf, or has to run it differently, or something like that)

# NOTE: For quickly testing a local install, simply run this setup script from in the lab/iris-core (since all locs are relative to where this setup script is)

# NOTE: some minimal set of config files are not registered so that if something goes wrong I'm not completely hosed. (If writing an evac script, can deal with this there)

script_loc=$(dirname $0)
setup_list="$DATA_DIR/iris/setup_list"
setup_registry="$DATA_DIR/iris/configs_setup_registry"

# if there was previous file listing installed files, remove all of them
if [ -f $setup_registry ]; then
	echo "Cleaning all files on previous config registry..."
	rm -rfd $(cat $setup_registry) > /dev/null 2>&1
	rm $setup_registry
fi
touch $setup_registry # rm and touch to "empty" it


function register {
	echo $1 >> $setup_registry
}


# ---------------------------------
# Bash
# ---------------------------------

echo -e "Ensuring bash configuration..."

bash_setup=$script_loc/../bash

# copy files over
cp $bash_setup/.bashrc $HOME
cp $bash_setup/.colors $HOME # TODO: where does this actually get used?
# register $HOME/.bashrc
register $HOME/.colors

mkdir -p $DATA_DIR/extras/ascii
cp $bash_setup/AsciiLogo.txt $DATA_DIR/extras/ascii

# set up locally sourced configs 
# NOTE: locally sourced config files don't get touched, don't add them to registry!
touch $CONF_DIR/.bashrc_l
touch $CONF_DIR/.bashrc_profile_l # TODO: don't think this actually gets sourced since I have no bash profile?

# ---------------------------------
# Neovim
# ---------------------------------

echo -e "Ensuring vim/neovim configuration..."

vim_setup=$script_loc/../vim

cp $vim_setup/.vimrc $HOME
# register $HOME/.vimrc

mkdir -p $HOME/.config/nvim
cp $vim_setup/init.vim $HOME/.config/nvim
register $HOME/.config/nvim

# ---------------------------------
# Tmux
# ---------------------------------

echo -e "Ensuring tmux configuration..."

tmux_setup=$script_loc/../tmux

cp $tmux_setup/.tmux.conf $HOME
register $HOME/.tmux.conf

# set up locally sourced configs
touch $CONF_DIR/.tmux.conf_l


# !!!! DESKTOP ONLY BELOW !!!!

if [ `grep "arch_desktop" $setup_list` ]; then
	
	# ---------------------------------
	# Desktop Environment
	# ---------------------------------

	echo -e "Ensuring desktop environment configuration..."

	de_setup=$script_loc/../de
	
	# -- x11
	
	echo -e "\t- X11"

	cp $de_setup/.Xmodmap $HOME
	cp $de_setup/.Xresources $HOME
	cp $de_setup/.xbindkeysrc $HOME
	cp $de_setup/.xinitrc $HOME
	register $HOME/.Xmodmap
	register $HOME/.Xresources
	register $HOME/.xbindkeysrc
	# register $HOME/.xinitrc
	
	# -- i3
	
	echo -e "\t- i3"

	mkdir -p $HOME/.i3
	cp $de_setup/i3/config $HOME/.i3

	# set up locally sourced configs
	touch $CONF_DIR/.Xresources_l
	touch $CONF_DIR/.xinitrc_l
	
	# -- i3blocks (bar)

	echo -e "\t- i3blocks"

	cp $de_setup/.i3blocks.conf $HOME
	register $HOME/.i3blocks.conf

	mkdir -p $BIN_DIR/barmetrics
	register $BIN_DIR/barmetrics

	cp $de_setup/barmetrics/* $BIN_DIR/barmetrics
	
	# -- dunst (notifications)
	
	echo -e "\t- dunst"
	
	mkdir -p $HOME/.config/dunst
	register $HOME/.config/dunst

	cp $de_setup/dunstrc $HOME/.config/dunst
fi
