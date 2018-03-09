###############################################################################
#     File Name           :     .zshrc                                        #
#     Created By          :     Klas Segeljakt                                #
#     Creation Date       :     [2017-01-04 17:09]                            #
#     Last Modified       :     [2017-10-06 21:47]                            #
#     Description         :     Bash profile.                                 #
###############################################################################
############################### STARTUP COMMANDS ##############################
# Commands run on startup
stty -ixon
############################## VISUAL APPEARANCE ##############################
# Visual appearance
#export PS1="- "
export PS1="%F{red}[%D{%H:%M:%S}]%f "
export TERM=xterm-color
################################### SOURCE ####################################
PATH="/usr/local/Cellar/ctags/5.8_1/bin:$PATH"
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:$PATH"
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/opt/ncurses/bin:$PATH"
PATH="/Library/TeX/texbin:$PATH"
PATH="/Users/Klas/.cargo/bin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
GOPATH="$HOME/Git/go/"
PKG_CONFIG_PATH="/usr/local/Cellar/cairo/1.12.16/lib/pkgconfig/:$PKG_CONFIG_PATH"
PKG_CONFIG_PATH="/usr/X11/lib/pkgconfig:$PKG_CONFIG_PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export PATH
export GOPATH
export PKG_CONFIG_PATH
export CPATH
export MANPATH
################################### ALIASES ###################################
# Fixes
alias gdb="sudo gdb" # gdb
alias cgdb="sudo cgdb"
alias htop="sudo htop" # htop
alias bug="nvim ~/.bugs" # Report bugs
alias mkdir="mkdir -pv" # Make parent directories
alias make="clear && make"
alias zathura="zathura --fork" # Run zathura in background
# Overloads
alias ls="exa"
alias grep="rg"
alias find="fd"
alias tree="tree-rs"
alias time="tally"
alias top="htop"
# Shortcuts
alias anw="ansiweather -l Stockholm -f 3 -a 1 -s 1" # Weather
alias ip="ifconfig | grep \"inet \" | grep -v 127.0.0.1" # IP
alias sl="~/Git/my-projects/tsl/tsl Hallonbergen Kista" # Time to school
alias tsl="~/Git/my-projects/tsl/tsl" # Time to somewhere else
alias t="trans" # translate
alias u="brew upgrade --cleanup && rustup update && cargo install-update -a" # Update
alias i="~/Git/my-projects/brew/brewbox.sh" # Brew info
alias a="brew search" # Brew search
alias ii="brew install" # Brew install
alias r="brew cleanup --force" # Cleanup brew
alias c="clear" # Clear
alias z="nvim ~/.zshrc" # Edit ~/.zshrc
alias zz="nvim ~/.tmux.conf" # Edit ~/.tmux.conf
alias rv="source ~/.zshrc" # Source ~/.zshrc
alias avril="ssh klasseg@avril.sys.ict.kth.se" # avril
alias pk="~/Git/other-projects/pancake/pk" # Pancake
alias pi="mosh pi@192.168.1.4 -- tmux a" # Raspberry pi ssh
alias pubpi="ssh pi@79.142.73.16" # Raspberry pi ssh
alias g="rsync -zvh" # Get downloads from pi
alias hi="pbpaste | highlight --syntax=rs -O rtf | pbcopy" # Highlight code
alias clip="pbpaste > clip.c && gcc clip.c && ./a.out && rm clip.c a.out"
alias j9="export JAVA_HOME=`/usr/libexec/java_home -v 9`; java -version"
alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"
# Disabled
#alias j7="export JAVA_HOME=`/usr/libexec/java_home -v 1.7`; java -version"
#alias g="scp -r pi@192.168.1.4:'/media/pi/TeraDrive/finished/uncategorized/*' ~/Torrents/ && ssh pi@192.168.1.4 'rm -rf /media/pi/TeraDrive/finished/uncategorized/*'"
#alias tsu="ssh login-t2.g.gsic.titech.ac.jp -l 17R51509" # RIP Tsubame
################################# KEYBINDINGSS ################################
stty werase undef # Unbind C-w
bindkey -s '^l' '\eq clear; ls; echo^M'
bindkey -s '^f' '\eq fg^M'
bindkey -s '^r' '\eq hh^M'
bindkey -s '^å' '\eq cd .. && pwd^M'
bindkey -s '^g' '\eq stty sane^M'
bindkey '\eq' push-input
bindkey '^q' vi-backward-blank-word
bindkey '^w' vi-forward-blank-word
bindkey '^j' history-beginning-search-forward
bindkey '^k' history-beginning-search-backward
bindkey '^t' expand-cmd-path
############################### SYSTEM VARIABLES ##############################
export EDITOR=nvim
export DIARY_DIR=~/.diary # diary
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export HISTFILESIZE=1000
export HISTSIZE=${HISTFILESIZE}
export FIGNORE=$FIGNORE:DS_Store
# add this configuration to ~/.bashrc
export HH_CONFIG=hicolor         # get more colors
#shopt -s histappend              # append new history items to .bash_history
#export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# Do not save commands starting with space to history
setopt HIST_IGNORE_SPACE
# Ignore all duplicate commands
setopt HIST_IGNORE_ALL_DUPS
# Ignore certain commands for history
export HISTIGNORE="ls"
# Tabcomplete parent dir
zstyle ':completion:*' special-dirs true
autoload -Uz compinit
fpath+=~/.zfunc
compinit
# History
#function zshaddhistory() { # {{{
#  # http://mollifier.hatenablog.com/entry/20090728/p1
#  local line cmd
#  line=${1%%$'\n'}
#  cmd=${line%% *}
#
#  # Add command to history if it meets the following conditions
#  [[ ${#line} -ge 5
#  && ${cmd} != (l|l[sal])
#  && ${cmd} != (c|cd)
#  && ${cmd} != (m|man)
#  && ${cmd} != (r[mr])
#  ]]
#} # }}}

# Defaults
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool YES

# FZF
# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi
#source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
