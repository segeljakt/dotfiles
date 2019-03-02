": Plugged
let g:plug_window = "enew"
let g:pluggin=0
com! PlugUpgrade let g:pluggin=1 | PlugUpdate | let g:pluggin=0
": vim-lsc
let g:lsc_enable_autocomplete = v:false
let g:lsc_server_commands = {
  \  'scala': {
  \    'command': 'metals-vim',
  \    'log_level': 'Log'
  \  }
  \}
let g:lsc_auto_map = {
  \  'GoToDefinition': 'gd',
  \}
": vim-markdown
let g:vim_markdown_folding_disabled = 1
": NNN
" let g:nnn#layout = { 'left': '~20%' }
let g:nnn#command = 'nnn -l'
let g:nnn#replace_netrw = 1
": NERDTree
" let NERDTreeIgnore=['\.pyc$', '\.swp$', '\~$']
" let NERDTreeRespectWildIgnore = 1
" let NERDTreeWinSize = 13
" let NERDTreeMinimalUI = 1
" let NERDTreeStatusline = ""
": vim-matchup
let g:matchup_matchparen_stopline = 200
" let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_status_offscreen = 0
": Vimtex
let g:vimtex_indent_bib_enabled = 0
let g:tex_conceal = "abdmgs"
let g:vimtex_view_method = "skim"
let g:tex_flavor = 'latex'
" let g:vimtex_log_verbose = 0
" let g:vimtex_quickfix_enabled = 0
" let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_quickfix_latexlog = {
      \ 'default' : 1,
      \ 'general' : 1,
      \ 'references' : 1,
      \ 'overfull' : 1,
      \ 'underfull' : 1,
      \ 'font' : 1,
      \ 'packages' : {
      \   'default' : 1,
      \   'natbib' : 1,
      \   'biblatex' : 1,
      \   'babel' : 1,
      \   'hyperref' : 1,
      \   'scrreprt' : 1,
      \   'fixltx2e' : 1,
      \   'titlesec' : 1,
      \ },
      \}


": winresizer
let g:winresizer_start_key     = "<C-w>,"
": vim-search-pulse
" let g:vim_search_pulse_mode = 'pattern'
": vim-illuminate
let g:Illuminate_ftblacklist = ['nerdtree', 'startify']
let g:Illuminate_highlightUnderCursor = 0
hi illuminatedWord guibg=bg gui=underline
let g:startify_session_before_save = [
  \   'silent! NERDTreeTabsClose'
  \ ]
": TComment
let g:tcomment_maps = 0
let g:tcomment#options = {'col': 1}
": CoC
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
set completeopt=preview,noinsert,menuone,noselect
set shortmess+=c
": YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']
let g:ycm_key_list_stop_completion = ['<C-y>', '<UP>', '<DOWN>']
let g:ycm_add_menu_to_compelteopt = 1
let g:ycm_key_invoke_completion = '<C-d>'
let g:ycm_min_num_of_chars_for_completion = 99
": EchoDoc
let g:echodoc#enable_at_startup = 1
": Completeparameter
inoremap <expr> ( complete_parameter#pre_complete("()")
nmap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
nmap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
" Compatibility with AutoPairs
let g:complete_parameter_use_ultisnips_mapping = 0
let g:AutoPairs   = { '(':')', '[':']', '{':'}', '"':'"', '`':'`' }
let g:AutoPairsBS = { '(':')', '[':']', '{':'}', '"':'"', '`':'`' }
ino <silent> ) <C-R>=AutoPairsInsert(')')<CR>
let g:rust_keep_autopairs_default=1 " Stop rust.vim from overriding
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
": Vim-devicons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
": Rust
"let g:rust_recommended_style = 0
": IndentGuides
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg= ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg= ctermbg=4
"hi IndentGuidesOdd  guibg='#1c2021' ctermbg=3
"hi IndentGuidesEven guibg='#000000' ctermbg=4
": License
let g:license_author = 'Klas Segeljakt'
let g:license_email = 'klasseg@kth.se'
": rainbow_parentheses.vim
"let g:rbpt_colorpairs = [
    "\ ['brown',       'RoyalBlue3'],
    "\ ['Darkblue',    'SeaGreen3'],
    "\ ['darkgray',    'DarkOrchid3'],
    "\ ['darkgreen',   'firebrick3'],
    "\ ['darkcyan',    'RoyalBlue3'],
    "\ ['darkred',     'SeaGreen3'],
    "\ ['darkmagenta', 'DarkOrchid3'],
    "\ ['brown',       'firebrick3'],
    "\ ['gray',        'RoyalBlue3'],
    "\ ['black',       'SeaGreen3'],
    "\ ['darkmagenta', 'DarkOrchid3'],
    "\ ['Darkblue',    'firebrick3'],
    "\ ['darkgreen',   'RoyalBlue3'],
    "\ ['darkcyan',    'SeaGreen3'],
    "\ ['darkred',     'DarkOrchid3'],
    "\ ['red',         'firebrick3'],
    "\ ]
