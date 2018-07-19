"+----------------------------------------------------------------------------+
"|                  Author: Klas Segeljakt <klasseg@kth.se>                   |
"+----------------------------------------------------------------------------+
set nocp                        " Always do this first
call plug#begin('~/.local/share/nvim/plugged')
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim'
call plug#end()
colorscheme gruvbox
nnoremap <silent> <C-w>h :TmuxNavigateLeft<CR>
nnoremap <silent> <C-w>j :TmuxNavigateDown<CR>
nnoremap <silent> <C-w>k :TmuxNavigateUp<CR>
nnoremap <silent> <C-w>l :TmuxNavigateRight<CR>
nnoremap <silent> <C-w>p :TmuxNavigatePrevious<CR>
"": General settings
let mapleader = "§"             " Leader key
"let g:gruvbox_contrast_dark="hard" " Needs to be put before loading
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
" o: Comment on o
" w: Trailing whitespace = Same
" n: Recognize numbered lists
" l: Do not break long lines
" j: Remove comment when joining lines
" Get character at offset relative to cursor
fun! PeekChar(offset)
    return getline(".")[col(".") - 1 + a:offset]
endfun

" Conditionally remap Enter in insert mode
inoremap <expr> <CR> PeekChar(0) == ')' && PeekChar(-1) != ',' ? "\<Right>" : "\<Enter>"
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
" Tabs work as expected in replace mode
nnoremap R gR
" Go to start of line
nnoremap B ^
" Scroll up
nnoremap E <C-y>
" Swap # with *
nnoremap # *N
nnoremap * #N
vnoremap # *N
vnoremap * *N
" Quick command
nnoremap <Space> :
vnoremap <Space> :
" Highlight last inserted text
nnoremap gV `[v`]<Space>
" Clear matches and errors/warnings
"noremap <silent> <C-f> :let @/ = ""<CR>:SyntasticReset<CR>
noremap <silent> <C-f> :let @/ = ""<CR>
" Toggle case with <Alt-y>
"noremap µ ~
" Yank char
nnoremap y vy
" Write multiple lines with <C-v>I or <C-v>A
inoremap <C-c> <Esc>
" Move to start of line above
nnoremap ¨ k^
" Move in insert mode
inoremap ˛ <Left>
inoremap √ <Down>
inoremap ª <Up>
inoremap ﬁ <Right>
" <Alt+Space> key should be treated as <Space>
inoremap   <Space>
" View yanks with <C-o>
nnoremap <C-o> :reg<CR>
" Exit window
nnoremap <C-d> :x<CR>
" Save
nnoremap <C-s> :w<CR>
": Whitespace/Tabs
set expandtab                   " Expand tabs to spaces
set tabstop=2                   " Number of spaces per tab
set shiftwidth=2                " Number of spaces for each autoindent
set softtabstop=2               " ?
set shiftround                  " Indent to round number of spaces
inoremap <Tab> <Tab>
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
