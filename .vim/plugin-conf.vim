": Plugged
let g:plug_window = "tab new"
" <Alt-u> to update, <Alt-i> to install
": YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
": Vim-devicons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
": Rust
let g:rust_recommended_style = 0
": Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete
": IndentGuides
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg= ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg= ctermbg=4
"hi IndentGuidesOdd  guibg='#1c2021' ctermbg=3
"hi IndentGuidesEven guibg='#000000' ctermbg=4
": Wildfire
" This selects the next closest text object.
map ´ <Plug>(wildfire-fuel)
" This selects the previous closest text object.
"vmap <C-SPACE> <Plug>(wildfire-water)
": deoplete.vim and deoplete-rust
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#rust#racer_binary='/Users/Klas/.cargo/bin/racer'
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
let NERDTreeIgnore=['\.pyc$', '\.swp$', '\~$']
"LineJump NERDTree key map
aug LineJumpNerdTree
  au BufEnter NERD_tree_\d\+ nno <buffer> <nowait> <silent> f  <ESC>:silent! call LineJumpSelectForward()<CR>
  au BufEnter NERD_tree_\d\+ nno <buffer> <nowait> <silent> b  <ESC>:silent! call LineJumpSelectBackward()<CR>
aug END
aug LineJumpTagbar
  au BufEnter __Tagbar__ nno <buffer> <nowait> <silent> f  <ESC>:silent! call LineJumpSelectForward()<CR>
  au BufEnter __Tagbar__ nno <buffer> <nowait> <silent> ;  <ESC>:silent! call LineJumpMoveForward()<CR>
  au BufEnter __Tagbar__ nno <buffer> <nowait> <silent> b  <ESC>:silent! call LineJumpSelectBackward()<CR>
  au BufEnter __Tagbar__ nno <buffer> <nowait> <silent> ,  <ESC>:silent! call LineJumpMoveBackward()<CR>
  au BufEnter __Tagbar__ nno <buffer> <nowait> <silent> gh <ESC>:silent! call LineJumpMoveTop()<CR>
  au BufEnter __Tagbar__ nno <buffer> <nowait> <silent> gm <ESC>:silent! call LineJumpMoveMiddle()<CR>
  au BufEnter __Tagbar__ nno <buffer> <nowait> <silent> gl <ESC>:silent! call LineJumpMoveBottom()<CR>
aug END
": FZF
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
": Ale
"nunmap <C-k>
"nunmap <C-j>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"let g:ale_c_build_dir_names += 'obj'
let g:ale_sign_error = '🔥'
let g:ale_sign_warning = '👉'
let g:ale_set_quickfix = 1 " Use quickfix list instead of loclist
let g:ale_keep_list_window_open = 1 " Always show quickfix list
let g:ale_linters = {
  \ 'c':        ['clang'],
  \ 'cpp':      ['clang'],
  \ 'zsh':      ['shell'],
  \ 'sh':       ['shell'],
  \ 'rust':     ['rls'],
  \ 'python':   ['mypy', 'pylint'],
  \ 'markdown': [''],
  \ 'pandoc':   ['']
  \}
