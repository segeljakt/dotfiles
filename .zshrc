#zmodload zsh/zprof # top of your .zshrc file
#: STARTUP
export TERM=screen-256color
# if [ "$TMUX" = "" ]; then /usr/local/bin/tmux -u -2; exit; fi
stty -ixon -ixoff werase undef # Unbind <C-s> <C-q> <C-w>
#: PATHS
path=(
  /usr/local/sbin
  /opt/local/bin
  /opt/local/sbin
  /usr/local/opt/ncurses/bin
  /usr/local/lib/ruby/gems/2.6.0/bin
  $HOME/.local/bin
  $HOME/.cargo/bin
  $HOME/.cabal/bin
  $path
)
#: HOOKS
# function chpwd() {
#   tput sc
#   emulate -L zsh
#   tmux refresh-client
  #ls
  #export PS1="%F{yellow}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f$ "
# }
#: ALIASES
alias     g="nvim ~/.gym.md"
alias   tid="python3 ~/Workspace/other/tid/tid.py '$TID'"
# Files
alias   bug="nvim ~/.bugs"
alias  todo="nvim ~/.todo"
alias   com="nvim ~/.commands"
alias names="nvim ~/PhD/names"
# Fixes
#alias   gdb="sudo gdb"
alias  cgdb="sudo cgdb"
alias  htop="sudo htop"
alias mkdir="mkdir -pv" # Make parent directories
alias  make="clear && make"
alias  zath="zathura --fork" # Run zathura in background
alias emacs="open -a emacs"
# GUI
alias  mvim="skhd -k 'cmd + shift - k'; mvim"
# Git
alias    gp="git push"
alias   gpl="git pull"
alias    gc="git commit"
alias   gcl="git clone"
alias    gg="git pull"
# Overrides
alias    ls="lsd --group-dirs=first"
alias   lst="lsd --tree"
alias   lsa="lsd --date relative --all"
alias  grep="rg --no-ignore --hidden"
alias    rg="rg --no-ignore --hidden"
#alias  find="fd --no-ignore"
alias  tree="tree-rs"
alias  time="tally"
alias   top="htop"
alias   cat="bat --theme TwoDark --style=plain"
alias    vi="nvim"
#alias   vim="nvim"
alias   gcc="gcc-8"
# Shortcuts
alias     m="mvim --remote-tab-silent"
alias   ...=../..
alias  ....=../../..
alias .....=../../../..
alias  comp="~/.zsh/zsh-completion-generator/help2comp.py"
alias    xp="xpanes"
alias     v="nvim"
alias     t="trans -view" # translate
alias     u="w-upgrade-all"
alias     a="brew search"
alias     i="brew info"
alias    ii="brew install"
alias     r="brew cleanup"
alias     c="clear"
alias     z="nvim ~/.zshrc"
alias    zz="nvim ~/.tmux.conf"
alias   zzz="nvim ~/.config/nvim/init.vim"
alias  zzzz="nvim ~/.cheat-sheet"
alias    zx="nvim ~/.zsh/widgets.zsh"
alias   zxx="nvim ~/.skhd"
alias    rv="source ~/.zshrc"
alias avril="ssh klasseg@avril.sys.ict.kth.se" # avril
alias    pi="mosh pi@192.168.1.4 -- tmux a" # Raspberry pi ssh
alias   hir="pbpaste | highlight --syntax=rs    -O rtf | pbcopy" # Highlight code (Rust)
alias   his="pbpaste | highlight --syntax=scala -O rtf | pbcopy" # Highlight code (Scala)
alias   hiq="pbpaste | highlight --syntax=sql   -O rtf | pbcopy" # Highlight code (SQL)
alias     o="n-options"
alias    gl="git log --pretty"
alias    ed="ed -p'* '"
alias    sc="nvim ~/PhD/Plan.md"
alias    cb="cargo build --color always 2>&1 | less"
alias    ct="cargo test --color always 2>&1 | less"
alias   hdp="ssh klas@109.225.89.18 -p 8209"
#: ENV
export DYLD_LIBRARY_PATH="/Users/Klas/Workspace/python/weld/python/pyweld/weld/:/usr/local/lib/python3.7/site-packages/grizzly/"
export WELD_HOME="~/Workspace/weld/"
#export         LESS="-R -I -j.3 -J -Q -s -x4 -y2 -F"
export         LESS="-R"
export          PS1="%F{red}%D{%H:%M:%S}%f "
#export         TERM=xterm-color
export       EDITOR=nvim
export       LC_ALL=en_US.UTF-8
export         LANG=en_US.UTF-8
export HISTFILESIZE=5000 # Disk (BASH??)
export     HISTSIZE=5000 # Memory
export     SAVEHIST=5000 # Disk
export     HISTFILE=~/.zsh/hist
export     HISTSIZE=$HISTFILESIZE
export      FIGNORE=$FIGNORE:DS_Store
export   HISTIGNORE="ls";    # Ignore certain commands from history
export    WORDCHARS=""
export    LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home
export CARGO_HOME=~/.cargo/
# export CARGO_TARGET_DIR="/Users/Klas/.cargo/target/"
export CARGO_INCREMENTAL=1
export RANGER_LOAD_DEFAULT_RC=FALSE
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/libffi/lib/pkgconfig"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/gstreamer/lib/pkgconfig"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/gst-plugins-base/lib/pkgconfig"
#: OPTIONS
setopt AUTO_CD;              # CD to directory
setopt NO_AUTOREMOVESLASH;
setopt MENU_COMPLETE;        # Press tab twice to autocomplete
setopt INC_APPEND_HISTORY;   # Append to history immediately, not just on exit
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
setopt EXTENDED_GLOB;
#: CUSTOM OPTIONS
export FZF_HEIGHT=20
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_PREVIEW_COMMAND="~/.zsh/scripts/preview-file.zsh"
export FZF_EDIT_LINES_COMMAND="~/.zsh/scripts/edit-selected-lines.zsh"
export FZF_FILTERS='*.{c,h,cpp,rs,java,scala,py}'
export SCROLLBACK=10
#: SOURCES
#function zr_update {
  #zr load \
    #zsh-users/zsh-autosuggestions \
    #zdharma/fast-syntax-highlighting \
    #hlissner/zsh-autopair \
    #RobSis/zsh-completion-generator
