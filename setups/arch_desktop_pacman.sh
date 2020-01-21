#!/bin/bash

# All the software I normally run on an arch desktop

# TODO: rename file to "package definitions"
# TODO: where does "maim" go?

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

# python and pip installs
add "python"
add "python-pip"
add "python2"
add "python2-pip"


# ---------------------------------
# Terminal utilities
# ---------------------------------

# tool to print out system info
add_aur "neofetch"

# pretty console clock printout
add_aur "tty-clock"

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
add "xbindkeys"

# window manager
add_aur "i3-gaps"

# system bar
add_aur "i3blocks-gaps-git"

# lock screen
add_aur "i3lock-color-git"

# compositor
add "compton"

# notification/toast display
add "dunst"


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


# ---------------------------------
# Desktop applications
# ---------------------------------

# sound control panel
add "pavucontrol"

# file explorer
add "pacmanfm"

# web browsers
add "firefox"
add "chromium"

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


# ---------------------------------
# Fonts
# ---------------------------------

# droid sans mono and related
add "ttf-droid"

# windows fonts
add_aur "ttf-ms-fonts"
add_aur "ttf-vista-fonts"

# font awesome for icons
add_aur "ttf-font-awesome-4"
