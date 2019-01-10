"+----------------------------------------------------------------------------+
"|                  Author: Klas Segeljakt <klasseg@kth.se>                   |
"+----------------------------------------------------------------------------+
set nocp                        " Always do this first
let g:gruvbox_contrast_dark="hard" " Needs to be put before loading
call plug#begin('~/.local/share/nvim/plugged')
"Plug 'w0rp/ale'
"let g:ale_linters = {'rust': ['rls'], 'c': ['gcc']}
"let g:ale_c_gcc_executable = '/usr/local/bin/gcc-8'
"let g:ale_set_highlights = 0
"let g:ale_rust_rls_toolchain = "stable"
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'majutsushi/tagbar'
"Plug 'valloric/youcompleteme'
Plug 'tpope/vim-endwise'
Plug 'raimondi/delimitmate'
"Plug 'tenfyzhong/completeparameter.vim'
Plug 'airblade/vim-gitgutter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'klassegeljakt/vim-stealth'
Plug 'scrooloose/nerdtree'
Plug 'zirrostig/vim-schlepp'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'pest-parser/pest.vim'
Plug 'junegunn/vim-emoji'
Plug 'timonv/vim-cargo'
"Plug 'typeintandem/vim'
call plug#end()
colorscheme gruvbox
nnoremap <silent> <C-w>h :TmuxNavigateLeft<CR>
nnoremap <silent> <C-w>j :TmuxNavigateDown<CR>
nnoremap <silent> <C-w>k :TmuxNavigateUp<CR>
nnoremap <silent> <C-w>l :TmuxNavigateRight<CR>
nnoremap <silent> <C-w>p :TmuxNavigatePrevious<CR>
let g:rust_recommended_style = 0
let g:rust_fold = 1
let g:rust_bang_comment_leader = 1
nmap <F8> :TagbarToggle<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
"let g:ycm_rust_src_path = "~/.rustup  "'~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src'
let g:ycm_rust_src_path = "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/"

