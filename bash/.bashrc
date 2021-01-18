#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pacman='pacman --color=auto'

alias less='less -r'

#alias clock='tty-clock -bscrn -C 4'

#alias neofetch='neofetch --ascii_colors 4 4 --colors 4 7 7 4'
#alias neofetch='neofetch --ascii_colors 4 8 --colors 4 7 7 4'



# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
export EDITOR=vim


function cd {
	builtin cd "$@" && ls -F
}

# make a fun font (this only applies to tty)
setfont Lat2-Terminus16

# get colors 
[[ -f ~/.colors ]] && . ~/.colors

# fun prompt!
normal="\[\e[0m\]"
bold="\[\e[1m\]"

#lightblue="\[\e[1;34m\]"
#lightyellow="\[\e[1;33m\]"
#lightgreen="\[\e[1;32m\]"
#lightpurple="\[\e[1;35m\]"
#lightcyan="\[\e[1;36m\]"
#lightwhite="\[\e[1;1m\]"

#red="\[\e[0;31m\]"
#green="\[\e[0;32m\]"
#yellow="\[\e[0;33m\]"
#blue="\[\e[0;34m\]"
#purple="\[\e[0;35m\]"
#cyan="\[\e[0;36m\]"
#grey="\[\e[0;37m\]"

red=1
green=2
yellow=3
blue=4
purple=5
cyan=6
grey=7

# default
primary_color=$blue

# for themer
# primary_color=$red
# primary_color=$green
# primary_color=$yellow
# primary_color=$blue
# primary_color=$purple
# primary_color=$cyan
# primary_color=$grey

primary_color_code="\[\e[0;3${primary_color}m\]"

case $primary_color in
1)
	primary_color_text="red"
	;;
2)
	primary_color_text="green"
	;;
3)
	primary_color_text="yellow"
	;;
4)
	primary_color_text="blue"
	;;
5)
	primary_color_text="magenta"
	;;
6)
	primary_color_text="cyan"
	;;
7)
	primary_color_text="white"
	;;
esac

#export PS1="${purple}\t ${lightyellow}\w\n\u@\h ${green}[${lightgreen}\#${green}] $ "
#export PS1="[${blue}\u@\h \W${normal}]$ "
#PS1="[${blue}\t ${blue}\u${normal}@${lightblue}\h${blue} \w${normal}]$ "
#PS1="[${yellow}\t ${yellow}\u${normal}@${lightyellow}\h${yellow} \w${normal}]$ "
#PS1="[${blue}\t ${blue}\u${normal}@${lightblue}\h${blue} \w${normal}]$ "

#PS1="[${blue}\t${normal}] ${blue}\u${normal}@${lightblue}\h${blue} \w${normal} $ "

#PS1="┌[${yellow}\t${normal}] ${blue}\u${normal}@${lightblue}\h${lightyellow} \w${normal}\n└┤$ "
#PS1="┌[${cyan}\t${normal}] ${cyan}\u${normal}@${lightcyan}\h${cyan} \w${normal}\n└─┤$ "

PS1="[${primary_color_code}\t${normal}] ${primary_color_code}\u${normal}@${primary_color_code}${bold}\h${primary_color_code} \w${normal} $ " 


alias clock="tty-clock -bscrn -C $primary_color"
alias neofetch="neofetch --ascii_colors $primary_color 7 --colors $primary_color 7 7 $primary_color 7 7"
alias cmatrix="cmatrix -ab -C $primary_color_text -u 6"
alias lab="cd ~/lab"
alias scratch="cd ~/lab/_env/scratchpad"

# get environment variables
[[ -f ~/.env ]] && . ~/.env

# allow scripts in current directory to be run without './'
export PATH=".:$PATH"

clear

# print fun logo!
echo -e "\n"
#cat /home/dwl/data/extras/ascii/AsciiLogo.txt
cat $DATA_DIR/extras/ascii/AsciiLogo.txt
echo -e "\n\n"

# variable things
#PS1='[\u@\h \W]\$ '


#alias lock="i3lock -B 5 -e --indicator --insidecolor=55555555 --insidewrongcolor=aa555555 --insidevercolor=5555aa55 --ringcolor=66667733 --ringvercolor=6666aa33 --ringwrongcolor=aa667733 --linecolor=55BBFFAA --keyhlcolor=55BBFFEE --textcolor=FFFFFF88 --radius 120 --separatorcolor=00000000 --veriftext='Verifying...' --wrongtext='ACCESS DENIED' --textsize=20 --modsize=1"

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ll='ls -lAh --color=auto'

# safety net:
# do not delete / or prompt if deleting more than 3 files at a time
alias rm='rm -Iv --preserve-root'
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias df='df -h'
alias du='du -ch'
alias cp='cp -v'
alias mv='mv -v'

alias c='clear'

# ranger
alias r='ranger --choosedir=$DATA_DIR/rangerdir; LASTDIR=`cat $DATA_DIR/rangerdir`; echo "$LASTDIR"; cd "$LASTDIR"'

# vim
alias v='nvim'
alias sv='sudo vim'

# tmux 
alias tn='tmux new-session -s'
alias ta='tmux attach -t'
alias tl='tmux ls'
alias tk='tmux kill-session -t'
alias tc='tmux new-session -t' # NOTE: this makes a 'copy' of the named session, but allows each tmux session to be in different windows at the same time

# git
alias g='git status'
alias ga='git add -A'
alias gc='git commit -a'
alias gu='git push'
alias gd='git pull'
alias gl='git log --oneline -n 10'

alias q='exit'

alias sudo='sudo ' # apparently this helps if you use an alias after a sudo
alias s='sudo !!'

alias mx='chmod +x'

alias h='notify-send -t 30000 "$(alias)"'

function search()
{
	term=$1
	w3m google.com/search?query=${term// /+}
}

alias kse="kofi-search-edit"
alias kc="kofi-create-note"
alias kso="kofi-search-open"

#alias alert='notify-send -i "$([ $? = 0 ] && echo terminal || echo error)" "$([ $? = 0 ] && echo \"[completed]\" || echo \"[FAILED]\") $(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias alert='notify-send "$([ $? = 0 ] && echo [completed] || echo [FAILED]) $(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# extract things. Thanks to urukrama, Ubuntuforums.org	
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


alias qd='cd $(ls -d */ | peco --layout bottom-up)'

	
# fix encoding issues
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

[[ -f /usr/share/fzf/key-bindings.bash ]] && . /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/fzf/completion.bash ]] && . /usr/share/fzf/completion.bash

[[ -f $CONF_DIR/.bashrc_l ]] && . $CONF_DIR/.bashrc_l
#[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

