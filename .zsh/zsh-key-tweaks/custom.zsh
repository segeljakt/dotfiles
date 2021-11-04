

function w-upgrade-all {
  xpanes -s -d -e             \
    "cargo install-update -a" \
    "brew upgrade"
}
zle -N w-upgrade-all

# -----------------------------------------------------------------------------

function w-hunter {
  hunter < /dev/tty > /dev/tty
  zle redisplay
}
zle -N w-hunter

# -----------------------------------------------------------------------------

function w-cargo-run  {
  zle -I
  RUST_BACKTRACE=0
  cargo run
}
zle -N w-cargo-run

# -----------------------------------------------------------------------------

function w-cargo-run-stacktrace {
  zle -I
  RUST_BACKTRACE=1
  cargo run
}
zle -N w-cargo-run-stacktrace

# -----------------------------------------------------------------------------

function w-help {
  zle -I
  cat ~/.help
}

zle -N w-help

# -----------------------------------------------------------------------------

function w-todo {
  zle -I
  nvim ~/.todo
}

# -----------------------------------------------------------------------------

function w-cal-agenda {
  clear
  gcalcli agenda
  zle redisplay
}

zle -N w-cal-agenda

# -----------------------------------------------------------------------------

function w-cal-week {
  clear
  gcalcli calw
  zle redisplay
}

zle -N w-cal-week

# -----------------------------------------------------------------------------

function w-fzf-toggle-exact {
  if [[ "$FZF_EXACT" == "" ]]; then
    export FZF_EXACT="--exact"
  else
    export FZF_EXACT=""
  fi
}

zle -N w-fzf-toggle-exact

# -----------------------------------------------------------------------------

function w-open-tig {
  zle -I
  tig < /dev/tty
}

zle -N w-open-tig

# -----------------------------------------------------------------------------

function w-fzf-set-filter {
  BUFFER="export FZF_FILTERS='$FZF_FILTERS'"
  CURSOR=$#BUFFER-2
}

zle -N w-fzf-set-filter

# -----------------------------------------------------------------------------

function w-psql {
  zle -I
  psql < /dev/tty
}

zle -N w-psql