let g:ale_fixers = {
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
let g:ale_rust_rls_toolchain = 'stable' 
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
let g:ale_c_clang_options = $TIZEN_C
"let g:ale_c_clang_options = '-std=c11 -Wall -fms-extensions -I /Users/Klas/Git/my-projects/mario-ascii/src/ -I /Users/Klas/Git/my-projects/mario-ascii/lib/'
"let g:ale_cpp_gcc_options = '-std=c11 -Wall -fms-extensions -I /Users/Klas/Git/my-projects/mario-ascii/src/ -I /Users/Klas/Git/my-projects/mario-ascii/lib/'
":: C++
"let g:ale_cpp_clang_executable = 'clang-8'
let g:ale_cpp_clang_options = $TIZEN_CPP
":: Rust
"let g:ale_cpp_clang_executable = 'clang'
"let g:ale_cpp_clang_options = '-std=c++14 -Wall -I/usr/local/opt/openssl/include'
"let g:ale_cpp_gcc_executable = 'gcc-7'
"let g:ale_cpp_gcc_options ='-std=c++14 -Wall -I/usr/local/opt/openssl/include' 
"let g:ale_c_gcc_options = '-std=c11 -Wall -fms-extensions -I ~/Git/my-projects/adpc/src/'
"'-std=c11 -Wall -fms-extensions ~/Git/my-projects/mario-ascii/src/'
":: Markdown/Pandoc
let g:ale_linter_aliases = {'pandoc': ['markdown']}
": AutoPairs
let g:AutoPairs = { '(':')', '[':']', '{':'}', '"':'"', '<':'>' }
let g:AutoPairsShortcutToggle = 0
let g:AutoPairsShortcutFastWrap = 0
let g:AutoPairsShortcutJump = 0
let g:AutoPairsShortcutBackInsert = 0
let g:AutoPairsMapBS = 0
let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 0
let g:AutoPairsCenterLine = 0
let g:AutoPairsMapSpace = 0
let g:AutoPairsFlyMode = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsMoveCharacter = 0
"let g:AutoPairsSmartQuotes = 0
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
": man.vim
nmap K <Plug>ManPreGetPage<CR>
": Startify
let g:startify_session_dir = '~/.vim/session'
let g:startify_list_order = ['files', 'dir', 'bookmarks', 'sessions', 'commands']
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
let g:startify_files_number = 5
let g:startify_change_to_vcs_root = 0
let g:startify_fortune_use_unicode = 1
let g:startify_enable_unsafe = 1
autocmd VimEnter * let t:startify_new_tab = 1
let g:startify_skiplist = [
    \   '\.vim',
    \   '/usr/*',
    \   '\.todo',
    \ ]
let g:startify_custom_header =
      \ startify#fortune#cowsay('', '═','║','╔','╗','╝','╚')
"fun! s:projects()
  "let dirs = systemlist('ls -d ~/Git/my-projects/*/ ~/Phd/Git/*/')
  "return map(dirs, '{'.
    "\   '"line": fnamemodify(v:val, ":h:t")."/",'.
    "\   '"cmd": "NERDTree ".v:val'.
    "\ '}')
"endfun
let g:startify_lists = [ { 'header': ['   MRU'], 'type': 'files' } ]
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
set ruler                              " Show line and column number
set noshowmode
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \   'colorscheme': 'wombat',
      \   'active': {
      \     'left': [ [ 'mode'],
      \               [ 'readonly', 'modified' ],
      \               [ 'absolutepath' ] ],
      \     'right': [ [ 'lineinfo' ],
      \                [ 'filetype' ],
      \                [ 'linepos', 'percent' ] ],
      \   },
      \   'inactive': {
      \     'left': [ [ 'absolutepath' ] ],
      \     'right': [ [ 'lineinfo' ],
      \                [ 'percent' ] ]
      \   },
      \   'separator': { 'left': '', 'right': '' },
      \   'subseparator': { 'left': '', 'right': '' },
      \   'tabline_separator': { 'left': '', 'right': '' },
      \   'tabline_subseparator': { 'left': '', 'right': '' },
      \   'tab': {
      \     'active': [ 'filename', 'modified' ],
      \     'inactive': [ 'filename', 'modified' ]
      \   },
      \   'tabline': {
      \     'left': [ [ 'tabs' ] ],
      \     'right': [ [ ] ],
      \   },
      \   'component': {
      \     'mode': '%{lightline#mode()}',
      \     'linepos': '%{LineNoIndicator()}',
      \     'absolutepath': '%F',
      \     'relativepath': '%f',
      \     'filename': '%t',
      \     'modified': '%M',
      \     'bufnum': '%n',
      \     'paste': '%{&paste?"PASTE":""}',
      \     'readonly': '%R',
      \     'charvalue': '%b',
      \     'charvaluehex': '%B',
      \     'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
      \     'fileformat': '%{&ff}',
      \     'filetype': '%{&ft!=#""?&ft:"no ft"}',
      \     'percent': '%3p%%',
      \     'percentwin': '%P',
      \     'spell': '%{&spell?&spelllang:""}',
      \     'lineinfo': '%3l:%-2v',
      \     'line': '%l',
      \     'column': '%c',
      \     'close': '%999X X ',
      \     'winnr': '%{winnr()}',
      \     'pwd': '%pwd',
      \   },
      \   'component_function': {
      \     'readonly': 'LightlineReadonly',
      \     'fugitive': 'LightlineFugitive',
      \     'filetype': 'MyFiletype',
      \     'fileformat': 'MyFileformat',
      \   },
      \   'component_visible_condition': {
      \     'modified': '&modified||!&modifiable',
      \     'readonly': '&readonly',
      \     'paste': '&paste',
      \     'spell': '&spell'
      \   },
      \   'component_function_visible_condition': { },
      \   'component_expand': {
      \     'tabs': 'lightline#tabs'
      \   },
      \   'component_type': {
      \     'tabs': 'tabsel',
      \     'close': 'raw'
      \   },
      \   'component_raw': { },
      \   'tab_component':  { },
      \   'tab_component_function': {
      \     'filename': 'lightline#tab#filename',
      \     'modified': 'lightline#tab#modified',
      \     'readonly': 'lightline#tab#readonly',
      \     'tabnum': 'lightline#tab#tabnum'
      \   },
      \   'mode_map': {
      \     'n' : 'NORMAL',
      \     'i' : 'INSERT',
      \     'R' : 'REPLACE',
      \     'v' : 'VISUAL',
      \     'V' : 'V-LINE',
      \     "\<C-v>": 'V-BLOCK',
      \     'c' : 'COMMAND',
      \     's' : 'SELECT',
      \     'S' : 'S-LINE',
      \     "\<C-s>": 'S-BLOCK',
      \     't': 'TERMINAL',
      \   },
      \   'enable': {
      \     'statusline': 1,
      \     'tabline': 1
      \   },
      \ }
