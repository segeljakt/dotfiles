
setlocal foldexpr=MarkdownFoldExpr()
setlocal foldtext=MarkdownFoldText()
setlocal nonumber

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
