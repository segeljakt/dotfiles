function w-fzf-toggle-exact {
  if [[ "$FZF_EXACT" == "" ]]; then
    export FZF_EXACT="--exact"
  else
    export FZF_EXACT=""
  fi
}

zle -N w-fzf-toggle-exact

# -----------------------------------------------------------------------------

function w-fzf-set-filter {
  BUFFER="export FZF_FILTERS='$FZF_FILTERS'"
  CURSOR=$#BUFFER-2
}

zle -N w-fzf-set-filter
