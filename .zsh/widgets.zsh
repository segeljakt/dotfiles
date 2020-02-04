# TODO: Add mapping <C-e> for running last command
# WIDGETS
function w-backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
function w-upgrade-all {
  xpanes -s -d -e             \
    "cargo install-update -a" \
    "brew upgrade"
}
function w-cargo-run  { zle -I; RUST_BACKTRACE=0; cargo run                    }
function w-cargo-run-stacktrace  { zle -I; RUST_BACKTRACE=1; cargo run         }
function w-open-vim   { zle -I; nvim                                           }
function w-open-tig   { zle -I; tig < /dev/tty                                 }
function w-clear-ls   { zle -I; clear; ls                                      }
function w-clear      { zle -I; clear;                                         }
function w-fg         { zle -I; fg                                             }
function w-cd-parent  { zle -I; cd ..; clear; pwd; ls                          }
function w-help       { zle -I; cat ~/.help                                    }
function w-todo       { zle -I; nvim ~/.todo                                   }
function w-copy       { echo "$BUFFER" | pbcopy                                }
function w-hunter     { hunter < /dev/tty > /dev/tty; zle redisplay            }
function w-bin {
  exa                  \
    /bin/              \
    /usr/bin/          \
    /usr/local/bin/ |  \
    sed "s/ -> .*$//g" | \
  fzf
  zle redisplay
}
function w-cal-agenda { clear; gcalcli agenda; zle redisplay                  }
function w-cal-week   { clear; gcalcli calw;   zle redisplay                  }
function w-fzf-toggle-exact {
  if [[ "$FZF_EXACT" == "" ]]; then
    export FZF_EXACT="--exact"
  else
    export FZF_EXACT=""
  fi
}
function w-fzf-set-filter {
  BUFFER="export FZF_FILTERS='$FZF_FILTERS'"
  CURSOR=$#BUFFER-2
}
function w-fg {
  if [ $(jobs | head -c1 | wc -c) -ne 0 ]; then
    zle -I; fg >/dev/null 2>&1
  fi
}
function w-single-dot {
  if [[ "$BUFFER" == "" ]]; then
    BUFFER="$BUFFER./"; CURSOR=2; zle list-choices;
  else
    BUFFER="$LBUFFER.$RBUFFER"; CURSOR=$CURSOR+1
  fi
}
function w-slash {
  if [[ "$BUFFER" == "" ]]; then
    BUFFER="$BUFFER/"; CURSOR=1; zle list-choices
  else
    BUFFER="$LBUFFER/$RBUFFER"; CURSOR=$CURSOR+1; zle list-choices
  fi
}
function w-working-dir {
  UNDER_CURSOR="$BUFFER[$CURSOR]"
  if [[ "$UNDER_CURSOR" == "" || "$UNDER_CURSOR" == " " ]]; then
    BUFFER="$LBUFFER~/$RBUFFER"; CURSOR=$CURSOR+2; zle list-choices
  else
    BUFFER="$LBUFFER~$RBUFFER"; CURSOR=$CURSOR+1
  fi
}
function w-dot {
  if [[ "$BUFFER" == "" || "$LBUFFER" =~ ".* $" ]]; then
    BUFFER="$LBUFFER./$RBUFFER";       CURSOR=$CURSOR+2; zle list-choices # " "
  elif [[ "$LBUFFER" =~ ".*\.\./$" ]]; then
    BUFFER="$LBUFFER../$RBUFFER";      CURSOR=$CURSOR+3; zle list-choices # ../
  elif [[ $BUFFER[1,$CURSOR] =~ ".*\./$" ]]; then
    BUFFER="$LBUFFER[1,-2]./$RBUFFER"; CURSOR=$CURSOR+1; zle list-choices # ./
  else
    BUFFER="$LBUFFER.$RBUFFER";        CURSOR=$CURSOR+1                   # Default
  fi
}
function w-git-status {
  if [[ "$BUFFER" == "" ]]; then
    zle -I; clear; git status
  else
    BUFFER="$LBUFFER'$RBUFFER"; CURSOR=$CURSOR+1
  fi
}
function w-git-log {
  if [[ "$BUFFER" == "" ]]; then
    zle -I; clear; git log
  else
    BUFFER="$LBUFFER*$RBUFFER"; CURSOR=$CURSOR+1
  fi
}
function w-git-diff {
  if [[ "$BUFFER" == "" ]]; then
    zle -I; clear; git diff
  else
    BUFFER="$LBUFFER^$RBUFFER"; CURSOR=$CURSOR+1
  fi
}
function w-cd-or-expand {
  if [[ "$BUFFER" == "" ]]; then
    BUFFER="cd "
    CURSOR=3
    zle list-choices
  else
    zle expand-or-complete
  fi
}
function w-file() {
  RESULT=$(
    rg --color=never                                                    \
       --no-ignore                                                      \
       --files                                                          \
       --hidden                                                         \
       --glob ${FZF_FILTERS}                                            \
       . |                                                              \
    fzf --multi                                                         \
        -i                                                              \
        ${FZF_EXACT}                                                    \
        --inline-info                                                   \
        --height=$FZF_HEIGHT                                            \
        --reverse                                                       \
        --tabstop=2                                                     \
        --color=hl+:1,hl:1                                              \
        --algo=v2                                                       \
        --bind="ctrl-a:select-all"                                      \
        --bind="ctrl-o:execute(vim -p {+} < /dev/tty > /dev/tty)" | \
    tr '\n' ' '
  )
  if [[ "$RESULT" != "" ]]; then
    BUFFER="$LBUFFER$RESULT$RBUFFER"
    CURSOR=$CURSOR+$#RESULT
  fi
  zle redisplay
}
function w-contents() {
  zle -I
  RESULT=$(                                                                \
    rg --color=never                                                       \
       --no-ignore                                                         \
       --with-filename                                                     \
       --no-heading                                                        \
       --line-number                                                       \
       --glob ${FZF_FILTERS}                                               \
       . |                                                                 \
    fzf --multi                                                            \
        -i                                                                 \
        ${FZF_EXACT}                                                       \
        --inline-info                                                      \
        --height=$FZF_HEIGHT                                               \
        --reverse                                                          \
        --delimiter=:                                                      \
        --tabstop=2                                                        \
        --color=hl+:1,hl:1                                                 \
        --algo=v2                                                          \
        --nth=3                                                            \
        --bind="ctrl-a:select-all+accept"                                  \
        --bind="ctrl-o:execute($FZF_EDIT_LINES_COMMAND {+1,2} > /dev/tty)" \
        --preview="$FZF_PREVIEW_COMMAND {1} {2} $FZF_HEIGHT" |             \
    cut -d: -f1 |                                                          \
    tr '\n' ' '
  )
  if [[ "$RESULT" != "" ]]; then
    BUFFER="$LBUFFER$RESULT$RBUFFER"
    CURSOR=$CURSOR+$#RESULT
  fi
  zle redisplay
}
function w-emoji() {
  zle -I
  RESULT=$(                                                                \
    emoji-fzf preview |                                                    \
    fzf --multi                                                            \
        -i                                                                 \
        ${FZF_EXACT}                                                       \
        --inline-info                                                      \
        --height=$FZF_HEIGHT                                               \
        --reverse                                                          \
        --tabstop=2                                                        \
        --color=hl+:1,hl:1                                                 \
        --algo=v2                                                          \
        --bind="ctrl-a:select-all+accept"                                  \
        --preview-window=up:1:noborder                                     \
        --preview 'emoji-fzf get {1}' |                                    \
    cut -d ' ' -f 1 |                                                      \
    emoji-fzf get   |                                                      \
    tr '\n' ' '
  )
  if [[ "$RESULT" != "" ]]; then
    BUFFER="$LBUFFER$RESULT$RBUFFER"
    CURSOR=$CURSOR+$#RESULT
  fi
  zle redisplay
}
function w-spell() {
  zle -I
  RESULT=$(
    /bin/cat /usr/share/dict/words | \
    fzf --preview 'wn {} -over | fold' \
        --preview-window=up:60%
  )
  if [[ "$RESULT" != "" ]]; then
    BUFFER="$LBUFFER$RESULT$RBUFFER"
    CURSOR=$CURSOR+$#RESULT
  fi
  zle redisplay
}
function w-enter() {
  if [[ "$BUFFER" == "" ]]; then
    # LINES
    CURRENT=$(bash ~/.zsh/scripts/scrollback.sh 2> /dev/null)
    if [[ "$CURRENT" -gt 0 ]]; then
			PREV=$((CURRENT-SCROLLBACK))
			if [[ $PREV -lt 0 ]]; then PREV=0; fi
			TOTAL=$(tput lines)
			REMAINING=$((TOTAL-PREV-1))
			# Execute
			for x in $(seq 1 $REMAINING); do echo; done
			tput cup $PREV
			zle redisplay
    fi
  else
    zle accept-line
  fi
}
function w-pipe() {
  BUFFER="$BUFFER | less"
  CURSOR=$#BUFFER
  zle accept-line
}
function w-exec-last() {
  zle up-history
  zle accept-line
}
zle -N w-bin
zle -N w-cd-or-expand
zle -N w-clear-ls
zle -N w-clear
zle -N w-fg
zle -N w-cd-parent
zle -N w-git-status
zle -N w-git-log
zle -N w-git-diff
zle -N w-dot
zle -N w-contents
zle -N w-hunter
zle -N w-file
zle -N w-cal-agenda
zle -N w-cal-week
zle -N w-enter
zle -N w-copy
zle -N w-single-dot
zle -N w-working-dir
zle -N w-slash
zle -N w-upgrade-all
zle -N w-fzf-toggle-exact
zle -N w-fzf-set-filter
zle -N w-backward-kill-dir
zle -N w-cargo-run
zle -N w-cargo-run-stacktrace
zle -N w-open-vim
zle -N w-open-tig
zle -N w-spell
zle -N w-pipe
zle -N w-exec-last
zle -N w-emoji
# Functions
function fcd () { [ -f "$1" ] && { cd "$(dirname "$1")"; } || { cd "$1"; } ; pwd; }
