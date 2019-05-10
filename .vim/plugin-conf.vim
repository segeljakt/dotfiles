"* Plugged
let g:plug_window = "enew"
"* vim-gitgutter
let g:gitgutter_diff_args =
  \   '--no-color'
  \ .' --ignore-cr-at-eol'
  \ .' --ignore-space-at-eol'
  \ .' --ignore-space-change'
  \ .' --ignore-all-space'
  \ .' --ignore-blank-lines'

"* vim-lsc
let g:lsc_enable_autocomplete = v:true
let g:lsc_server_commands = {
  \   'scala': {
  \     'command': 'metals-vim',
  \     'log_level': 'Log'
  \   }
  \ }
let g:lsc_auto_map = {
  \   'GoToDefinition': 'gd',
  \ }
"* vim-markdown-composer
let g:markdown_composer_autostart = 0
"* vim-markdown
let g:vim_markdown_folding_disabled = 1
": NERDTree
let NERDTreeIgnore=['\.pyc$', '\.swp$', '\~$']
let NERDTreeRespectWildIgnore = 1
let NERDTreeWinSize = 13
let NERDTreeMinimalUI = 1
let NERDTreeStatusline = ""
"* NNN
" let g:nnn#layout = { 'left': '~20%' }
let g:nnn#command = 'nnn -l'
let g:nnn#replace_netrw = 1
"* vim-matchup
let g:matchup_matchparen_stopline = 200
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_status_offscreen = 0
"* Vimtex
let g:vimtex_indent_bib_enabled = 0
let g:tex_conceal = "abdmgs"
let g:vimtex_view_method = "skim"
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
let g:winresizer_start_key = "<C-w>,"
"* vim-illuminate
let g:Illuminate_ftblacklist = ['startify']
let g:Illuminate_highlightUnderCursor = 0
hi illuminatedWord guibg=bg gui=underline
"* TComment
let g:tcomment_maps = 0
let g:tcomment#options = {'col': 1}
"* EchoDoc
let g:echodoc#enable_at_startup = 1
"* Completeparameter
ino <expr> ( complete_parameter#pre_complete("()")
nmap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
nmap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
let g:complete_parameter_use_ultisnips_mapping = 0
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
"* ALE
let g:ale_completion_enabled = 1
let g:ale_sign_error = '🔥'
let g:ale_sign_warning = '👉' " ❌
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1 " Use quickfix list instead of loclist
let g:ale_keep_list_window_open = 1 " Always show quickfix list
let g:ale_linters = {
  \  'c':        ['clang'],
  \  'cpp':      ['clang'],
  \  'zsh':      ['shell'],
  \  'sh':       ['shell'],
  \  'rust':     ['rls'],
  \  'python':   ['pylint'],
  \  'scala':    ['metals'],
  \  'markdown': [''],
  \  'pandoc':   [''],
  \  'tex':      [''],
  \  'bib':      ['']
  \ }
let g:ale_fixers = {
  \  'tex':    [''],
  \  'c':      ['remove_trailing_lines', 'trim_whitespace', 'clang-format', 'uncrustify'],
  \  'rust':   ['remove_trailing_lines', 'trim_whitespace', 'rustfmt'],
  \  'zsh':    ['remove_trailing_lines', 'trim_whitespace'],
  \  'sh':     ['remove_trailing_lines', 'trim_whitespace', 'shfmt'],
  \  'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']
  \ }
let g:ale_rust_rls_toolchain = 'nightly' 
let g:ale_rust_cargo_use_clippy = 1
let g:ale_c_gcc_executable = 'gcc-8'
let g:ale_scala_sbtserver_address = '127.0.0.1:4273'
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
imap <C-c> <Plug>(PearTreeFinishExpansion)
imap <C-e> <Plug>(PearTreeJump)
"* Startify
let g:startify_session_dir = '~/.vim/session'
let g:startify_list_order = ['files', 'dir', 'bookmarks', 'sessions', 'commands']
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
let g:startify_files_number = 5
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
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
"* python-mode
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>B'
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>R'
"* camelCaseMotion
map <silent> w  <Plug>CamelCaseMotion_w
map <silent> b  <Plug>CamelCaseMotion_b
map <silent> e  <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
"* Lightline
let g:lightline = {
  \   'colorscheme': 'PaperColor',
  \   'active': {
  \     'left':  [ [ 'mode' ], [ 'readonly', 'modified' ], [ 'path' ] ],
  \     'right': [ [ 'wordcount', 'lineinfo' ], [ 'filetype', 'percent' ],
  \                [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ],
  \   },
  \   'inactive': {
  \     'left':  [ [ 'path' ] ],
  \     'right': [ [ ], [ ], [ ] ],
  \   },
  \   'tabline': {
  \     'left':  [ [ 'tabs' ] ],
  \     'right': [ [ ], [ 'branch', 'time' ] ],
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
  return cmdtype == ':' ? 'COMMAND' :
       \ cmdtype == '/' ? 'SEARCH' :
       \ cmdtype == '?' ? 'REV-SEARCH' :
       \                   lightline#mode()
endfun
function! AreThereTrailingSpaces()
    return 
endfunction
set statusline+=%{AreThereTrailingSpaces()}
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors   = "\uf05e"
let g:lightline#ale#indicator_ok       = "\uf00c"
"* goyo
let g:goyo_height = 100
let g:word_mode = v:false
fun! ToggleWordMode()
  if !g:word_mode
    Goyo | Goyo 80 | Limelight
    set linebreak textwidth=80 spell nonumber noshowmode noshowcmd formatoptions-=t
  el
    Goyo! | Limelight!
    set nolinebreak textwidth=0 nospell number showmode showcmd
  en
  let g:word_mode = !g:word_mode
endfun
"* Schlepp
let g:Schlepp#reindent  = 1
let g:Schlepp#dupTrimWS = 1
"* DrawIt
let g:draw_it_is_active = v:false
fun! ToggleDrawIt()
  if g:draw_it_is_active | DIstop | el | DIsngl | en
  let g:draw_it_is_active = !g:draw_it_is_active
endfun
"* MRU
let MRU_Window_Height = 30
