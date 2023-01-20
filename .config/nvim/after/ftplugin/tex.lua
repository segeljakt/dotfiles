vim.cmd [[

  setlocal formatoptions+=w textwidth=83

  fun! Newline()
    if match(getline('.'), ' *%') == 0
      return "o\<C-c>0c$% "
    el
      return "o"
    en
  endfun

  ino <C-l> \
  ino <C-b> \begin{}<Left>
  nno É :VimtexTocOpen<CR>
  nno √ :ThesaurusQueryReplaceCurrentWord<CR>
  vm ˆ sa{bi\textit<C-c>l%
  vm » sa{bi\textbf<C-c>l%
  vm Θ sa{bi\texttt<C-c>l%
  ino ˆ \textit{}<C-c>i
  ino » \textbf{}<C-c>i
  nno <expr> o Newline()

]]
