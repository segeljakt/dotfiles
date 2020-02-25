"* Plugged
let g:plug_window = 'enew'
"* Hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']
"* Clap
hi link ClapSpinner PmenuSel
"* vim-smoothie
let g:smoothie_use_default_mappings = v:false
"* vim-silicon
let g:silicon = {
      \ 'theme':                 'GitHub',
      \ 'background':           '#FFFFFF',
      \ 'line-pad':                     1,
      \ 'pad-horiz':                    0,
      \ 'pad-vert':                     0,
      \ 'line-number':            v:false,
      \ 'window-controls':        v:false,
      \ 'to-clipboard':           v:true,
      \ 'output': '~/Desktop/silicon_{time:%Y-%m-%d_%H-%M-%S}.png',
      \ }
"* vim-choosewin
let g:choosewin_return_on_single_win = 1
let g:choosewin_color_label = {
	    \ 'gui': ['ForestGreen', 'white', 'bold'],
	    \ 'cterm': [9, 16]
	    \ }
let g:choosewin_color_other = {
	    \ 'gui': ['gray20', 'black'],
	    \ 'cterm': [240, 0]
	    \ }
"* vim-stealth
let g:stealth#trigger_after = 1000
"* fzf.vim
hi NormalFloat guibg=None
if exists('g:fzf_colors.bg')
  call remove(g:fzf_colors, 'bg')
endif

if stridx($FZF_DEFAULT_OPTS, '--border') == -1
  let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'
en

function! FloatingFZF()
  let width = float2nr(&columns * 0.9)
  let height = float2nr(&lines * 0.6)
  let opts = { 'relative': 'cursor',
              \ 'row': (&lines - height) / 2,
              \ 'col': (&columns - width) / 2,
              \ 'width': width,
              \ 'height': height }
  let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" let g:fzf_layout = { 'up': '~40%' }
"* markdown-preview.nvim
let g:mkdp_preview_options = {
      \ 'disable_sync_scroll': 1,
      \ 'hide_yaml_meta': 1
      \ }
let g:mkdp_page_title = '「${name}」'
"* vim-surround
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
"* vim-multiple-cursors
let g:VM_maps = {
      \   'Find Under':         '’',
      \   'Find Subword Under': '’',
      \   'Select l':           '<S-Right>',
      \   'Select h':           '<S-Left>',
      \ }
fun! VM_Start()
  nmap <buffer> <C-C> <Esc>
  imap <buffer> <C-C> <Esc>
endfun
fun! VM_Exit()
  nunmap <buffer> <C-C>
  iunmap <buffer> <C-C>
endfun
"* vim-gitgutter
let g:gitgutter_diff_args =
  \  ' --no-color'
  \ .' --ignore-cr-at-eol'
  \ .' --ignore-space-at-eol'
  \ .' --ignore-space-change'
  \ .' --ignore-all-space'
  \ .' --ignore-blank-lines'
"* vim-markdown
let g:vim_markdown_folding_disabled = 1
"* NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\~$']
let NERDTreeRespectWildIgnore = 1
let NERDTreeWinSize = 13
let NERDTreeMinimalUI = 1
let NERDTreeStatusline = ''
"* vim-matchup
let g:matchup_matchparen_stopline = 100
let g:matchup_matchparen_deferred = 0
let g:matchup_matchparen_status_offscreen = 0
"* Vimtex
let g:vimtex_indent_bib_enabled = 0
let g:tex_conceal = 'abdmgs'
let g:vimtex_view_method = 'skim'
let g:tex_flavor = 'latex'
" let g:vimtex_log_verbose = 0
" let g:vimtex_quickfix_enabled = 0
" let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_quickfix_latexlog = {
      \  'default'    : 1,
      \  'general'    : 1,
      \  'references' : 1,
      \  'overfull'   : 1,
      \  'underfull'  : 1,
      \  'font'       : 1,
      \  'packages'   : {
      \    'default'  : 1,
      \    'natbib'   : 1,
      \    'biblatex' : 1,
      \    'babel'    : 1,
      \    'hyperref' : 1,
      \    'scrreprt' : 1,
      \    'fixltx2e' : 1,
      \    'titlesec' : 1,
      \  },
      \ }
