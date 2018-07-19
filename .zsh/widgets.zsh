FZF_PREVIEW_COMMAND="~/.zsh/scripts/preview-file.zsh"
FZF_EDIT_LINES_COMMAND="~/.zsh/scripts/edit-selected-lines.zsh"
function w-upgrade-all {
  xpanes -d -e "brew upgrade --cleanup"  \
               "rustup update"           \
               "cargo install-update -a"
}
function w-clear-ls   { zle -I; clear; ls                                     }
function w-clear      { zle -I; clear;                                        }
function w-fg         { zle -I; fg                                            }
function w-cd-parent  { zle -I; cd ..; clear; pwd; ls                         }
function w-help       { zle -I; cat ~/.help                                   }
function w-todo       { zle -I; nvim ~/.todo                                  }
function w-copy       { echo "$BUFFER" | pbcopy                               }
function w-ranger     { ranger < /dev/tty > /dev/tty; zle redisplay           }
function w-bin        { ls /bin/ /usr/bin /usr/local/bin | fzf; zle redisplay }
function w-cal-agenda { clear; gcalcli agenda; zle redisplay                  }
function w-cal-week   { clear; gcalcli calw;   zle redisplay                  }
function w-enter      { if [[ "$BUFFER" != "" ]]; then zle accept-line; fi    }
function w-toggle-exact {
  if [[ "$FZF_EXACT" == "" ]]; then
    export FZF_EXACT="--exact"
  else
    export FZF_EXACT=""
  fi
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
    zle -I; git status
  else
    BUFFER="$LBUFFER'$RBUFFER"; CURSOR=$CURSOR+1
  fi
}
function w-git-log {
  if [[ "$BUFFER" == "" ]]; then
    zle -I; clear; git log
  else
    BUFFER="$LBUFFER¨$RBUFFER"; CURSOR=$CURSOR+1
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
        --bind="ctrl-o:execute($EDITOR -p {+} < /dev/tty > /dev/tty)" | \
    tr '\n' ' '
  )
  if [[ "$RESULT" != "" ]]; then
    BUFFER="$LBUFFER$RESULT$RBUFFER"
    CURSOR=$CURSOR+$#RESULT
  fi
  zle redisplay
}
function w-contents() {
  RESULT=$(                                                                \
    rg --color=never                                                       \
       --no-ignore                                                         \
       --with-filename                                                     \
       --no-heading                                                        \
       --line-number                                                       \
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
# -g '*.{scala}'                                                      \
zle -N w-bin
zle -N w-cd-or-expand
zle -N w-clear-ls
zle -N w-clear
zle -N w-fg
zle -N w-cd-parent
zle -N w-git-status
zle -N w-git-log
zle -N w-dot
zle -N w-contents
zle -N w-ranger
zle -N w-file
zle -N w-cal-agenda
zle -N w-cal-week
zle -N w-enter
zle -N w-copy
zle -N w-single-dot
zle -N w-working-dir
zle -N w-slash
zle -N w-upgrade-all
zle -N w-toggle-exact
