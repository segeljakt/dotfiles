###############################################################################
#     File Name           :     .bash_profile                                 #
#     Created By          :     Klas Segeljakt                                #
#     Creation Date       :     [2017-01-04 17:09]                            #
#     Last Modified       :     [2017-09-25 19:15]                            #
#     Description         :     Bash profile.                                 #
###############################################################################
############################### STARTUP COMMANDS ##############################
# Commands run on startup
stty -ixon
############################## VISUAL APPEARANCE ##############################
# Visual appearance
export PS1="- "
################################# System path #################################
PATH="/usr/local/Cellar/ctags/5.8_1/bin:${PATH}"
# Python 3.4
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
# Python 2.7
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# Local bin
PATH="/usr/local/bin:$PATH"
# Local sbin
PATH="/usr/local/sbin:$PATH"
# Ncurses version 5.7 --> 6.0
PATH="/usr/local/opt/ncurses/bin:$PATH"
# Go
GOPATH="$HOME/Git/go/"
# MacPorts
PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Package config path
PKG_CONFIG_PATH="/usr/local/Cellar/cairo/1.12.16/lib/pkgconfig/:${PKG_CONFIG_PATH}"
PKG_CONFIG_PATH="/usr/X11/lib/pkgconfig:${PKG_CONFIG_PATH}"
# coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# Export paths
export PATH
export GOPATH
export PKG_CONFIG_PATH
export CPATH
export MANPATH
################################### SETTINGS ##################################
export HISTCONTROL=ignoredups:erasedups
################################### ALIASES ###################################
# translate
alias t="trans"
# Display weather
alias anw="ansiweather -l Stockholm -f 3 -a 1 -s 1"
# Display IP
alias ip="ifconfig | grep \"inet \" | grep -v 127.0.0.1"
# Display time to school
alias sl="~/Git/my-projects/tsl/tsl Hallonbergen Kista"
alias tsl="~/Git/my-projects/tsl/tsl"
# Edit ~/.bash_profile and source
alias bp="vim ~/.bash_profile; source ~/.bash_profile; exit"
# Bugs
alias bug="vim ~/.bugs"
# Brew
alias bu="clear; brew upgrade --cleanup"
alias bi="clear; brew info"
alias bs="clear; brew search"
# Make parent directories
alias mkdir="mkdir -pv"
# top -> htop
alias top="htop"
# Edit bash_profile
alias bsh="mvim ~/.bash_profile"
# Source ~/.bash_profile
alias rv="source ~/.bash_profile"
# Make
alias make="clear && make"
# tsubame
alias tsu="ssh login-t2.g.gsic.titech.ac.jp -l 17R51509"
# avril
alias avril="ssh klasseg@avril.sys.ict.kth.se"
# Diet
alias diet="mvim ~/.diet"
# Pancake
alias pk="~/Git/other-projects/pancake/pk"
# Raspberry pi ssh
alias pi="ssh pi@192.168.1.15"
piput() {
    scp "$1" pi@192.168.1.15:"$2"
}
piget() {
    scp pi@192.168.1.15:"$1" "$2"
}
################################# KEYBINDINGSS ################################
# Unbind C-w
stty werase undef
bind -x '"\C-l": clear; ls -C; echo'
#bind -x '"\C-q": bu'
bind -x '"\C-f": fg'
bind -x '"\C-r": hh'
bind -x '"\C-p": cd .. && pwd'
############################### SYSTEM VARIABLES ##############################
# diary
export EDITOR=nvim
export DIARY_DIR=~/.diary
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export FIGNORE=$FIGNORE:DS_Store
# add this configuration to ~/.bashrc
export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
#export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
#BASHISHDIR="/usr/local/Cellar/bashish/2.2.4/share/bashish"      ## line added by bashish
#TTY=`tty 2>/dev/null` && if test "x$BASHISHDIR" != x;then       ## line added by bashish
#test "$BASHISH_OLDPATH"||BASHISH_OLDPATH="$PATH"                ## line added by bashish
#PATH="$HOME/.bashish/launcher:$BASHISHDIR/lib:$BASHISH_OLDPATH" ## line added by bashish
#BASHSISH_CP=437                                                 ## line added by bashish
#TEST_TERM="$TERM" _bashish_utfcheck && BASHISH_CP=utf8          ## line added by bashish
#ENV="$HOME/.profile"                                            ## line added by bashish
#export BASHISH_CP BASHISH_OLDPATH TTY ENV                       ## line added by bashish
#. "$BASHISHDIR/main/prompt/sh/init"                             ## line added by bashish
#fi                                                              ## line added by bashish

export PATH="$HOME/.cargo/bin:$PATH"