fun! LightlineReadonly()
  return &readonly ? '' : ''
endfun
fun! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfun
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype.' '.WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
": NERDTree
let g:NERDTreeWinSize = 20
let g:NERDTreeChDirMode = 1
let NERDTreeCreatePrefix=""
" Open nerdtree when vim starts
"autocmd vimenter * if winwidth(0) > 111 | NERDTree | endif
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && winwidth(0) > 110 | NERDTree | endif
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close nerdtree if its the only window left
" UI Size
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Nerdtree colors
hi Directory guifg=#FF0000 ctermfg=red
" Focus and Zoom NERDTree
let g:NERDTreeZoomCurrentWindow=2
fun! ZoomNERDTreeFromOtherWindow()
  if winnr() == 1
    exe "vertical resize" g:NERDTreeWinSize
    exe g:NERDTreeZoomCurrentWindow "wincmd w"
  else
    let g:NERDTreeZoomCurrentWindow = winnr()
    exe 'NERDTreeFocus'
    exe "vertical resize 999"
  endif
endfun
": Unite-bibtex
let b:unite_bibtex_prefix = '[@'
let b:unite_bibtex_postfix = ']'
let b:unite_bibtex_separator = ', '
let g:unite_bibtex_bib_files = "/Users/Klas/.vim/bibtex/library.bib"
let g:unite_bibtex_cache_dir = "/Users/Klas/.vim/bibtex/cache"
": Pandoc
let g:pandoc#syntax#protect#codeblocks = 0 " Disable indented codeblocks
"syn clear pandocCodeblock " Force it
let g:pandoc#modules#disabled = ["folding"]
"let g:pandoc#syntax#conceal#use=1
"let g:pandoc#syntax#conceal#blacklist=[]
let g:pandoc#syntax#style#emphases=1
"let g:pandoc#syntax#conceal#cchar_overrides=[]
let g:pandoc#syntax#conceal#urls=1
"let g:pandoc#syntax#codeblocks#ignore=[]
let g:pandoc#syntax#codeblocks#embeds#use=1
let g:pandoc#syntax#codeblocks#embeds#langs=["c"]
let g:pandoc#syntax#style#emphases=1
let g:pandoc#syntax#style#underline_special=1
let g:pandoc#syntax#style#use_definition_lists=1
"let g:pandoc#after#modules#enabled = ["nrrwrgn", "ultisnips", "unite", "vim-table-mode"]
let g:pandoc#syntax#codeblocks#embeds#langs = ["c","python","bash=sh"]
": NERDCommenter
nmap <C-q> <plug>NERDCommenterAppend
nmap q <plug>NERDCommenterToggle
vmap q <plug>NERDCommenterToggle
"execute "normal \<Plug>NERDCommenterAltDelims"
let g:NERDAltDelims_c = 0
": vim-macvim-transparency
"let g:macvim_transparency_roller = [0, 100]
" roll from
"nmap <F10> <Plug>(macvim-transparency-roll)
": present.vim
"nno ∏ :call TogglePresentMode()<CR>
"nno π :call StartPresentMode()<CR>
let g:present_mode=0
let g:cursor_hidden=0
fun! StartPresentMode()
  normal StartPresenting
  call TogglePresentMode()
endfun
fun! CreateColorTrace(end, fg)
  let l:region="REGION_".a:fg
  " Create highlight group for color
  exe "hi" l:region "guifg=" a:fg
  " Highlight characters between ends, and conceal ends 
  exe "syn region" l:region "matchgroup=colortrace"
        \ "start=/".a:end."/ end=/".a:end."/ concealends containedin=ALL"
  exe "vno" a:end "<C-v>I".a:end."<C-c>gvlA".a:end."<C-c>"
