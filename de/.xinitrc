# make sure font directories included correctly
xset +fp /usr/share/fonts/local/
xset +fp /usr/share/fonts/TTF/

# apply both global and local machine x configurations
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f $CONF_DIR/.Xresources_l ]] && xrdb -merge -I$HOME $CONF_DIR/.Xresources_l

# run any distinct local machine startup stuff
[[ -f $CONF_DIR/.xinitrc_l ]] && . $CONF_DIR/.xinitrc_l

# get the wallpaper up
~/.fehbg

# run all the keyboard modifiers
xmodmap ~/.Xmodmap &
xbindkeys &

# start the notification system
dunst &

# blue = 0 .4 .6
# green = 0 .6 .3
# default shadow = 12

shadow_opacity=0
shadow_red=0
shadow_green=0
shadow_blue=0

fade_time=0

#compton -CGfc --shadow-exclude '!focused' --shadow-red ${shadow_red} --shadow-green ${shadow_green} --shadow-blue ${shadow_blue} --shadow-offset-x -8 --shadow-offset-y -8 --shadow-opacity 0.6 --shadow-opacity ${shadow_opacity} --fade-delta ${fade_time} --backend xrender &

# compton -CGf --fade-delta ${fade_time} --backend xrender &

# start the WM
exec i3 