"* winresizer
let g:winresizer_start_key = '<C-w>,'
"* vim-illuminate
let g:Illuminate_ftblacklist = ['startify']
let g:Illuminate_highlightUnderCursor = 1
hi illuminatedWord guibg=bg gui=underline
"* TComment
let g:tcomment#mode_extra = '#'
let g:tcomment_maps = 0
let g:tcomment#options = {'col': 1}
"* ALE
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = ''
let g:ale_completion_enabled = 0
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
let g:ale_sign_info = '*'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_keep_list_window_open = 1
let g:ale_linters = {
      \  'c':        ['ccls'],
      \  'cpp':      ['ccls'],
      \  'zsh':      ['shell'],
      \  'sh':       ['shell'],
      \  'rust':     ['rls'],
      \  'python':   ['pylint'],
      \  'scala':    ['metals'],
      \  'markdown': [''],
      \  'pandoc':   [''],
      \  'tex':      [''],
      \  'bib':      [''],
      \  'haskell':  ['cabal_ghc']
      \ }
let g:ale_fixers = {
      \  'tex':    [''],
      \  'c':      ['remove_trailing_lines', 'trim_whitespace', 'clang-format', 'uncrustify'],
      \  'cpp':    ['remove_trailing_lines', 'trim_whitespace', 'clang-format', 'uncrustify'],
      \  'rust':   ['remove_trailing_lines', 'trim_whitespace', 'rustfmt'],
      \  'zsh':    ['remove_trailing_lines', 'trim_whitespace'],
      \  'sh':     ['remove_trailing_lines', 'trim_whitespace', 'shfmt'],
      \  'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']
      \ }
let g:ale_rust_rls_config = { 'rust': { 'clippy_preference': 'on' } }
" let g:ale_rust_rls_executable = 'ra_lsp_server'
let g:ale_rust_rls_toolchain = 'nightly' 
let g:ale_rust_cargo_use_clippy = 1
let g:ale_scala_sbtserver_address = '127.0.0.1:4273'
let g:ale_c_ccls_init_options = {
    \   'cacheDirectory': '/tmp/ccls',
    \   'cacheFormat': 'binary',
    \   'diagnostics': {
    \     'onOpen': 0,
    \     'opChange': 1000,
    \   },
    \ }
"* pear-tree
let g:pear_tree_pairs = {
      \   '(':   {'closer': ')'},
      \   '[':   {'closer': ']'},
      \   '{':   {'closer': '}'},
      \   "'":   {'closer': "'"},
      \   '"':   {'closer': '"'},
      \   '/\*': {'closer': '\*/'}
      \ }
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_repeatable_expand = 0
"* Startify
let g:startify_session_dir = '~/.vim/session'
let g:startify_list_order = ['files', 'dir', 'bookmarks', 'sessions', 'commands']
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
let g:startify_files_number = 5
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = map(split(system('fortune -s | cowsay'), '\n'), '"   ". v:val')
let g:startify_enable_unsafe = 1
let g:startify_skiplist = [
      \   '\.vim/',
      \   '/usr/*',
      \   '\.todo',
      \ ]
let g:startify_lists = [
      \   { 'header': ['   MRU'], 'type': 'files' },
      \   { 'header': ['   Sessions'], 'type': 'sessions' },
      \ ]
"* Lightline
let g:lightline = {
      \   'colorscheme': 'PaperColor',
      \   'active': {
      \     'left':  [ [ 'mode' ], [ 'path' ], ['readonly', 'modified' ] ],
      \     'right': [ [ 'wordcount', 'lineinfo' ], [ 'filetype', 'percent' ], ],
      \   },
      \   'inactive': {
      \     'left':  [ [ 'path' ] ],
      \     'right': [ [ ], [ ], [ ] ],
      \   },
      \   'tabline': {
      \     'left':  [ [ 'tabs' ] ],
      \     'right': [ [ 'branch', 'time' ] ],
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
      \     'path':       '%{&ft!="nnn"?expand("%"):""}',
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
      \     'n' :     'NORMAL',
      \     'i' :     'INSERT',
      \     'R' :     'REPLACE',
      \     'v' :     'VISUAL',
      \     'V' :     'V-LINE',
      \     "\<C-v>": 'V-BLOCK',
      \     'c' :     'COMMAND',
      \     's' :     'SELECT',
      \     'S' :     'S-LINE',
      \     "\<C-s>": 'S-BLOCK',
      \     't':      'TERMINAL',
      \   },
      \   'enable': {
      \     'statusline': 1,
      \     'tabline': 1
      \   },
      \ }
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
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors   = "\uf05e"
let g:lightline#ale#indicator_ok       = "\uf00c"
"* Schlepp
let g:Schlepp#reindent  = 1
let g:Schlepp#dupTrimWS = 1
"* DrawIt
let g:draw_it_is_active = v:false
fun! ToggleDrawIt()
  if g:draw_it_is_active
    DIstop
  el
    DIsngl
  en
  let g:draw_it_is_active = !g:draw_it_is_active
endfun
" merlin
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
