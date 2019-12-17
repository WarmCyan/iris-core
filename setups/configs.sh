#!/bin/bash

# copy over my various config files
# ------------------------------
# .bashrc
# .vimrc (also nvim config)
# .tmux.conf

# TODO: there should be some file that can be sourced to get commonly used paths (instead of requiring script_loc)
# TODO: theming
# TODO: use data dir to see if there are any recorded changes (maybe one system doesn't want a tmux conf, or has to run it differently, or something like that)

# NOTE: For quickly testing a local install, simply run this setup script from in the lab/iris-core (since all locs are relative to where this setup script is)

script_loc=$(dirname $0)

# ---------------------------------
# Bash
# ---------------------------------

echo -e "Ensuring bash configuration..."

# copy files over
cp $script_loc/../bash/.bashrc $HOME
cp $script_loc/../bash/.colors $HOME # TODO: where does this actually get used?

mkdir -p $DATA_DIR/extras/ascii
cp $script_loc/../bash/AsciiLogo.txt $DATA_DIR/extras/ascii

# set up locally sourced configs
touch $CONF_DIR/.bashrc_l
touch $CONF_DIR/.bashrc_profile_l # TODO: don't think this actually gets sourced since I have no bash profile?

# ---------------------------------
# Neovim
# ---------------------------------

echo -e "Ensuring vim/neovim configuration..."

cp $script_loc/../vim/.vimrc $HOME

mkdir -p $HOME/.config/nvim
cp $script_loc/../vim/init.vim $HOME/.config/nvim

# ---------------------------------
# Tmux
# ---------------------------------

echo -e "Ensuring tmux configuration..."

cp $script_loc/../tmux/.tmux.conf $HOME

# set up locally sourced configs
touch $CONF_DIR/.tmux.conf_l
