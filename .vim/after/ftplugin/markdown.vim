
setlocal foldexpr=MarkdownFoldExpr()
setlocal foldtext=MarkdownFoldText()
setlocal nonumber
setlocal linebreak
setlocal textwidth=80
setlocal spell
setlocal nonumber
setlocal noshowmode
setlocal noshowcmd
setlocal formatoptions-=t

let g:goyo_height = 100

nno <silent> • :TableModeToggle<CR>:Goyo<CR>:Limelight<CR>| " <M-q>

fun! MarkdownFoldExpr()
  let line = getline(v:lnum)
  if line =~ '^<details>'
    return ">1"
  elseif line =~ '^</p></details>'
    return "<1"
  el
    return "="
  en
endfun

fun! MarkdownFoldText()
  let line = getline(v:foldstart)
  let list = matchlist(line, '^<details><summary>\(.*\)</summary><p>')
  let inner = get(list, 1, "???")
  let stripped = substitute(inner, '<.\{-}>', '', 'g')
  return '# '.stripped
endfun

" TableModeToggle
" Goyo
" Limelight