"let g:rbpt_max = 16
"let g:rbpt_loadcmd_toggle = 0
": vim-racer
set hidden
let g:racer_cmd = "/Users/Klas/.cargo/bin/racer"
let g:racer_experimental_completer = 1
": clang_complete
"let g:clang_library_path='/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib'
": Vdebug
fun! Pydbgp(command)
  exe "python -S /Users/Klas/Git/other-projects/pydbgp/pydbgp -d localhost:9000" a:command
endfun
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:pymode_run_bind='…'
": vim-line-jump
"default g:NERDTreeMapToggleFilters key map is 'f', change it to some key else.
let g:NERDTreeMapToggleFilters="0"
let g:LineJumpSelectIgnoreCase = 1
": FZF
" autocmd! FileType fzf
"autocmd  FileType fzf set laststatus=0 noshowmode noruler
  "\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
": ALE
"let g:ale_c_build_dir_names += 'obj'
let g:ale_completion_enabled = 1
let g:ale_sign_error = '🔥'
let g:ale_sign_warning = '👉' " ❌
let g:ale_set_quickfix = 1 " Use quickfix list instead of loclist
let g:ale_keep_list_window_open = 1 " Always show quickfix list
let g:ale_linters = {
  \ 'c':        ['clang'],
  \ 'cpp':      ['clang'],
  \ 'zsh':      ['shell'],
  \ 'sh':       ['shell'],
  \ 'rust':     ['rls'],
  \ 'python':   ['pylint'],
  \ 'scala':    ['sbtserver'],
  \ 'markdown': [''],
  \ 'pandoc':   [''],
  \ 'tex':      [''],
  \ 'bib':      ['']
  \}
let g:ale_fixers = {
  \ 'tex':  [''],
  \ 'c':      ['remove_trailing_lines', 'trim_whitespace', 'clang-format', 'uncrustify'],
  \ 'rust':   ['remove_trailing_lines', 'trim_whitespace', 'rustfmt'],
  \ 'zsh':    ['remove_trailing_lines', 'trim_whitespace'],
  \ 'sh':     ['remove_trailing_lines', 'trim_whitespace', 'shfmt'],
  \ 'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']
  \}
"let g:ale_echo_msg_format = '<%linter%:%severity%> %code: '
":: Rust
"let g:rust_fold = 2
"let g:ale_rust_rustc_options = ""
let g:ale_rust_rls_toolchain = 'nightly' 
let g:ale_rust_cargo_use_clippy = 1
":: C
let g:ale_c_clang_executable = 'clang'
"let g:ale_c_clang_options = '-std=c11 -Wall               -I /Users/Klas/Git/my-projects/adpc/src/'
"let g:ale_c_clang_options = '-std=c11 -Wall            -I /Users/Klas/Git/my-projects/mario-ascii/src/'
let g:ale_c_gcc_executable = 'gcc-8'
let g:ale_c_gcc_options = '-std=c11 '
                      \ .'-Wall '
                      \ .'-fms-extensions '
                      \ .'-I /Users/Klas/Git/my-projects/mario-ascii/src/ '
                      \ .'-I /Users/Klas/Git/my-projects/mario-ascii/lib/ '
