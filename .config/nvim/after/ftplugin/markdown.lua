vim.cmd [[ 
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

  fun! Newline()
    if match(getline('.'), ' *\*') == 0
      return "o\<BS>\<BS>* "
    elseif match(getline('.'), ' *') == 0
      return "o\<C-c>i"
    el
      return "o"
    en
  endfun

  fun! Dedent()
    if match(getline('.'), ' *\*') == 0
      return "\<C-c><<A"
    el
      return ""
    en
  endfun

  fun! Indent()
    if match(getline('.'), ' *\*') == 0
      return "\<C-c>>>A"
    el
      return "\<C-c>i\<Tab>"
    en
  endfun

  nno <silent> •     :TableModeToggle<CR>:Goyo<CR>:Limelight<CR>| " <M-q>
  "nno <expr> o       Newline()
  ino <expr> <Tab>   Indent()
  ino <expr> <S-Tab> Dedent()
  vm ˆ               sa*|                                         " <M-i>

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

  let b:unfo_ftplugin =
        \ "nunmap •"
        \ "| nunmap o"
        \ "| iunmap <Tab>"
        \ "| iunmap <S-Tab>"
]]
