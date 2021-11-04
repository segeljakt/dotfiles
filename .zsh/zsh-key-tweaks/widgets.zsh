function w-backward-kill-dir {
  local WORDCHARS=${WORDCHARS/\/}
  zle backward-kill-word
}

zle -N w-backward-kill-dir

# -----------------------------------------------------------------------------

function w-open-editor {
  zle -I
  $EDITOR
}

zle -N w-open-editor

# -----------------------------------------------------------------------------

function w-clear {
  zle -I
  clear
}

zle -N w-clear

# -----------------------------------------------------------------------------

function w-clear-ls {
  zle -I
  clear
  ls
}

zle -N w-clear-ls

# -----------------------------------------------------------------------------

function w-cd-parent-ls {
  zle -I
  cd ..
  pwd
  ls
}

zle -N w-cd-parent-ls

# -----------------------------------------------------------------------------

function w-copy {
  echo "$BUFFER" | pbcopy
}

zle -N w-copy

# -----------------------------------------------------------------------------

function w-fzf-bin {
  exa \
    /bin/ \
    /usr/bin/ \
    /usr/local/bin/ | \
    sed "s/ -> .*$//g" | \
  fzf
  zle redisplay
}

zle -N w-fzf-bin

# -----------------------------------------------------------------------------

function w-fg {
  if [ $(jobs | head -c1 | wc -c) -ne 0 ]; then
    zle -I
    fg >/dev/null 2>&1
  fi
}

zle -N w-fg

# -----------------------------------------------------------------------------

function w-dot {
  if [[ "$BUFFER" == "" ]]; then
    BUFFER="$BUFFER./"
    CURSOR=2
    zle list-choices
  else
    BUFFER="$LBUFFER.$RBUFFER"
    CURSOR=$CURSOR+1
  fi
}

zle -N w-dot

# -----------------------------------------------------------------------------

function w-slash {
  if [[ "$BUFFER" == "" ]]; then
    BUFFER="$BUFFER/"
    CURSOR=1
    zle list-choices
  else
    BUFFER="$LBUFFER/$RBUFFER"
    CURSOR=$CURSOR+1
    zle list-choices
  fi
}

zle -N w-slash

# -----------------------------------------------------------------------------

function w-working-dir {
  UNDER_CURSOR="$BUFFER[$CURSOR]"
  if [[ "$UNDER_CURSOR" == "" || "$UNDER_CURSOR" == " " ]]; then
    BUFFER="$LBUFFER~/$RBUFFER"
    CURSOR=$CURSOR+2
    zle list-choices
  else
    BUFFER="$LBUFFER~$RBUFFER"
    CURSOR=$CURSOR+1
  fi
}

zle -N w-working-dir

# -----------------------------------------------------------------------------

function w-dots {
  if [[ "$BUFFER" == "" || "$LBUFFER" =~ ".* $" ]]; then # " "
    BUFFER="$LBUFFER./$RBUFFER"
    CURSOR=$CURSOR+2
    zle list-choices
  elif [[ "$LBUFFER" =~ ".*\.\./$" ]]; then              # ../
    BUFFER="$LBUFFER../$RBUFFER"
    CURSOR=$CURSOR+3
    zle list-choices
  elif [[ $BUFFER[1,$CURSOR] =~ ".*\./$" ]]; then        # ./
    BUFFER="$LBUFFER[1,-2]./$RBUFFER"
    CURSOR=$CURSOR+1
    zle list-choices
  else                                                   # Default
    BUFFER="$LBUFFER.$RBUFFER"
    CURSOR=$CURSOR+1
  fi
}

zle -N w-dots

# -----------------------------------------------------------------------------

function w-git-status {
  if [[ "$BUFFER" == "" ]]; then
    zle -I
    clear
    git status
  else
    BUFFER="$LBUFFER'$RBUFFER"
    CURSOR=$CURSOR+1
  fi
}

zle -N w-git-status

# -----------------------------------------------------------------------------

function w-git-log {
  if [[ "$BUFFER" == "" ]]; then
    zle -I
    clear
    git log
  else
    BUFFER="$LBUFFER*$RBUFFER"
    CURSOR=$CURSOR+1
  fi
}

zle -N w-git-log

# -----------------------------------------------------------------------------

function w-git-diff {
  if [[ "$BUFFER" == "" ]]; then
    zle -I
    clear
    git diff
  else
    BUFFER="$LBUFFER^$RBUFFER"
    CURSOR=$CURSOR+1
  fi
}

zle -N w-git-diff

# -----------------------------------------------------------------------------

function w-cd-or-expand {
  if [[ "$BUFFER" == "" ]]; then
    BUFFER="cd "
    CURSOR=3
    zle list-choices
  else
    zle expand-or-complete
  fi
}

zle -N w-cd-or-expand

# -----------------------------------------------------------------------------

function w-fzf-file {
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

zle -N w-fzf-file

# -----------------------------------------------------------------------------

function w-fzf-file-contents {
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

zle -N w-fzf-file-contents

# -----------------------------------------------------------------------------

function w-emoji {
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

zle -N w-emoji

# -----------------------------------------------------------------------------

function w-spell {
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

zle -N w-spell

# -----------------------------------------------------------------------------

function w-enter {
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

zle -N w-enter

# -----------------------------------------------------------------------------

function w-pipe {
  BUFFER="$BUFFER 2>&1 | less"
  CURSOR=$#BUFFER
  zle accept-line
}

zle -N w-pipe

# -----------------------------------------------------------------------------

function w-exec-last {
  zle up-history
  zle accept-line
}

zle -N w-exec-last