endfun
fun! DeleteColorTrace(end, fg)
  let l:region="REGION_".a:fg
  " Clear syntax
  exe "syn clear" l:region
  exe "vunmap" a:end
endfun
fun! ToggleCursor()
  if !g:cursor_hidden
    hi clear Cursor
  else
    hi Cursor cterm=reverse gui=reverse
  endif
  let g:cursor_hidden=!g:cursor_hidden
endfun
fun! TogglePresentMode()
  let g:present_mode=!g:present_mode
  if g:present_mode
    "exe "Goyo"
    "exe "Goyo 80"
    exe "hi pandocDelimitedCodeBlockLanguage guifg=".synIDattr(hlID("Normal"), "bg")
    " RED=<Alt-r>, BLUE=<Alt-b>, GREEN=<Alt-g>, Yellow=<Alt-y>, Grey=<Alt-f>
    exe CreateColorTrace("®","red")
    exe CreateColorTrace("¸","green")
    exe CreateColorTrace("›","blue")
    exe CreateColorTrace("µ","yellow")
    exe CreateColorTrace("ƒ","grey")
    exe CreateColorTrace("ç","cyan")
    set concealcursor=nv
    set nospell
    set nowrap
    " Remove colors with <Alt-q>
    vno • <C-v>I<BS><C-c>gvA<BS><C-c>
    iunmap <Up>
    iunmap <Down>
    iunmap <Left>
    iunmap <Right>
  else
    "exe "Goyo!"
    hi! link pandocDelimitedCodeBlockLanguage Comment
    exe DeleteColorTrace("®","red")
    exe DeleteColorTrace("¸","green")
    exe DeleteColorTrace("›","blue")
    exe DeleteColorTrace("µ","yellow")
    exe DeleteColorTrace("ƒ","grey")
    exe DeleteColorTrace("ç","cyan")
    set concealcursor=
    set wrap
    vunmap •
    imap <Up>    <Nop>
    imap <Down>  <Nop>
    imap <Left>  <Nop>
    imap <Right> <Nop>
  endif
endfun
": goyo
let g:goyo_height = 100
let g:word_mode=0
fun! ToggleWordMode()
  if(g:word_mode==0) " Activate word_mode
    let g:word_mode=1
    exe "Goyo"
    exe "Goyo 80"
    Limelight
    set linebreak
    set textwidth=80
    nno j gj
    nno k gk
    ino <C-j> <Esc>gji
    ino <C-k> <Esc>gki
    set spell
    set nonumber
    set noshowmode
    set noshowcmd
    set formatoptions-=t
    nno <Up> <Nop>
    nno <Down> <Nop>
    nno <Left> <Nop>
    nno <Right> <Nop>
  else " Deactivate word_mode"
    let g:word_mode=0
    exe "Goyo!"
    Limelight!
    set nolinebreak
    set textwidth=0
    nno j j
    nno k k
    ino <C-j> <Esc>ji
    ino <C-k> <Esc>ki
    set nospell
    set number
    set showmode
    set showcmd
    nno <Up> <C-w>k
    nno <Down> <C-w>j
    nno <Left> <C-w>h
    nno <Right> <C-w>l
  endif
endfun
": investigate
"let g:investigate_use_dash=1
": ultisnips
let g:UltiSnipsExpandTrigger="<Leader><Leader>"
let g:UltiSnipsJumpForwardTrigger="<Leader><Leader>"
let g:UltiSnipsJumpBackwardTrigger=""
": Schlepp
vmap i       <Plug>SchleppToggleReindent
vmap <Up>    <Plug>SchleppUp
vmap <Down>  <Plug>SchleppDown
vmap <Left>  <Plug>SchleppLeft
vmap <Right> <Plug>SchleppRight
vmap K       <Plug>SchleppUp
vmap J       <Plug>SchleppDown
vmap H       <Plug>SchleppLeft
vmap L       <Plug>SchleppRight
vmap D       <Plug>SchleppDup
let g:Schlepp#reindent  = 1
let g:Schlepp#dupTrimWS = 1
": DrawIt
let g:draw_it_is_active = 0
fun! ToggleDrawIt()
  if g:draw_it_is_active
    DIstop
    let g:draw_it_is_active = 0
  else
    DIsngl
    let g:draw_it_is_active = 1
  endif
endfun
": github-dashboard
let g:github_dashboard = { 'username': g:github_username, 'password': g:github_password }
": easytags
"set tags=/Users/Klas/.vimtags
": vim_current_word
"let g:vim_current_word#highlight_current_word = 0
": MRU
let MRU_Window_Height = 30
