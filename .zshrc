stty -ixon -ixoff werase undef # Unbind <C-s> <C-q> <C-w>
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac
#zmodload zsh/zprof # top of your .zshrc file
#: STARTUP
# export TERM=screen-256color
# export TERM=xterm-256color
# export TERM=xterm-noalt
# if [ "$TMUX" = "" ]; then tmux -u -2; exit; fi
#: PATHS
path=(
  /usr/local/opt/ccache/libexec
  /usr/local/opt/llvm/bin
  /usr/local/opt/gnu-sed/libexec/gnubin
  /usr/local/sbin
  /opt/local/bin
  /opt/local/sbin
  /usr/local/opt/ncurses/bin
  /usr/local/lib/ruby/gems/2.6.0/bin
  /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
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
# alias  mlir="rg ~/Workspace/scala/arc/arc-mlir/llvm-project/mlir/include/mlir/IR -e"
alias mlir="~/Workspace/arc/arc-mlir/build/llvm-build/bin/arc-mlir -mlir-print-op-generic"
alias python="python3"
# Files
alias   bug="nvim ~/.bugs"
alias  todo="nvim ~/.todo"
alias   com="nvim ~/.commands"
alias names="nvim ~/PhD/names"
# Fixes
#alias   gdb="sudo gdb"
alias  cgdb="sudo cgdb"
# alias  htop="sudo htop"
alias mkdir="mkdir -pv" # Make parent directories
# alias  make="clear && make"
alias emacs="open -a emacs"
alias    df="df -h"
# GUI
alias  mvim="skhd -k 'cmd + shift - k'; mvim"
# Git
alias    gp="git push"
alias   gpf="git push --force"
alias   gpl="git pull"
alias   gca="git commit --amend"
alias   gcl="git clone"
alias   grc="git rebase --continue"
alias   gra="git rebase --abort"
alias   gri="git rebase -i"
alias   gco="git checkout"
alias   gcb="git checkout -b"
alias    ga="git add -A"
# Overrides
# alias    mv="adaptive-mv"
# alias touch="adaptive-touch"
alias    bc="eva"
alias    ls="lsd --group-dirs=first"
alias   lst="lsd --tree"
alias   lsa="lsd --date relative --all"
alias  grep="rg --no-ignore --hidden"
alias    rg="rg --no-ignore --hidden"
#alias  find="fd --no-ignore"
alias  tree="lsd --tree"
alias  time="tally"
alias   top="htop"
alias   cat="bat --theme TwoDark"
alias    vi="nvim"
#alias   vim="nvim"
alias   gcc="gcc-10"
# Shortcuts
alias     m="mvim --remote-tab-silent"
alias   ...=../..
alias  ....=../../..
alias .....=../../../..
alias  comp="~/.zsh/zsh-completion-generator/help2comp.py"
alias    xp="xpanes"
alias     n="nvim -p"
alias    na="nvim **/**.rs -p"
alias    ns="nvim **/**.scala -p"
alias    nv="nvim **/**.vim -p"
alias    np="nvim **/**.{cpp,h,td} -p"
alias    nd="nvim **/**.{arc,mlir} -p"
alias     t="trans en:sv -view" # translate
alias    tt="trans sv:en -view" # translate
alias     u="rustup update && cargo install-update --all"
alias    uu="sudo apt update -qq && sudo apt upgrade -qq -y"
alias    gd='nvim -p $(git diff --name-only --relative)'
alias     a="brew search"
alias     i="brew info"
alias    ii="brew install"
alias     r="brew cleanup"
alias     c="cargo check 2>&1 >/dev/null | less"
alias     z="nvim ~/.zshrc"
alias    zz="nvim ~/.tmux.conf"
alias    zg="nvim ~/.gitconfig"
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
alias     e="n-env"
alias     f="n-functions"
alias    gl="git log --pretty"
alias    ed="ed -p'* '"
alias    sc="nvim ~/PhD/Plan.md"
alias cargo="cargo --color always"
alias    cf="cargo fetch"
alias    ce="cargo check && cargo clippy && cargo fmt -- --check"
alias    cb="cargo build --color always 2>&1 | less"
alias    ct="cargo test --nocapture --color always 2>&1 | less"
alias   hdp="ssh klas@109.225.89.18 -p 8209"
alias   cps="pax -rw -k -pe . . -s"
alias     d="n ~/dsl"
#: ENV
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
#:: Ripgrep
export RIPGREP_CONFIG_PATH=~/.ripgreprc
#:: Brew
export HOMEBREW_BAT=1
export HOMEBREW_DISPLAY_INSTALL_TIMES=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_BOTTLE_SOURCE_FALLBACK=1
#:: MAN
export           PAGER=/usr/bin/less
export       BAT_PAGER="less -R"
export            LESS='--RAW-CONTROL-CHARS --IGNORE-CASE --SILENT --quit-if-one-screen --no-init'
export LESS_TERMCAP_so=$'\E[30;43m'
export             PS1='$(prompt)'
export           TERM=xterm-color
# export TERM=screen-256color-bce
export           TERM=iterm2
export         EDITOR=nvim
export         LC_ALL=en_US.UTF-8
export           LANG=en_US.UTF-8
export   HISTFILESIZE=5000 # Disk (BASH??)
export       HISTSIZE=5000 # Memory
export       SAVEHIST=5000 # Disk
export       HISTFILE=~/.zsh/hist
export       HISTSIZE=$HISTFILESIZE
export        FIGNORE=$FIGNORE:DS_Store
export     HISTIGNORE='ls';    # Ignore certain commands from history
export      WORDCHARS=''
export      LS_COLORS='di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32'
export      JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home
# export      RUSTFLAGS="-Dwarnings:$RUSTFLAGS"
export     CARGO_HOME=~/.cargo/
# export CARGO_TARGET_DIR="/Users/Klas/.cargo/target/"
export CARGO_INCREMENTAL=1
export RANGER_LOAD_DEFAULT_RC=FALSE
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/libffi/lib/pkgconfig"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/gstreamer/lib/pkgconfig"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/gst-plugins-base/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=red,bg=black,bold"
#: OPTIONS
setopt AUTO_CD;              # CD to directory
setopt NO_AUTO_REMOVE_SLASH; # Do not remove trailing slash for completions
setopt MENU_COMPLETE;        # Press tab twice to autocomplete
setopt INC_APPEND_HISTORY;   # Append to history immediately, not just on exit
setopt LIST_PACKED;          # Make the completion list smaller
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
setopt EXTENDED_GLOB;        # Treat # ~ ^ as globs
#: CUSTOM OPTIONS
export FZF_HEIGHT=20
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_PREVIEW_COMMAND="~/.zsh/scripts/preview-file.zsh"
export FZF_EDIT_LINES_COMMAND="~/.zsh/scripts/edit-selected-lines.zsh"
export FZF_FILTERS='*.{c,h,cpp,rs,java,scala,py}'
export FZF_DEFAULT_OPTS="--bind 'btab:up'"
# export FZF_TAB_OPTS="--bind 'space:accept'"
export SCROLLBACK=10
#: SOURCES
function zr-update {
  zr \
    hlissner/zsh-autopair            \
    ael-code/zsh-colored-man-pages   \
    zdharma/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions    \
    romkatv/powerlevel10k            \
    wfxr/forgit                      \
  > ~/.zsh/zr.zsh
}
#     marlonrichert/zsh-autocomplete   \
source ~/.zsh/zr.zsh
source ~/.cache/zr/romkatv/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-key-tweaks/widgets.zsh
source ~/.zsh/zsh-key-tweaks/custom.zsh
autoload -Uz edit-command-line; zle -N edit-command-line
#: COMPLETION
fpath=(
  ~/.zsh/completions
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
fignore=(
  class
  lock
  aux
  fls
  log
  out
  fdb_latexmk
  synctex.gz
  mzp
) # Never complete these
#: KEYBINDS
# Custom widgets
bindkey 'Œ'    w-fzf-bin
bindkey '^I'   w-cd-or-expand
bindkey '^O'   w-clear-ls
bindkey '^Z'   w-fg
bindkey '^[[Z' w-cd-parent-ls
bindkey "'"    w-git-status
bindkey '*'    w-git-log
bindkey '^'    w-git-diff
bindkey '.'    w-dot
bindkey '…'    w-dots
bindkey '^R'   w-hunter
bindkey '^P'   w-fzf-file-contents
bindkey 'ı'    w-fzf-file # <C-i>
bindkey 'ä'    w-cal-agenda
bindkey 'Ä'    w-cal-week
bindkey '^M'   w-enter
bindkey '^Y'   w-copy
bindkey '~'    w-working-dir
bindkey 'ü'    w-upgrade-all
bindkey '/'    w-slash
bindkey '°'    w-fzf-toggle-exact # <S-§>
bindkey '•'    w-fzf-set-filter   # <S-M-§>
bindkey '’'    w-clear # <C-M> TODO: Mail
bindkey '^N'   w-clear # TODO: IRC
bindkey '^[[.' w-cargo-run # <D-R>
bindkey '^[[,' w-cargo-run-stacktrace # <D-S-R>
bindkey '^[[~' w-backward-kill-dir # <C-BS>
bindkey '^G'   w-open-tig
bindkey '^S'   w-spell # <C-d>
bindkey ¥      w-pipe # <S-Enter>
bindkey º      w-exec-last # <D-k>
bindkey É      w-emoji
bindkey π      w-psql
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
bindkey 'ö' zce
# bindkey Ü w-upgrade-all
# FUNCTIONS
function pdftojpg {
  convert -density 300 -trim -quality 100 $1 +append $(echo $1 | sed "s/\.pdf/\.png")
}
function prompt {
  if [[ "$?" != "0" ]]; then
    echo "%F{red}$%f "
  else
    echo "%F{green}$%f "
  fi
#   local prefix = $(($($last_status != '0')?'✘':'✔'))
}
#zprof # bottom of .zshrc

function man() { /usr/bin/man $1 } # Fix that lag
# source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
# source ~/.zsh/forgit/forgit.plugin.zsh
# source ~/.zsh/git-open/git-open.plugin.zsh

function play() {
  vlc ftp://192.168.1.3:5115/$1 \
    --video-x=100 \
    --video-y=20 \
    --scale=0.2
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# OPAM configuration
. /home/klas/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# NVM configuration
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:~/Workspace/my-treesitter-parser/tree-sitter-arc/node_modules/.bin
# source /home/klas/Workspace/javascript/emsdk/emsdk_env.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bitcomplete bit