#}
#source ~/.zr/init.zsh
source ~/.zsh/widgets.zsh
source ~/.zsh/zsh-autopair/autopair.zsh
#source ~/.zsh/zsh-completion-generator/zsh-completion-generator.plugin.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 
autoload -Uz edit-command-line; zle -N edit-command-line
#: COMPLETION
fpath=(
  ~/.zsh/completions
  ~/.zsh/zsh-completion-generator/completions
  /usr/local/share/zsh-completions
  $fpath
)
zmodload zsh/complist
autoload -Uz compinit; compinit -C
zstyle ":completion:*:" format "%B%d%b"
zstyle ':completion:*' menu select=2
zstyle ':completion:*' special-dirs true      # Tabcomplete parent dir
zstyle ':completion:*' menu select            # Show menu selection
zstyle ':completion:*' verbose true           # Verbose completion results
zstyle ':completion:*' accept-exact-dirs true # Keep dirs and files separated
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # Colors for files completion
fignore=(class lock aux fls log out fdb_latexmk synctex.gz) # Never complete these
#: KEYBINDS
# Custom widgets
bindkey 'Œ'    w-bin
bindkey '^I'   w-cd-or-expand
bindkey '^O'   w-clear-ls
bindkey '^Z'   w-fg
bindkey '^[[Z' w-cd-parent
bindkey "'"    w-git-status
bindkey '*'    w-git-log
bindkey '…'    w-dot
bindkey '^P'   w-contents
bindkey '^R'   w-hunter
bindkey '^T'   w-file
bindkey 'ä'    w-cal-agenda
bindkey 'Ä'    w-cal-week
bindkey '^M'   w-enter
bindkey '^Y'   w-copy
bindkey '.'    w-single-dot
bindkey '~'    w-working-dir
bindkey 'ü'    w-upgrade-all
bindkey '/'    w-slash
bindkey '°'    w-fzf-toggle-exact # <S-§>
bindkey '•'    w-fzf-set-filter   # <S-M-§>
bindkey 'ı'    w-clear # <C-I>
bindkey '’'    w-clear # <C-M> TODO: Mail
bindkey '^N'   w-clear # TODO: IRC
bindkey '^[[.' w-cargo-run # <D-R>
bindkey '^[[,' w-cargo-run-stacktrace # <D-S-R>
bindkey '^[[~' w-backward-kill-dir # <C-BS>
bindkey '^G'   w-open-vim
# Builtin widgets
bindkey '\eq'  push-input
bindkey '^Q'   push-line-or-edit
bindkey '^B'   vi-backward-blank-word
bindkey '^W'   vi-forward-blank-word
bindkey '^H'   backward-char
bindkey '^L'   forward-char
bindkey '^J'   history-beginning-search-forward
bindkey '^K'   history-beginning-search-backward
bindkey 'ª'    undo
bindkey '√'    redo
bindkey '^E'   end-of-line       # <C-e>
bindkey 'Ö'    beginning-of-line # <C-E>
bindkey '^X'   edit-command-line
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -M menuselect '^I'   menu-expand-or-complete
bindkey '^[[3~' delete-char # <FN-BS>
# FUNCTIONS
function pdftojpg {
  convert -density 300 -trim -quality 100 $1 +append $(echo $1 | sed "s/\.pdf/\.png")
}
#zprof # bottom of .zshrc