let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_stop_completion = ['<CR>']
let g:ycm_key_invoke_completion = '<Tab>'
"let g:ycm_cache_omnifunc = 0
"let g:ycm_use_ultisnips_completer = 0
"inoremap <silent><expr> ( complete_parameter#pre_complete("()")
"smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
"imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
"smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
"imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
nmap <C-q> <plug>NERDCommenterAppend
nmap q <plug>NERDCommenterToggle
vmap q <plug>NERDCommenterToggle
let g:NERDAltDelims_c = 0
let delimitMate_expand_cr = 1
" Lightline
set updatetime=250
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
      \                [ 'percent' ] ],
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
"inoremap <unique> § <C-X><C-O><C-P>
"": General settings
let mapleader = "§"             " Leader key
let g:author = "Klas Segeljakt" " My name
let g:email = "klass@spotify.com"  " My email
syn enable                      " Enable syntax
filetype plugin indent on       " Detect filetypes
"set noautoindent                  " Preserve indentation on new lines
set autoread                    " Automatically read changes
set autowriteall                " Automatically write when changing file
set background=dark             " Dark background
set bufhidden=hide              " Delete buffer when closing window
"set nosmartindent                 " Adapt indentation to { scope }
set cindent                     " Autmatic c indentation
set cinkeys-=0#,:               " Comments don't fiddle with indenting
set cinoptions=l1,c0,C0,\0      " Do not indent switch-cases
set concealcursor=nv            " Conceal only in normal and visual mode
set conceallevel=2              " Replace concealed text with char, if any
set cpo-=aA                     " Read and write shouldn't set #
set dict=~/.vim/dict/basic      " Dictionary
set fileformats=unix,mac,dos    " Handle all, but prefer unix
set fileignorecase              " Always do the above
set fillchars=vert:\│           " Borders
set foldclose="all"             " Autoclose folds
"set guicursor+=a:blinkon0       " Disable blinking
"set guifont=Menlo\ for\ Powerline:h11
"set guifont=Ubuntu\ Mono\ derivative\ Powerline:h13
set hlsearch                    " Highlight matches of search
set ignorecase                  " Ignore case when searching
set incsearch                   " Highlight pattern while searching
set infercase                   " Adjust completion to match case
set laststatus=2                " Always show statusline
set lazyredraw                  " Do not redraw while executing macros
set linebreak                   " Break by word instead of char
"set macthinstrokes              " Tighter font
set noshowmode                  " Do not bother showing current mode
set number                      " Row numbers
set pumheight=25                " Only show 5 completion items max
set showcmd                     " Show visual selection
set showfulltag                 " Show full tag when matching from tagfile
set showtabline=2               " Always show tabline
set spelllang=en_us             " We speak American
set splitright                  " Puts splits on right hand side
set tagcase=match               " Case-sensitive tag search
set title                       " Show filename in titlebar
set virtualedit=block           " Select whitespaces
set wildignore=*.class,*.o,*~,*.pyc,.git,*.out
set wildignorecase              " Ignore case when completing filenames
set wildmenu                    " Tabcompletion for commandline
set formatoptions=rownlj        " r: Comment on Enter
set hidden
set diffopt+=context:0
set undofile
set undodir=~/.config/nvim/undodir
" o: Comment on o
" w: Trailing whitespace = Same
" n: Recognize numbered lists
" l: Do not break long lines
" j: Remove comment when joining lines
" Get character at offset relative to cursor
" Config
nnoremap æ :tabnew ~/.config/nvim/init.vim<CR>
" Conditionally remap Enter in insert mode
" Search
nnoremap <S-Space> /
" Up down
nnoremap <D-j> j<C-e>
nnoremap <D-k> k<C-y>
" Change directory
nnoremap cd :cd %:p:h<CR>:NERDTreeCWD<CR>
" Terminal
nnoremap <D-i> :terminal ++close<CR>
" Remove whitespaces
nnoremap ä :%s/\s\+$//e<CR>
" Format file
nnoremap cu gg=G``
" Yank and replace with whitespace
vnoremap <C-y> ygvr<Space>
" Log
"nnoremap <Leader>V :set vfile="~/.vimverbose"
" Write backwards
nnoremap <Leader>b :set ri!<CR>
" Fullscreen toggle
nnoremap <Leader>fu :set fu!<CR>
" Diff mode
nnoremap <Leader>dd :set diff!<CR>
" Bind cursor movement and scrolling between windows
nnoremap <Leader>g :set cursorbind! scrollbind!<CR>
nnoremap R gR| " Tabs work as expected in replace mode
nnoremap B ^| " Go to start of line
nnoremap E <C-y>| " Scroll up
" Swap # with *
nnoremap # *N
nnoremap * #N
vnoremap # *N
vnoremap * *N
nnoremap <Space> :
vnoremap <Space> :
" Highlight last inserted text
nnoremap gV `[v`]<Space>
noremap <silent> F :let @/ = ""<CR>| " Clear matches and errors/warnings
"noremap µ ~| " Toggle case with <Alt-y>
nnoremap y vy|           " Yank char
inoremap <C-c> <Esc>|    " Write multiple lines with <C-v>I or <C-v>A
nnoremap ¨ k^|           " Move to start of line above
" Move in insert mode
inoremap ˛ <Left>
inoremap √ <Down>
inoremap ª <Up>
inoremap ﬁ <Right>
inoremap   <Space>|      " <Alt+Space> key should be treated as <Space>
nnoremap <C-o> :reg<CR>| " View yanks with <C-o>
nnoremap <C-d> :x<CR>|   " Exit window
nnoremap <C-s> :w<CR>|   " Save
nnoremap ı :%s///g<Left><Left>
": Whitespace/Tabs
set expandtab                   " Expand tabs to spaces
set tabstop=2                   " Number of spaces per tab
set shiftwidth=2                " Number of spaces for each autoindent
set softtabstop=2               " ?
set shiftround                  " Indent to round number of spaces
"inoremap <Tab> <Tab>
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
": Folding
" Fold Expression
fun! MyFoldExpr()
  let thisline = getline(v:lnum)
  if match(thisline, '^.:::') >= 0
    return ">3"
  elseif match(thisline, '^.::') >= 0
    return ">2"
  elseif match(thisline, '^.:') >= 0
    return ">1"
  "elseif match(thisline, '^\/\*\*--') >= 0
    "return ">2"
  "elseif match(thisline, '^\/\*-') >= 0
    return ">1"
  else
    return "="
  endif
endfun
set foldmethod=expr
set foldexpr=MyFoldExpr()
": Digraphs
ino <C-l>0 ₀|ino <C-o>0 ⁰
ino <C-l>1 ₁|ino <C-o>1 ¹
ino <C-l>2 ₂|ino <C-o>2 ²
ino <C-l>3 ₃|ino <C-o>3 ³
ino <C-l>4 ₄|ino <C-o>4 ⁴
ino <C-l>5 ₅|ino <C-o>5 ⁵
ino <C-l>6 ₆|ino <C-o>6 ⁶
ino <C-l>7 ₇|ino <C-o>7 ⁷
ino <C-l>8 ₈|ino <C-o>8 ⁸
ino <C-l>9 ₉|ino <C-o>9 ⁹
ino <C-l>+ ₊|ino <C-o>+ ⁺
ino <C-l>- ₋|ino <C-o>- ⁻
ino <C-l>= ₌|ino <C-o>= ⁼
ino <C-l>( ₍|ino <C-o>( ⁽
ino <C-l>) ₎|ino <C-o>) ⁾
             ino <C-o>~  ̃

