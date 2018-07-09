": Plugged
let g:plug_window = "tab new"
" <Alt-u> to update, <Alt-i> to install
nnoremap ı :PlugInstall<CR>
nnoremap ü :PlugUpdate<CR>
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
": Calendar
nnoremap ç :Calendar<CR>
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
": Language Server Client
"let g:lsc_server_commands = {'rust': 'rustup run stable rls'}
": Language Server Protocol
" Required for operations modifying multiple buffers like rename.
"set hidden

"let g:LanguageClient_serverCommands = {
      "\ 'rust': ['rustup', 'run', 'stable', 'rls'],
      "\ 'javascript': ['javascript-typescript-stdio'],
      "\ 'javascript.jsx': ['javascript-typescript-stdio'],
      "\ }
"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
": Yankring
"nnoremap <C-o> :YRShow<CR>  
"let g:yankring_replace_n_pkey = ""
"let g:yankring_replace_n_nkey = ""
": clang_complete
let g:clang_library_path='/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib'
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
  au BufEnter NERD_tree_\d\+ nnoremap <buffer> <nowait> <silent> f  <ESC>:silent! call LineJumpSelectForward()<CR>
  au BufEnter NERD_tree_\d\+ nnoremap <buffer> <nowait> <silent> b  <ESC>:silent! call LineJumpSelectBackward()<CR>
aug END
aug LineJumpTagbar
  au BufEnter __Tagbar__ nnoremap <buffer> <nowait> <silent> f  <ESC>:silent! call LineJumpSelectForward()<CR>
  au BufEnter __Tagbar__ nnoremap <buffer> <nowait> <silent> ;  <ESC>:silent! call LineJumpMoveForward()<CR>
  au BufEnter __Tagbar__ nnoremap <buffer> <nowait> <silent> b  <ESC>:silent! call LineJumpSelectBackward()<CR>
  au BufEnter __Tagbar__ nnoremap <buffer> <nowait> <silent> ,  <ESC>:silent! call LineJumpMoveBackward()<CR>
  au BufEnter __Tagbar__ nnoremap <buffer> <nowait> <silent> gh <ESC>:silent! call LineJumpMoveTop()<CR>
  au BufEnter __Tagbar__ nnoremap <buffer> <nowait> <silent> gm <ESC>:silent! call LineJumpMoveMiddle()<CR>
  au BufEnter __Tagbar__ nnoremap <buffer> <nowait> <silent> gl <ESC>:silent! call LineJumpMoveBottom()<CR>
aug END
": CtrlP
let g:ctrlp_match_window='bottom,order:btt,min:1,max:10,results:10'
": Ale
"nunmap <C-k>
"nunmap <C-j>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"let g:ale_c_build_dir_names += 'obj'
"o
"
let g:ale_sign_error = '🔥'
let g:ale_sign_warning = '💀'


let g:ale_linters = {
                    \ 'python': ['mypy', 'pylint'],
                    \ 'zsh':    ['shell'],
                    \ 'c':      ['gcc'],
                    \ 'cpp':    ['g++'],
                    \ 'rust':   ['rls'],
                    \}
"let g:ale_echo_msg_format = '<%linter%:%severity%> %code: '
nnoremap t :ALEGoToDefinition<CR>
":: Rust
"let g:ale_rust_rustc_options = ""
let g:ale_rust_rls_toolchain = 'stable' 
":: C
let g:ale_c_clang_executable = 'clang'
let g:ale_c_clang_options = '-std=c11 -Wall               -I /Users/Klas/Git/my-projects/adpc/src/'
"let g:ale_c_clang_options = '-std=c11 -Wall            -I /Users/Klas/Git/my-projects/mario-ascii/src/'
let g:ale_c_gcc_executable = 'gcc-8'
let g:ale_c_gcc_options = '-std=c11 -Wall -fms-extensions -I /Users/Klas/Git/my-projects/mario-ascii/src/ -I /Users/Klas/Git/my-projects/mario-ascii/lib/'
":: CPP
let g:ale_cpp_clang_executable = 'clang'
let g:ale_cpp_clang_options = '-std=c++14 -Wall -I/usr/local/opt/openssl/include'
let g:ale_cpp_gcc_executable = 'gcc-7'
let g:ale_cpp_gcc_options ='-std=c++14 -Wall -I/usr/local/opt/openssl/include' 
"let g:ale_c_gcc_options = '-std=c11 -Wall -fms-extensions -I ~/Git/my-projects/adpc/src/'
 "'-std=c11 -Wall -fms-extensions ~/Git/my-projects/mario-ascii/src/'
