
" if !empty(expand("%:e"))
"   match ColorColumn "\%>79v.\+"
"   highlight ColorColumn guibg=red
" en

setlocal foldtext=VimFoldExpr()

fun! VimFoldExpr()
  let last = matchend(getline(v:lnum), '^.\*\+')
  if last == -1
    return "="
  el
    return ">".(last-1)
  en
endfun