ino <C-l>a ₐ|ino <C-o>a ᵃ|ino <C-o>A ᴬ
ino <C-l>b ₆|ino <C-o>b ᵇ|ino <C-o>B ᴮ
ino <C-l>c ꜀|ino <C-o>c ᶜ|
ino <C-l>d ₔ|ino <C-o>d ᵈ|ino <C-o>D ᴰ
ino <C-l>e ₑ|ino <C-o>e ᵉ|ino <C-o>E ᴱ
ino <C-l>f բ|ino <C-o>f ᶠ|
ino <C-l>g ₉|ino <C-o>g ᵍ|ino <C-o>G ᴳ
ino <C-l>h ₕ|ino <C-o>h ʰ|ino <C-o>H ᴴ
ino <C-l>i ᵢ|ino <C-o>i ᶦ|ino <C-o>I ᴵ
ino <C-l>j ⱼ|ino <C-o>j ʲ|ino <C-o>J ᴶ
ino <C-l>k ₖ|ino <C-o>k ᵏ|ino <C-o>K ᴷ
ino <C-l>l ₗ|ino <C-o>l ˡ|ino <C-o>L ᴸ
ino <C-l>m ₘ|ino <C-o>m ᵐ|ino <C-o>M ᴹ
ino <C-l>n ₙ|ino <C-o>n ⁿ|ino <C-o>N ᴺ
ino <C-l>o ₒ|ino <C-o>o ᵒ|ino <C-o>O ᴼ
ino <C-l>p ₚ|ino <C-o>p ᵖ|ino <C-o>P ᴾ
ino <C-l>r ᵣ|ino <C-o>r ʳ|ino <C-o>R ᴿ
ino <C-l>s ₛ|ino <C-o>s ˢ|
ino <C-l>t ₜ|ino <C-o>t ᵗ|ino <C-o>T ᵀ
ino <C-l>u ᵤ|ino <C-o>u ᵘ|ino <C-o>U ᵁ
ino <C-l>v ᵥ|ino <C-o>v ᵛ|
ino <C-l>x ₓ|ino <C-o>x ˣ|
ino <C-l>y ᵧ|ino <C-o>y ʸ|
ino <C-l>z ₂|ino <C-o>z ᶻ|

ino <C-o>sn   ∩
ino <C-o>su   ∪
ino <C-o>s=(  ⊆
ino <C-o>s(   ⊂
ino <C-o>s!(  ⊄
ino <C-o>s=)  ⊇
ino <C-o>s)   ⊃
ino <C-o>s!)  ⊅
ino <C-o>so   ⊖
ino <C-o>s-(  ∈
ino <C-o>s-!( ∉
ino <C-o>sx   ×
ino <C-o>s0   Ø

ino <C-o>ga   α|ino <C-o>gA   Α|
ino <C-o>gb   β|ino <C-o>gB   Β|ino <C-o>g-b  ᵦ|ino <C-o>g+b   ᵝ
ino <C-o>gg   γ|ino <C-o>gG   Γ|ino <C-o>g-g  ᵧ|ino <C-o>g+g   ᵞ
ino <C-o>gd   δ|ino <C-o>gD   ∆|                ino <C-o>g+d   ᵟ
ino <C-o>ge   ε|ino <C-o>gE   Ε|
ino <C-o>gz   ζ|ino <C-o>gZ   Ζ|
ino <C-o>gh   η|ino <C-o>gH   Η|
ino <C-o>gth  θ|ino <C-o>gTH  Θ|                ino <C-o>g+th  ᶿ
ino <C-o>gi   ι|ino <C-o>gI   Ι|                ino <C-o>g+i   ᶥ
ino <C-o>gk   κ|ino <C-o>gK   Κ|
ino <C-o>gl   λ|ino <C-o>gL   Λ|
ino <C-o>gm   μ|ino <C-o>gM   Μ|
ino <C-o>gn   ν|ino <C-o>gN   Ν|
ino <C-o>gx   ξ|ino <C-o>gX   Ξ|
ino <C-o>gomi ο|ino <C-o>gOMI Ο|
ino <C-o>gpi  π|ino <C-o>gPI  Π|
ino <C-o>gr   ρ|ino <C-o>gR   Ρ|ino <C-o>g-r  ᵨ
ino <C-o>gs   σ|ino <C-o>gS   Σ|
ino <C-o>gta  τ|ino <C-o>gTA  Τ|
ino <C-o>gu   υ|ino <C-o>gU   Υ|
ino <C-o>gph  φ|ino <C-o>gPH  Φ|ino <C-o>g-ph ᵩ|ino <C-o>g+ph  ᵠ
ino <C-o>gc   χ|ino <C-o>gC   Χ|ino <C-o>g-c  ᵪ|ino <C-o>g+c   ᵡ
ino <C-o>gps  ψ|ino <C-o>gPS  Ψ|
ino <C-o>gome ω|ino <C-o>gOME Ω|

ino <C-o>mx   ⊗|
ino <C-o>mint ∫|
ino <C-o>md   ∂|
ino <C-o>mf   ∀|
ino <C-o>minf ∞|

ino <C-o><= ≤|ino <C-o>>= ≥
ino <C-o>=< ≼|ino <C-o>=> ≽
ino <C-o>>> ≻|ino <C-o><< ≺


ino <C-o>-> →
ino <C-o>. ·
ino <C-o>\|\| ∥