"let g:ale_c_clang_options = $TIZEN_C
"let g:ale_c_clang_options = '-std=c11 -Wall -fms-extensions -I /Users/Klas/Git/my-projects/mario-ascii/src/ -I /Users/Klas/Git/my-projects/mario-ascii/lib/'
"let g:ale_cpp_gcc_options = '-std=c11 -Wall -fms-extensions -I /Users/Klas/Git/my-projects/mario-ascii/src/ -I /Users/Klas/Git/my-projects/mario-ascii/lib/'
":: C++
"let g:ale_cpp_clang_executable = 'clang-8'
"let g:ale_cpp_clang_options = $TIZEN_CPP
":: Rust
"let g:ale_cpp_clang_executable = 'clang'
"let g:ale_cpp_clang_options = '-std=c++14 -Wall -I/usr/local/opt/openssl/include'
"let g:ale_cpp_gcc_executable = 'gcc-7'
"let g:ale_cpp_gcc_options ='-std=c++14 -Wall -I/usr/local/opt/openssl/include' 
"let g:ale_c_gcc_options = '-std=c11 -Wall -fms-extensions -I ~/Git/my-projects/adpc/src/'
"'-std=c11 -Wall -fms-extensions ~/Git/my-projects/mario-ascii/src/'
":: Scala
let g:ale_scala_sbtserver_address = "127.0.0.1:4273"
let g:ale_scala_sbtserver_root = "/Users/Klas/PhD/Git/arc/"
":: Markdown/Pandoc
let g:ale_linter_aliases = {'pandoc': ['markdown']}
": AutoPairs
"let g:AutoPairsShortcutToggle = 0
"let g:AutoPairsShortcutFastWrap = 0
"let g:AutoPairsShortcutJump = 0
"let g:AutoPairsShortcutBackInsert = 0
"let g:AutoPairsMapBS = 0
"let g:AutoPairsMapCh = 0
"let g:AutoPairsMapCR = 0
"let g:AutoPairsCenterLine = 0
"let g:AutoPairsMapSpace = 0
"let g:AutoPairsFlyMode = 0
"let g:AutoPairsMultilineClose = 0
"let g:AutoPairsMoveCharacter = 0
"let g:AutoPairsSmartQuotes = 0
let g:AutoPairsShortcutToggle     = "" " <M-p>
let g:AutoPairsShortcutFastWrap   = "é" " <M-e>
let g:AutoPairsShortcutJump       = "‘" " <M-e>
let g:AutoPairsShortcutBackInsert = "›" " <M-b>
let g:AutoPairsMapBS = 1
let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 1
let g:AutoPairsCenterLine = 1
let g:AutoPairsMapSpace = 1
let g:AutoPairsFlyMode = 0
let g:AutoPairsMultilineClose = 0
"let g:AutoPairsMoveCharacter = 0
"let g:AutoPairsSmartQuotes = 0
": pear-tree
let g:pear_tree_pairs = {
  \ '(': {'closer': ')'},
  \ '[': {'closer': ']'},
  \ '{': {'closer': '}'},
  \ "'": {'closer': "'"},
  \ '"': {'closer': '"'},
  \ '/\*': {'closer': '\*/'}
  \ }
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
imap <C-c> <Plug>(PearTreeFinishExpansion)
imap <C-e> <Plug>(PearTreeJump)
": Colorschemes
let g:gruvbox_contrast_dark="hard" " Needs to be put before loading
"let g:gruvbox_bold=1
"let g:gruvbox_italic=1
"let g:gruvbox_underline=1
"let g:gruvbox_undercurl=1
"let g:gruvbox_contrast_dark="hard"
"let g:gruvbox_contrast_light="light"
"let g:gruvbox_hls_cursor="yellow"
"let g:gruvbox_number_column="black"
"let g:gruvbox_sign_column="default"
"let g:gruvbox_color_column="red"
"let g:gruvbox_vert_split="white"
"let g:gruvbox_italicize_comments=1
"let g:gruvbox_italicize_strings=1
"let g:gruvbox_invert_selection=1
"let g:gruvbox_invert_signs=0
"let g:gruvbox_invert_indent_guides=0 
"let g:gruvbox_invert_tabline=0
"let g:gruvbox_improved_strings=0
"let g:gruvbox_improved_warnings=0
": Startify
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
" TODO: FIX COWSAY
" let g:cowkind = "stegosaurus"
" let g:cow = split(system('echo | cowsay -f'.g:cowkind.' | tail -n +4'), '\n')
" let g:cowkind = "small"
" let g:cowkind = "turtle"
" let g:cowkind = "tux"
" let g:startify_custom_header = map(split, '"   ". v:val')
" let g:startify_custom_header = startify#fortune#cowsay('','═','║','╔','╗','╝','╚')
let g:startify_lists = [
  \   { 'header': ['   MRU'], 'type': 'files' },
  \   { 'header': ['   Sessions'], 'type': 'sessions' },
  \ ]