let g:ale_set_quickfix = 1 " Use quickfix list instead of loclist
let g:ale_keep_list_window_open = 1 " Always show quickfix list
": Buffergator
"let g:buffergator_suppress_keymaps = 1 " Disable default keymaps
"let g:buffergator_viewport_split_policy = "n" " Use existing window
"nnoremap : :BuffergatorOpen<CR>
": AutoPairs
let g:AutoPairs = {
      \ '(':')',
      \ '[':']',
      \ '{':'}',
      \ '"':'"',
      \ '<':'>',
      \ }
let g:AutoPairsMapCh = 0
" Unmap autopairs
"if exists("autopairs_disabled") == 0
"let autopairs_disabled=1
"iunmap <buffer> <C-h>
"endif
"inoremap <buffer> <silent> <CR> <C-R>=AutoPairsReturn()<CR>
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
": Colorscheme switcher
" <Alt-l> to switch colorscheme
nnoremap ﬁ :NextColorScheme<CR>
nnoremap ˛ :PrevColorScheme<CR>
": man.vim
nmap K <Plug>ManPreGetPage<CR>
": Startify
let g:startify_session_dir = '~/.vim/session'
let g:startify_list_order = ['files', 'dir', 'bookmarks', 'sessions', 'commands']
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
let g:startify_files_number = 5
let g:startify_change_to_vcs_root = 0
let g:num_items = 3
let g:startify_fortune_use_unicode = 1
let g:startify_enable_unsafe = 1
autocmd VimEnter * let t:startify_new_tab = 1
"autocmd BufEnter *
  "\ if !exists('t:startify_new_tab') && empty(expand('%')) |
  "\   let t:startify_new_tab = 1 |
  "\   Startify |
  "\ endif
let g:startify_skiplist = [
    \   '\.vim',
    \   '/usr/*',
    \   '\.todo',
    \ ]
let g:startify_custom_header =
      \ startify#fortune#cowsay('', '═','║','╔','╗','╝','╚')
fun! s:list_commits(repo)
  let commits = systemlist('git -C '.a:repo.' log | head -n'.g:num_items)
  return map(commits, '{'.
    \   '"line": matchstr(v:val, "\\s\\zs.*"),'.
    \   '"cmd": "Git -C '.a:repo.' show ". matchstr(v:val, "^\\x\\+")'.
    \ '}')
endfun
"[1]: Todo
fun! s:list_todos()
  let todos = systemlist('cat ~/.todo | head -n'.g:num_items)
  return map(todos, '{'.
    \   '"line": matchstr(v:val, "\\s*\\[.*\\]:\\s*\\zs.*"),'.
    \   '"cmd": "edit ~/.todo"'.
    \ '}')
endfun
let g:startify_lists = [
    \   { 'header': ['   MRU'],             'type': 'files' },
    \   { 'header': ['   Commits to '.getcwd()],    'type': function('s:list_commits', [getcwd()]) },
    \   { 'header': ['   Commits to arc'],           'type': function('s:list_commits', ['~/Git/cda/arc/']) },
    \   { 'header': ['   Commits to jobmanagement'], 'type': function('s:list_commits', ['~/Git/cda/jobmanagement/']) },
    \   { 'header': ['   TODO'],            'type': function('s:list_todos') },
    \ ]
