############################### STARTUP COMMANDS ##############################
if [ "$TMUX" = "" ]; then /usr/local/bin/tmux; exit; fi
stty -ixon -ixoff # Ubbind <C-s> and <C-q>
stty werase undef # Unbind <C-w>
################################### PATHS #####################################
export PATH="$PATH:/usr/local/opt/bison/bin"
export PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin"
export PATH="$PATH:/Users/Klas/.cargo/bin"
export PATH="$PATH:/Library/TeX/texbin"
export PATH="$PATH:/usr/local/opt/ncurses/bin"
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin"
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.4/bin"
export PATH="$PATH:/usr/local/Cellar/ctags/5.8_1/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/bin"
export GOPATH="$HOME/Git/go/"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/X11/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/Cellar/cairo/1.12.16/lib/pkgconfig/"
export MANPATH="$MANPATH:/usr/local/opt/coreutils/libexec/gnuman"
export LD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$LD_LIBRARY_PATH
################################### ALIASES ###################################
# Files
alias   bug="nvim ~/.bugs"
alias  note="nvim ~/Thesis/papers/quick-notes.md"
alias    re="mvim ~/Thesis/docs/report/README.md"
alias  todo="nvim ~/.todo"
# Fixes
alias   gdb="sudo gdb"
alias  cgdb="sudo cgdb"
alias  htop="sudo htop"
alias mkdir="mkdir -pv" # Make parent directories
alias  make="clear && make"
alias  zath="zathura --fork" # Run zathura in background
# Overrides
alias    ls="exa --group-directories-first"
alias  grep="rg"
alias  find="fd --no-ignore"
alias  tree="tree-rs"
alias  time="tally"
alias   top="htop"
alias   cat="bat --theme TwoDark --style=plain"
# Shortcuts
alias    xp="xpanes"
alias     v="nvim"
alias   anw="ansiweather -l Stockholm -f 3 -a 1 -s 1" # Weather
alias    ip="ifconfig | grep \"inet \" | grep -v 127.0.0.1" # IP
alias    sl="~/Git/my-projects/tsl/tsl Hallonbergen Kista" # Time to school
alias   tsl="~/Git/my-projects/tsl/tsl" # Time to somewhere else
alias     t="synonyms" # translate
alias    tt="trans" # translate
alias     u="upgrade_all"
alias     i="~/Git/my-projects/brew/brewbox.sh" # Brew info
alias     a="brew search"
alias    ii="brew install"
alias     r="brew cleanup --force"
alias     c="clear"
alias     z="nvim ~/.zshrc"
alias    zz="nvim ~/.tmux.conf"
alias   zzz="nvim ~/.config/nvim/init.vim"
alias  zzzz="nvim ~/.cheat-sheet"
alias    rv="source ~/.zshrc"
alias avril="ssh klasseg@avril.sys.ict.kth.se" # avril
alias    pi="mosh pi@192.168.1.4 -- tmux a" # Raspberry pi ssh
alias     g="fetch_downloads"
alias   hir="pbpaste | highlight --syntax=rs -O rtf | pbcopy" # Highlight code (Rust)
alias   his="pbpaste | highlight --syntax=scala -O rtf | pbcopy" # Highlight code (Scala)
alias     o="n-options"
alias    j9="export JAVA_HOME=`/usr/libexec/java_home -v 9`; java -version"
alias    j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"
############################### SYSTEM VARIABLES ##############################
export         LESS="-R -I -j.3 -J -Q -s -x4 -y2 -F"
export          PS1="%F{red}%D{%H:%M:%S}%f "
export         TERM=xterm-color
export       EDITOR=nvim
export       LC_ALL=en_US.UTF-8
export         LANG=en_US.UTF-8
export HISTFILESIZE=1000
export     HISTSIZE=$HISTFILESIZE
export      FIGNORE=$FIGNORE:DS_Store
export   HISTIGNORE="ls";    # Ignore certain commands from history
############################# ZSH options #####################################
setopt HIST_IGNORE_SPACE;    # Do not save commands starting with space to history
setopt HIST_IGNORE_ALL_DUPS; # Ignore all duplicate commands
setopt noautoremoveslash
setopt menu_complete;        # Press tab twice to autocomplete
# Completion
autoload -Uz compinit
zmodload zsh/complist
fpath+=~/.zfunc
compinit
zstyle ':completion:*' special-dirs true      # Tabcomplete parent dir
zstyle ':completion:*' menu select            # Show menu selection
zstyle ':completion:*' verbose true           # Verbose completion results
zstyle ':completion:*' accept-exact-dirs true # Keep dirs and files separated
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
################################### FZF / SKIM ################################
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export SKIM_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
################################### Widgets ###################################
function upgrade_all { xpanes -d -e "brew upgrade --cleanup" "rustup update" "cargo install-update -a" }
function fetch_downloads {
  scp -r pi@192.168.1.4:'/media/pi/TeraDrive/finished/uncategorized/*' ~/Torrents/ \
  && ssh pi@192.168.1.4 'rm -rf /media/pi/TeraDrive/finished/uncategorized/*'
}
function w-clear-ls  { zle -I; clear; ls             }
function w-fg        { zle -I; fg                    }
function w-cd-parent { zle -I; cd ..; clear; pwd; ls }
function w-help      { zle -I; cat ~/.help           }
function w-todo      { zle -I; nvim ~/.todo          }
function w-dot { # Support for ascending directories
  PREFIX=$BUFFER[1,$CURSOR]
  POSTFIX=$BUFFER[$CURSOR+1,-1]
  if [[ $BUFFER == "" || $PREFIX =~ ".* $" ]]; then
    BUFFER="$PREFIX./$POSTFIX";       CURSOR=$CURSOR+2; zle list-choices # " "
  elif [[ $PREFIX =~ ".*\.\./$" ]]; then
    BUFFER="$PREFIX../$POSTFIX";      CURSOR=$CURSOR+3; zle list-choices # ../
  elif [[ $BUFFER[1,$CURSOR] =~ ".*\./$" ]]; then
    BUFFER="$PREFIX[1,-2]./$POSTFIX"; CURSOR=$CURSOR+1; zle list-choices # ./
  else
    BUFFER="$PREFIX.$POSTFIX";        CURSOR=$CURSOR+1 # Default
  fi
}
function w-git-status {
  if [[ $#BUFFER == 0 ]]; then
    zle -I; clear
    git log
  else
    BUFFER="$BUFFER'"
    CURSOR=$CURSOR+1
  fi
}
function w-git-log {
  if [[ $#BUFFER == 0 ]]; then
    zle -I
    clear
    git status
  else
    BUFFER="$BUFFER¨"
    CURSOR=$CURSOR+1
  fi
}
function w-cd-or-expand {
  if [[ $#BUFFER == 0 ]]; then
    BUFFER="cd "
    CURSOR=3
    zle list-choices
  else
    zle expand-or-complete
  fi
}
zle -N w-cd-or-expand; zle -N w-clear-ls; zle -N w-fg;   zle -N w-cd-parent;
zle -N w-git-status;   zle -N w-git-log;  zle -N w-help; zle -N w-todo;
zle -N w-dot
################################# KEYBINDS ####################################
bindkey '\eq'  push-input
bindkey '^b'   vi-backward-blank-word
bindkey '^w'   vi-forward-blank-word
bindkey '^j'   history-beginning-search-forward
bindkey '^k'   history-beginning-search-backward
bindkey '^O'   accept-line
bindkey '^U'   undo
bindkey '^l'   w-clear-ls
bindkey '^f'   w-fg
bindkey '^[[Z' w-cd-parent
bindkey '^I'   w-cd-or-expand
bindkey "'"    w-git-status
bindkey '¨'    w-git-log
bindkey '.'    w-dot
bindkey -s '^N' "ranger ^M"
bindkey -M menuselect '^[[Z' reverse-menu-complete # Press enter once on autocomplete
bindkey -M menuselect '^I' expand-or-complete # Press enter once on autocomplete
#bindkey -s '^p' "sk --ansi -c 'fd --no-ignore' \C-m"
#bindkey -s '^p' "$(fzf) \C-m"
#bindkey -s '^g' "sk --ansi --exact -c 'rg --color=always --line-number \"{}\"' \C-m"

bindkey -s '^P' "rg --color=never --no-ignore --with-filename --no-heading --line-number "" . | fzf --delimiter=: --height 20 --reverse --tabstop=2 --nth=3 --algo=v1\C-m"
#bindkey -s '^P' "rg --color=never --no-ignore --with-filename --no-heading --line-number "" . | fzf --delimiter=: --height 20 --reverse --tabstop=2 --nth=3 --preview='tail -n +{2} {1}' \C-m"

#FZF_CTRL_P_COMMAND='rg --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
#
## CTRL-P - Paste the selected file path(s), based on contents, into the command line
#__fsel-contents() {
#  local cmd="${FZF_CTRL_P_COMMAND}"
#  setopt localoptions pipefail 2> /dev/null
#  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) -m "$@" | while read item; do
#    echo -n "${(q)item} "
#  done
#  local ret=$?
#  echo
#  return $ret
#}
#
#__fzf_use_tmux__() {
#  [ -n "$TMUX_PANE" ] && [ "${FZF_TMUX:-0}" != 0 ] && [ ${LINES:-40} -gt 15 ]
#}
#
#__fzfcmd() {
#  __fzf_use_tmux__ && echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
#}
#
#fzf-file-contents-widget() {
#  LBUFFER="${LBUFFER}$(__fsel-contents)"
#  local ret=$?
#  zle redisplay
#  typeset -f zle-line-init >/dev/null && zle zle-line-init
#  return $ret
#}
#zle     -N   fzf-file-contents-widget
#bindkey '^P' fzf-file-contents-widget