": thesaurus_query.vim
"let g:tq_openoffice_en_file="~/.vim/thesaurus/th_en_US_v2"
let tq_enabled_backends=["thesaurus_com", "openoffice_en", "datamuse_com"]
": python-mode
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>B'
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>R'
": camelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
": Lightline
let g:lightline = {
  \   'colorscheme': 'PaperColor',
  \   'active': {
  \     'left':  [ [ 'mode'], [ 'readonly', 'modified' ], [ 'path' ] ],
  \     'right': [ [ 'lineinfo' ], [ 'filetype', 'percent' ],
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
  \     'path':         '%{&ft!="nerdtree"?expand("%"):""}',
  \     'filename':     '%t',
  \     'modified':     '%M',
  \     'bufnum':       '%n',
  \     'paste':        '%{&paste?"PASTE":""}',
  \     'readonly':     '%{&readonly?"":""}',
  \     'charvalue':    '%b',
  \     'charvaluehex': '%B',
  \     'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
  \     'fileformat':   '%{&ff}',
  \     'filetype':     '%{&ft==""?"N/A":&ft=="nerdtree"?"":&ft}',
  \     'percent':      '%3p%%',
  \     'percentwin':   '%P',
  \     'spell':        '%{&spell?&spelllang:""}',
  \     'lineinfo':     '%{&ft!="nerdtree"?printf("%3d:%-2d",line("."),col(".")):""}',
  \     'line':         '%l',
  \     'column':       '%c',
  \     'close':        '%999X X ',
  \     'winnr':        '%{winnr()}',
  \     'time':         '%{strftime("%a %b %e %H:%M")}',
  \   },
  \   'component_function': {
  \     'branch': 'LightlineBranch',
  \     'mode':   'LightlineMode',
  \   },
  \   'component_visible_condition': {
  \     'modified':     '&modified||!&modifiable',
  \     'readonly':     '&readonly',
  \     'paste':        '&paste',
  \     'spell':        '&spell',
  \     'lineinfo':     '(&ft != "nerdtree")',
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
  \     'tabnum':   'lightline#tab#tabnum'
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
" fun! LightlinePath()
"   if &ft != "nerdtree"
"     return "%F"
"   el
"     return ""
"   en
" endfun
fun! LightlineBranch()
  let branch = fugitive#head()
  return branch !=# '' ? ''.branch : ''
endfun
fun! LightlineMode()
	let fname = expand('%:t')
  let cmdtype = getcmdtype()
	return fname =~ 'NERD_tree' ? 'NERDTree' :
       \ cmdtype == ':' ? 'COMMAND' :
       \ cmdtype == '/' ? 'SEARCH' :
       \ cmdtype == '?' ? 'REV-SEARCH' :
	     \                   lightline#mode()
endfun
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors   = "\uf05e"
let g:lightline#ale#indicator_ok       = "\uf00c"
": Unite-bibtex
let b:unite_bibtex_prefix = '[@'
let b:unite_bibtex_postfix = ']'
let b:unite_bibtex_separator = ', '
let g:unite_bibtex_bib_files = "/Users/Klas/.vim/bibtex/library.bib"
let g:unite_bibtex_cache_dir = "/Users/Klas/.vim/bibtex/cache"
": Pandoc
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#protect#codeblocks = 0 " Disable indented codeblocks
let g:pandoc#syntax#style#emphases=1
let g:pandoc#syntax#conceal#urls=1
let g:pandoc#syntax#codeblocks#embeds#use=1
let g:pandoc#syntax#style#underline_special=1
let g:pandoc#syntax#style#use_definition_lists=1
let g:pandoc#syntax#codeblocks#embeds#langs = ["c","python","rust","scala","bash=sh"]
": goyo
let g:goyo_height = 100
let g:word_mode = v:false
fun! ToggleWordMode()
  if !g:word_mode  " Activate word_mode
    Goyo | Goyo 80 | Limelight
    set linebreak textwidth=80 spell nonumber noshowmode noshowcmd formatoptions-=t
  el " Deactivate word_mode"
    Goyo! | Limelight!
    set nolinebreak textwidth=0 nospell number showmode showcmd
  en
  let g:word_mode=!g:word_mode
endfun
": Schlepp
let g:Schlepp#reindent  = 1
let g:Schlepp#dupTrimWS = 1
": DrawIt
let g:draw_it_is_active = v:false
fun! ToggleDrawIt()
  if g:draw_it_is_active | DIstop | el | DIsngl | en
  let g:draw_it_is_active = !g:draw_it_is_active
endfun
": MRU
let MRU_Window_Height = 30
