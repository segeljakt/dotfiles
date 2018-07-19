#: STARTUP
if [ "$TMUX" = "" ]; then /usr/local/bin/tmux; exit; fi
stty -ixon -ixoff werase undef # Unbind <C-s> <C-q> <C-w>
#: PATHS
export PATH="$PATH:/usr/local/opt/bison/bin"
export PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin"
export PATH="$PATH:/Users/klassegeljakt/.cargo/bin"
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
#: HOOKS
function chpwd() {
  emulate -L zsh
  tmux refresh-client
  #ls
  #export PS1="%F{yellow}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f$ "
}
#: ALIASES
# Files
alias   bug="nvim ~/.bugs"
alias  todo="nvim ~/.todo"
# Fixes
alias   gdb="sudo gdb"
alias  cgdb="sudo cgdb"
alias  htop="sudo htop"
alias mkdir="mkdir -pv" # Make parent directories
alias  make="clear && make"
alias  zath="zathura --fork" # Run zathura in background
# Git
alias    gp="git push"
alias    gc="git commit"
alias   gcl="git clone"
alias    gg="git pull"
# Overrides
alias    ls="exa --group-directories-first"
alias  grep="rg"
alias  find="fd --no-ignore"
alias  tree="tree-rs"
alias  time="tally"
alias   top="htop"
alias   cat="bat --theme TwoDark --style=plain"
alias    vi="nvim"
alias   vim="nvim"
# Shortcuts
alias   ...=../..
alias  ....=../../..
alias .....=../../../..
alias  comp="~/.zsh/zsh-completion-generator/help2comp.py"
alias    xp="xpanes"
alias     v="nvim"
alias     t="trans" # translate
alias     u="w-upgrade-all"
alias     a="brew search"
alias     i="brew info"
alias    ii="brew install"
alias     r="brew cleanup --force"
alias     c="clear"
alias     z="nvim ~/.zshrc"
alias    zz="nvim ~/.tmux.conf"
alias   zzz="nvim ~/.config/nvim/init.vim"
alias  zzzz="nvim ~/.cheat-sheet"
alias    zx="nvim ~/.zsh/widgets.zsh"
alias    rv="source ~/.zshrc"
alias avril="ssh klasseg@avril.sys.ict.kth.se" # avril
alias    pi="mosh pi@192.168.1.4 -- tmux a" # Raspberry pi ssh
alias     g="fetch_downloads"
alias   hir="pbpaste | highlight --syntax=rs    -O rtf | pbcopy" # Highlight code (Rust)
alias   his="pbpaste | highlight --syntax=scala -O rtf | pbcopy" # Highlight code (Scala)
alias     o="n-options"
#: SYSTEM VARIABLES
#export         LESS="-R -I -j.3 -J -Q -s -x4 -y2 -F"
export         LESS="-R"
export          PS1="%F{red}%D{%H:%M:%S}%f "
#export         TERM=xterm-color
export       EDITOR=nvim
export       LC_ALL=en_US.UTF-8
export         LANG=en_US.UTF-8
export HISTFILESIZE=1000
export     HISTSIZE=$HISTFILESIZE
export      FIGNORE=$FIGNORE:DS_Store
export   HISTIGNORE="ls";    # Ignore certain commands from history
#: OPTIONS
setopt AUTO_CD;              # CD to directory
setopt CDABLE_VARS;          # Prepend ~
setopt NO_AUTOREMOVESLASH;
setopt MENU_COMPLETE;        # Press tab twice to autocomplete
setopt INC_APPEND_HISTORY;
setopt LIST_PACKED;
setopt HIST_IGNORE_SPACE;    # Don't save commands starting with space to history
setopt HIST_IGNORE_ALL_DUPS; # Ignore all duplicate commands
#setopt EXTENDED_HISTORY;     # Store time of each command
setopt HIST_FCNTL_LOCK;      # Faster history performance
setopt HIST_NO_FUNCTIONS;    # Do not store function definitions in history
setopt HIST_REDUCE_BLANKS;   # Remove whitespace from history commands
setopt HIST_SAVE_NO_DUPS;    # Omit saving old commands
setopt SHARE_HISTORY;        # Share history between shells
#setopt CORRECT;              # Try to correct spelling errors
#setopt CORRECT_ALL;          # Even for arguments
setopt INTERACTIVE_COMMENTS; # Allow interactive comments in shell
setopt PROMPT_SUBST;         # Allow stuff in prompts
setopt TRANSIENT_RPROMPT;    # Clear RPS1 when accepting command
#: CUSTOM OPTIONS
FZF_HEIGHT=20

#: COMPLETION
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
zmodload zsh/complist
compinit
zstyle ":completion:*:" format "%B%d%b"
zstyle ':completion:*' menu select=2
zstyle ':completion:*' special-dirs true      # Tabcomplete parent dir
zstyle ':completion:*' menu select            # Show menu selection
#zstyle ':completion:*' verbose true           # Verbose completion results
zstyle ':completion:*' accept-exact-dirs true # Keep dirs and files separated
#: SOURCES
source ~/.zsh/widgets.zsh
source ~/.zsh/scripts/alien.zsh
source ~/.zsh/scripts/start-spotify.zsh
source ~/Git/github/zsh-autopair/autopair.zsh
source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
source ~/.zsh/zsh-completion-generator/zsh-completion-generator.plugin.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
#: KEYBINDS
# Custom widgets
bindkey '^O'   w-bin
bindkey '^I'   w-cd-or-expand
bindkey '^L'   w-clear-ls
bindkey '^Z'   w-fg
bindkey '^[[Z' w-cd-parent
bindkey "'"    w-git-status
bindkey '¨'    w-git-log
bindkey '…'    w-dot
bindkey '^P'   w-contents
bindkey '^R'   w-ranger
bindkey '^T'   w-file
bindkey 'ä'    w-cal-agenda
bindkey 'Ä'    w-cal-week
bindkey '^M'   w-enter
bindkey '^Y'   w-copy
bindkey '.'    w-single-dot
bindkey '~'    w-working-dir
bindkey 'ü'    w-upgrade-all
bindkey '/'    w-slash
bindkey '°'    w-toggle-exact
bindkey 'ı'    w-clear # <C-I>
bindkey '’'    w-clear # <C-M> TODO: Mail
bindkey '^N'   w-clear # TODO: IRC
# Builtin widgets
bindkey '\eq'  push-input
bindkey '^Q'   push-line-or-edit
bindkey '^B'   vi-backward-blank-word
bindkey '^W'   vi-forward-blank-word
bindkey '^J'   history-beginning-search-forward
bindkey '^K'   history-beginning-search-backward
bindkey 'ª'    undo
bindkey '√'    redo
bindkey '^G'   run-help
bindkey '^E'   end-of-line       # <C-e>
bindkey 'Ö'    beginning-of-line # <C-E>
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -M menuselect '^I'   menu-expand-or-complete
