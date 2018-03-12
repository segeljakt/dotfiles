###############################################################################
#     File Name           :     .zshrc                                        #
#     Created By          :     Klas Segeljakt                                #
#     Creation Date       :     [2017-01-04 17:09]                            #
#     Last Modified       :     [2017-10-06 21:47]                            #
#     Description         :     Bash profile.                                 #
###############################################################################
############################### STARTUP COMMANDS ##############################
if [ "$TMUX" = "" ]; then /usr/local/bin/tmux; exit; fi
stty -ixon -ixoff # ixon = allow <C-s>, ixoff = allow <C-q>
################################### PATHS #####################################
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/Cellar/ctags/5.8_1/bin:$PATH"
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:$PATH"
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"
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
################################ OH-MY-ZSH ####################################
export ZSH=$HOME/.oh-my-zsh
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
#ENABLE_CORRECTION="true"
#COMPLETION_WAITING_DOTS="true"
plugins=(
  sudo # Press <ESC> twice for sudo
  autojump # Jump to frequently used directories
  git # Adds many git aliases
  gitfast # Faster git completions
  git-extras # Autofill authors/
  osx # tab, ofd, pfd, pfs, cdf, pushdf, quick-look, showfiles, spotify
  gem # Completion for gem (Ruby)
  pip # Completion for pip (Python)
  npm # Completion for npm (Javascript)
  #alias-tips # Remind about aliases (LAG)
  #chucknorris # Chucknorris quotes
  #nyan # Nyancat
)
source $ZSH/oh-my-zsh.sh
#[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
bindkey -M menuselect '^M' .accept-line # Press enter once on autocomplete
setopt menu_complete; # Press tab twice to autocomplete
###################################### ZSH ####################################
export LESS="--ignore-case"
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
#unsetopt listambiguous
############################## VISUAL APPEARANCE ##############################
# Visual appearance
#export PS1="- "
export PS1="%F{red}%D{%H:%M:%S}%f "
export TERM=xterm-color
################################### ALIASES ###################################
# Fixes
alias gdb="sudo gdb" # gdb
alias cgdb="sudo cgdb"
alias htop="sudo htop" # htop
alias bug="nvim ~/.bugs" # Report bugs
alias mkdir="mkdir -pv" # Make parent directories
alias make="clear && make"
alias zathura="zathura --fork" # Run zathura in background
# Overrides
alias ls="exa"
alias grep="rg"
alias find="fd"
alias tree="tree-rs"
alias time="tally"
alias top="htop"
# Shortcuts
alias v="nvim"
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
alias zzz="nvim ~/.cheat-sheet"
alias rv="source ~/.zshrc" # Source ~/.zshrc
alias avril="ssh klasseg@avril.sys.ict.kth.se" # avril
alias pk="~/Git/other-projects/pancake/pk" # Pancake
alias pi="mosh pi@192.168.1.4 -- tmux a" # Raspberry pi ssh
alias pubpi="ssh pi@79.142.73.16" # Raspberry pi ssh
alias g="scp -r pi@192.168.1.4:'/media/pi/TeraDrive/finished/uncategorized/*' ~/Torrents/ && ssh pi@192.168.1.4 'rm -rf /media/pi/TeraDrive/finished/uncategorized/*'"
alias hi="pbpaste | highlight --syntax=rs -O rtf | pbcopy" # Highlight code
alias o="n-options"
alias clip="pbpaste > clip.c && gcc clip.c && ./a.out && rm clip.c a.out"
alias j9="export JAVA_HOME=`/usr/libexec/java_home -v 9`; java -version"
alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"
alias p="spotify play"
# Disabled
#alias g="rsync -zvh" # Get downloads from pi
#alias j7="export JAVA_HOME=`/usr/libexec/java_home -v 1.7`; java -version"
#alias tsu="ssh login-t2.g.gsic.titech.ac.jp -l 17R51509" # RIP Tsubame
################################# KEYBINDINGSS ################################
stty werase undef # Unbind C-w
bindkey -s '^l' '\C-a clear; ls; echo"\C-e"\C-m \C-m'
bindkey -s '^f' '\C-a fg \C-e \C-m \C-m'
bindkey -s '^r' '\C-a hh \C-e \C-m \C-m'
bindkey -s 'ü' '\C-a u \C-e \C-m \C-m'
#bindkey -s '^å' ' \eq cd .. && pwd^M' # Does not work
bindkey -s '^g' ' \eq stty sane^M'
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
export HISTSIZE=$HISTFILESIZE
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
source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