": thesaurus_query.vim
"let g:tq_openoffice_en_file="~/.vim/thesaurus/th_en_US_v2"
let tq_enabled_backends=["thesaurus_com", "openoffice_en", "datamuse_com"]
nnoremap d<Tab> :ThesaurusQueryReplaceCurrentWord<CR>
": python-mode
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>B'
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>R'
": ConqueGDB
"nnoremap cd :ConqueGdbTab
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
let g:NERDTreeWinSize = 15
let g:NERDTreeChDirMode = 1
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
nnoremap <silent> <C-a> :call ZoomNERDTreeFromOtherWindow()<CR>
": Unite-bibtex
nnoremap ø :tabedit ~/.vim/bibtex/library.bib<CR>
nnoremap › :AsyncRun open https://www.kth.se/en/kthb<CR>
nnoremap ‹ :AsyncRun open https://scholar.google.se<CR>
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
": TaskList
nnoremap <leader>v <Plug>TaskList
": present.vim
"nnoremap ∏ :call TogglePresentMode()<CR>
"nnoremap π :call StartPresentMode()<CR>
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
  exe "vnoremap" a:end "<C-v>I".a:end."<C-c>gvlA".a:end."<C-c>"
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
    vnoremap • <C-v>I<BS><C-c>gvA<BS><C-c>
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
nnoremap <silent> Ω :Goyo<CR>
let g:word_mode=0
nnoremap <silent> Ω :call ToggleWordMode()<CR>
fun! ToggleWordMode()
  if(g:word_mode==0) " Activate word_mode
    let g:word_mode=1
    exe "Goyo"
    exe "Goyo 80"
    Limelight
    set linebreak
    set textwidth=80
    nnoremap j gj
    nnoremap k gk
    inoremap <C-j> <Esc>gji
    inoremap <C-k> <Esc>gki
    set spell
    set nonumber
    set noshowmode
    set noshowcmd
    set formatoptions-=t
    nnoremap <Up> <Nop>
    nnoremap <Down> <Nop>
    nnoremap <Left> <Nop>
    nnoremap <Right> <Nop>
  else " Deactivate word_mode"
    let g:word_mode=0
    exe "Goyo!"
    Limelight!
    set nolinebreak
    set textwidth=0
    nnoremap j j
    nnoremap k k
    inoremap <C-j> <Esc>ji
    inoremap <C-k> <Esc>ki
    set nospell
    set number
    set showmode
    set showcmd
    nnoremap <Up> <C-w>k
    nnoremap <Down> <C-w>j
    nnoremap <Left> <C-w>h
    nnoremap <Right> <C-w>l
  endif
endfun
": investigate
"let g:investigate_use_dash=1
": vim-bbye
"nnoremap <Leader>å :Bdelete<CR>
": vim-argwrap
nnoremap <silent> Ö :ArgWrap<CR>
": sideways
nnoremap <C-H> :SidewaysLeft<CR>
nnoremap <C-L> :SidewaysRight<CR>
": nrrwrgn
"vnoremap <C-i> :NR<CR>
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
noremap <silent> ö <Esc>:silent call ToggleDrawIt()<CR>
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
": vim-vmath
vmap <expr> ++ VMATH_YankAndAnalyse()
nmap        ++ vip++
": vim-table-mode
inoremap <C-Q> <Esc>:TableModeToggle<CR><Esc>:TableModeRealign<CR>li
"inoremap <Leader>r :TableModeRealign<CR>
": bbye
nnoremap Å :Bdelete!<CR>
nnoremap å :x<CR>
nnoremap ˙ :Bdelete!<CR>:x<CR>
": github-dashboard
let g:github_dashboard = { 'username': g:github_username, 'password': g:github_password }
nnoremap gh :GHActivity<CR>
": ctrlp-funky
nnoremap <Leader>p :CtrlPFunky<CR>
": ctrlp
nnoremap <C-p> :CtrlP<CR>
": ag
nnoremap <leader>aa :Ag
": a.vim
nnoremap ga :A<CR>
": easytags
"set tags=/Users/Klas/.vimtags
": vim_current_word
"let g:vim_current_word#highlight_current_word = 0
" Cref
map <silent> <Leader>cq <Plug>CRV_CRefVimAsk
": MRU
nnoremap <C-u> :MRU<CR>
let MRU_Window_Height = 30
