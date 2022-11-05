" Plugged
let g:plug_window = 'enew'
" vim-silicon
let g:silicon = {
  \ 'theme': 'GitHub',
  \ 'background': '#FFFFFF',
  \ 'line-pad': 1,
  \ 'pad-horiz': 0,
  \ 'pad-vert': 0,
  \ 'line-number': v:false,
  \ 'window-controls': v:false,
  \ 'to-clipboard': v:true,
  \ 'output': '~/Desktop/silicon_{time:%Y-%m-%d_%H-%M-%S}.png',
  \ }
" vim-choosewin
let g:choosewin_return_on_single_win = 1
let g:choosewin_color_label = {
	    \ 'gui': ['ForestGreen', 'white', 'bold'],
	    \ 'cterm': [9, 16]
	    \ }
let g:choosewin_color_other = {
	    \ 'gui': ['gray20', 'black'],
	    \ 'cterm': [240, 0]
	    \ }
" markdown-preview.nvim
let g:mkdp_preview_options = {
      \ 'disable_sync_scroll': 1,
      \ 'hide_yaml_meta': 1
      \ }
let g:mkdp_page_title = '「${name}」'
" vim-surround
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
      \   {
      \     'buns'        : ['{', '}'],
      \     'motionwise'  : ['line'],
      \     'kind'        : ['add'],
      \     'linewise'    : 1,
      \     'command'     : ["'[+1,']-1normal! >>"],
      \   },
      \   {
      \     'buns'        : ['{', '}'],
      \     'motionwise'  : ['line'],
      \     'kind'        : ['delete'],
      \     'linewise'    : 1,
      \     'command'     : ["'[,']normal! <<"],
      \   }
      \ ]
" vim-multiple-cursors
let g:VM_leader = '’'
let g:VM_maps = {
  \ 'Align Char': '’',
  \ 'Find Under': '',
  \ 'Find Subword Under': '',
  \ 'Select l': '<S-Right>',
  \ 'Select h': '<S-Left>',
  \ }
fun! VM_Start()
  nmap <buffer> <C-C> <Esc>
  imap <buffer> <C-C> <Esc>
endfun
fun! VM_Exit()
  nunmap <buffer> <C-C>
  iunmap <buffer> <C-C>
endfun
" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['arc-lang=arc']
" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\~$']
let NERDTreeRespectWildIgnore = 1
let NERDTreeWinSize = 13
let NERDTreeMinimalUI = 1
let NERDTreeStatusline = ''
" vim-matchup
let g:matchup_matchparen_stopline = 100
let g:matchup_matchparen_deferred = 0
let g:matchup_matchparen_status_offscreen = 0
" Vimtex
" let g:vimtex_view_method = 'zathura'
let g:vimtex_indent_bib_enabled = 0
let g:tex_conceal = 'abdmgs'
let g:vimtex_view_method = 'skim'
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
      \ 'build_dir': {-> system("git rev-parse --show-toplevel | tr -d '\\n'") . '/target'}
      \}
