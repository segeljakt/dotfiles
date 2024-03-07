stty -ixon -ixoff werase undef # Unbind <C-s> <C-q> <C-w>

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# PATHS
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.rustup/toolchains/nightly-aarch64-apple-darwin/bin/:$PATH"
export PATH="$HOME/Workspace/iTerm2-shell-integration/utilities/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin/:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/Cellar/apache-flink/1.18.1/libexec/bin/:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$(brew --prefix openssl)/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/Users/klasseg/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
export CLASSPATH="/usr/local/lib/antlr-4.9.2-complete.jar:$CLASSPATH"
export CLASSPATH="/opt/homebrew/Cellar/apache-flink/1.18.1/libexec/lib:$CLASSPATH"
export CLASSPATH="/opt/homebrew/opt/saxon/libexec:$CLASSPATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export MODULAR_HOME="/Users/klasseg/.modular"
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"
# Sources
source "$HOME/.secrets"
# ALIASES
alias   kth="ssh klas@130.237.202.108"
alias     g="gix"
alias python="python3"
alias     p="ipython"
alias mkdir="mkdir -pv" # Make parent directories
alias    bc="eva"
alias    ls="lsd"
alias  grep="rg --no-ignore --hidden"
alias  tree="lsd --tree"
alias  time="tally"
alias   cat="bat"
alias   man="batman"
alias  diff="delta --syntax-theme=GitHub"
alias    wc="tokei"
alias    top="btm"
alias    df="dua"
alias     n="nvim -p"
alias     u="rustup update; cargo install-update --all; zr --update; brew upgrade"
alias     z="nvim ~/.zshrc"
alias     d="rdict search"
ulimit -n 1048576
# ENV
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/config
export FIREDBG_HOME=$HOME/Workspace/FireDBG
# Brew
export HOMEBREW_BAT=1
export HOMEBREW_DISPLAY_INSTALL_TIMES=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_BOTTLE_SOURCE_FALLBACK=1
# MAN
export           PAGER=/usr/bin/less
export       BAT_PAGER="less -R"
export            LESS='--RAW-CONTROL-CHARS --IGNORE-CASE --SILENT --quit-if-one-screen --no-init -S'
export LESS_TERMCAP_so=$'\E[30;43m'
export         EDITOR=nvim
export         LC_ALL=en_US.UTF-8
export           LANG=en_US.UTF-8
export   HISTFILESIZE=10000000
export       HISTSIZE=10000000
export       SAVEHIST=10000000
export       HISTFILE=~/.zsh/hist
export        FIGNORE=$FIGNORE:DS_Store
export     HISTIGNORE='ls' # Ignore certain commands from history
export      WORDCHARS=''
export      LS_COLORS='di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32'
export      JAVA_HOME=$(/usr/libexec/java_home)
export     CARGO_HOME=~/.cargo/
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export CFLAGS=" -I/opt/homebrew/include"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=red,bg=black,bold"
# OPTIONS
setopt AUTO_CD               # CD to directory
setopt NO_AUTO_REMOVE_SLASH  # Do not remove trailing slash for completions
setopt MENU_COMPLETE         # Press tab twice to autocomplete
setopt INC_APPEND_HISTORY    # Append to history immediately, not just on exit
setopt LIST_PACKED           # Make the completion list smaller
setopt BANG_HIST             # Treat the '!' character specially during expansion
setopt EXTENDED_HISTORY    # Store time of each command
setopt HIST_IGNORE_DUPS      # Don't save duplicate commands
setopt HIST_IGNORE_ALL_DUPS  # Ignore all duplicate commands
setopt HIST_FIND_NO_DUPS     # Do not display a line previously found
setopt HIST_IGNORE_SPACE     # Don't save commands starting with space to history
setopt HIST_FCNTL_LOCK       # Faster history performance
setopt HIST_NO_FUNCTIONS     # Do not store function definitions in history
setopt HIST_REDUCE_BLANKS    # Remove whitespace from history commands
setopt HIST_SAVE_NO_DUPS     # Omit saving old commands
setopt SHARE_HISTORY         # Share history between shells
setopt INTERACTIVE_COMMENTS  # Allow interactive comments in shell
setopt PROMPT_SUBST          # Allow stuff in prompts
setopt TRANSIENT_RPROMPT     # Clear RPS1 when accepting command
setopt EXTENDED_GLOB         # Treat # ~ ^ as globs
# CUSTOM OPTIONS
export FZF_HEIGHT=20
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_PREVIEW_COMMAND="~/.zsh/scripts/preview-file.zsh"
export FZF_EDIT_LINES_COMMAND="~/.zsh/scripts/edit-selected-lines.zsh"
export FZF_FILTERS='*.{c,h,cpp,rs,java,scala,py,toml,ml,arc}'
export FZF_DEFAULT_OPTS="--bind 'btab:up'"
# export FZF_TAB_OPTS="--bind 'space:accept'"
export SCROLLBACK=10
#: SOURCES
function zr-update {
  zr \
    hlissner/zsh-autopair \
    ael-code/zsh-colored-man-pages \
    zsh-users/zsh-autosuggestions \
    romkatv/powerlevel10k \
    wfxr/forgit \
    zdharma-continuum/fast-syntax-highlighting \
  > ~/.zsh/zr.zsh
}
source ~/.zsh/zr.zsh
source ~/.zsh/zsh-key-tweaks/widgets.zsh
source ~/.zsh/zsh-key-tweaks/custom.zsh
# COMPLETION
fpath=(~/.zsh/completions ~/.zfunc $fpath) 

zmodload zsh/complist

autoload -Uz edit-command-line; zle -N edit-command-line
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

zstyle ":completion:*:" format "%B%d%b"
zstyle ':completion:*' menu select=2
zstyle ':completion:*' special-dirs true      # Tabcomplete parent dir
zstyle ':completion:*' menu select            # Show menu selection
zstyle ':completion:*' verbose true           # Verbose completion results
zstyle ':completion:*' accept-exact-dirs true # Keep dirs and files separated
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # Colors for files completion
fignore=(class lock aux fls mzp) # Never complete these
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
bindkey '’'    w-clear # <C-M>
bindkey '^N'   w-clear
bindkey '^[[.' w-clear # <D-R>
bindkey '^[[,' w-clear # <D-S-R>
bindkey '^[[~' w-backward-kill-dir # <C-BS>
# bindkey '^G'   w-open-git-show
bindkey '^S'   w-spell # <C-d>
bindkey ¥      w-pipe # <S-Enter>
bindkey º      w-exec-last # <D-k>
bindkey É      w-emoji
bindkey π      w-clear
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

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# OCaml
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval $(opam env)

# Node Configuration
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /Users/klasseg/.iterm2_shell_integration.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme

# Python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/klasseg/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/klasseg/miniforge3/etc/profile.d/conda.sh" ]; then
#         . "/Users/klasseg/miniforge3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/klasseg/miniforge3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

eval "$(zoxide init zsh --cmd cd)"
