#!/bin/bash

# All the software I normally run on an arch desktop
# TODO: rename file to "package definitions"


pacman_pkgs=""
aur_pkgs=""

function add {
	pacman_pkgs="$pacman_pkgs $1"
}

function add_aur {
	aur_pkgs="$aur_pkgs $1"
}


# ---------------------------------
# System core
# ---------------------------------

# ssh server
add "openssh"

# network time protocol
add "ntp"

# hardware monitoring tools (?)
add "lm_sensors"

# power management
add "tlp"

# os devel utilities (one of which is required for makepkg to work)
add "base-devel"


# ---------------------------------
# Terminal utilities
# ---------------------------------

# tool to print out system info
add_aur "neofetch"

# pretty console clock printout
add_aur "tty-clock"

# badass matrix looking screensaver thing
add "cmatrix"

# pipes screensaver thing!!!
add_aur "bash-pipes"

# block letter printing
add "figlet"

# battery information
add "acpi"

# power usage reporting
add "powertop"

# network management (wifi etc)
add "networkmanager"

# terminal file explorer
add "ranger"

# terminal web browsers
add "lynx"
add "w3m"

# chat client
add "weechat"

# email client
add "mutt"

# better (but heavier) monitoring tool
add "glances"

# .zip archive extraction
add "unzip"

# better file transfer
add "rsync"


# ---------------------------------
# Desktop environment core
# ---------------------------------

# installs all of the xorg group things (server etc)
add "xorg"

# other xorg utilities
add "xorg-xinit"
add "xorg-xfontsel"
add "xorg-xmodmap"

# clipboard for xorg
add "xclip"

# bind specific commands to specific key combos, this is what allows the volume/media buttons in x11
# add "xbindkeys" # TODO: apparently this doesn't exist anymore? verify

# window manager
add_aur "i3-gaps"

# system bar
#add_aur "i3blocks-gaps-git"
add "i3blocks"

# lock screen
add_aur "i3lock-color-git"

# compositor
add "compton"

# notification/toast display
add "dunst"

# screenshot tool
add "maim"


# ---------------------------------
# Audio
# ---------------------------------

# sound utilities for ALSA
add "alsa-utils"

# pipeline based multimedia framework and various plugins and codecs
add "gstreamer"
add "gst-libav"
add "gst-plugins-base"
add "gst-plugins-good"
add "gst-plugins-bad"
add "gst-plugins-ugly"

# music backend
add "mpd"

# terminal mpd frontend/TUI
add "ncmpcpp"

# text-to-speech
add "espeak"


# ---------------------------------
# Desktop applications
# ---------------------------------

# sound control panel
add "pavucontrol"

# file explorer
add "pcmanfm"

# web browsers
add "firefox"
add "chromium"
add_aur "pdfjs" # assoc with firefox, renders pdfs in browse

# terminal (urxvt)
add "rxvt-unicode"

# application/etc launcher
add "rofi"

# best svg editor!
add "inkscape"

# best image editor!
add "gimp"

# document viewer
add "zathura"
add "zathura-pdf-mupdf"

# pdf viewer with form capabilities
add "okular"

# office suite
add "libreoffice-fresh"

# monitor/display setup utility
add "arandr"

# system theme picker
add "lxappearance"

# systeme theme pallete creator
add_aur "oomox"

# image viewer
add "feh"


# ---------------------------------
# Fonts
# ---------------------------------

# droid sans mono and related
add "ttf-droid"
add_aur "ttf-droid-sans-mono-slashed-powerline-git"

# windows fonts
add_aur "ttf-ms-fonts"
add_aur "ttf-vista-fonts"

# font awesome for icons
add_aur "ttf-font-awesome-4"


# ---------------------------------
# Developer tools
# ---------------------------------

# node package manager
add "npm"

# jupyter
add "jupyter-notebook"
add "jupyter-nbconvert"
add "jupyterlab"
add "python-ipywidgets"