" winresizer
let g:winresizer_start_key = '<C-w>,'
" vim-illuminate
let g:Illuminate_ftblacklist = ['startify']
let g:Illuminate_highlightUnderCursor = 1
hi illuminatedWord guibg=bg gui=underline
" TComment
let g:tcomment#mode_extra = '#'
let g:tcomment_maps = 0
let g:tcomment#options = {'col': 1}
" pear-tree
let g:pear_tree_pairs = {
      \   '(':   {'closer': ')'},
      \   '[':   {'closer': ']'},
      \   '{':   {'closer': '}'},
      \   "'":   {'closer': "'"},
      \   '"':   {'closer': '"'},
      \   '/\*': {'closer': '\*/'}
      \ }
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_map_special_keys = 0
" Startify
" let g:startify_session_dir = '~/.vim/session'
" let g:startify_list_order = ['files', 'dir', 'bookmarks', 'sessions', 'commands']
" let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
" let g:startify_files_number = 20
" let g:startify_change_to_vcs_root = 1
" let g:startify_fortune_use_unicode = 1
" let g:startify_custom_header = map(split(system('fortune -s | cowsay'), '\n'), '"   ". v:val')
" let g:startify_enable_unsafe = 1
" let g:startify_skiplist = [
"       \   '\.vim/',
"       \   '/usr/*',
"       \   '\.todo',
"       \ ]
" let g:startify_lists = [
"       \   { 'header': ['   MRU'], 'type': 'files' },
"       \   { 'header': ['   Sessions'], 'type': 'sessions' },
"       \ ]
" Lightline
let g:lightline = {
      \   'colorscheme': 'PaperColor',
      \   'active': {
      \     'left':  [ [ 'mode', 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ],
      \                [ 'path' ],
      \                ['readonly', 'modified' ], ],
      \     'right': [ [ 'diff', 'lineinfo' ], [ 'filetype', 'percent' ], ],
      \   },
      \   'inactive': {
      \     'left':  [ [ 'path' ] ],
      \     'right': [ [ ], [ ], [ ] ],
      \   },
      \   'tabline': {
      \     'left':  [ [ 'tabs' ] ],
      \     'right': [ [ ] ],
      \   },
      \   'tab': {
      \     'active':   [ 'filename', 'modified' ],
      \     'inactive': [ 'filename', 'modified' ]
      \   },
      \   'separator':            { 'left': '', 'right': '' },
      \   'subseparator':         { 'left': '', 'right': '' },
      \   'tabline_separator':    { 'left': '', 'right': '' },
      \   'tabline_subseparator': { 'left': '', 'right': '' },
      \   'component': {
      \     'path':       '%{&ft!="nnn"?expand("%:p"):""}',
      \     'filename':   '%t',
      \     'modified':   '%M',
      \     'readonly':   '%{&readonly?"":""}',
      \     'filetype':   '%{&ft==""?"N/A":&ft=="nnn"?"":&ft}',
      \     'percent':    '%3p%%',
      \     'lineinfo':   '%{&ft!="nnn"?printf("%3d:%-2d",line("."),col(".")):""}',
      \     'time':       '%{strftime("%a %b %e %H:%M")}',
      \     'whitespace': '%{len(filter(getline(1,"$"), "v:val =~ ''\s$''")) > 0 ? "!" : ""}',
      \     'wordcount':  '%{mode()=="v"?wordcount().visual_words:wordcount().words}',
      \   },
      \   'component_function': {
      \     'branch': 'LightlineBranch',
      \     'mode':   'LightlineMode',
      \   },
      \   'component_visible_condition': {
      \     'modified':  '&modified||!&modifiable',
      \     'readonly':  '&readonly',
      \     'paste':     '&paste',
      \     'spell':     '&spell',
      \     'lineinfo':  '&ft != "nnn"',
      \   },
      \   'component_function_visible_condition': { },
      \   'component_expand': {
      \     'tabs': 'lightline#tabs'
      \   },
      \   'component_type': {
      \     'tabs':  'tabsel',
      \     'close': 'raw'
      \   },
      \   'component_raw': { },
      \   'tab_component':  { },
      \   'tab_component_function': {
      \     'filename': 'lightline#tab#filename',
      \     'modified': 'lightline#tab#modified',
      \     'readonly': 'lightline#tab#readonly',
      \   },
      \   'mode_map': {
      \     'n':      'NORMAL',
      \     'i':      'INSERT',
      \     'R':      'REPLACE',
      \     'v':      'VISUAL',
      \     'V':      'V-LINE',
      \     "\<C-v>": 'V-BLOCK',
      \     'c':      'COMMAND',
      \     's':      'SELECT',
      \     'S':      'S-LINE',
      \     "\<C-s>": 'S-BLOCK',
      \     't':      'TERMINAL',
      \   },
      \   'enable': {
      \     'statusline': 1,
      \     'tabline': 1
      \   },
      \ }
"call lightline#coc#register()
fun! LightlineBranch()
  let branch = fugitive#head()
  return branch !=# '' ? ''.branch : ''
endfun
fun! LightlineMode()
  let cmdtype = getcmdtype()
  return  cmdtype == ':' ? 'COMMAND' :
        \ cmdtype == '/' ? 'SEARCH' :
        \ cmdtype == '?' ? 'REV-SEARCH' :
        \                   lightline#mode()
endfun
" Schlepp
let g:Schlepp#reindent = 1
" Github Copilot
let g:copilot_filetypes = {
  \ 'haskell': v:false,
  \ 'markdown': v:true,
  \ }
