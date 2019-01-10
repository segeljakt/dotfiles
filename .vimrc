"+----------------------------------------------------------------------------+
"|                  Author: Klas Segeljakt <klasseg@kth.se>                   |
"+----------------------------------------------------------------------------+
": Load plugins
set nocp                        " Always do this first
call plug#begin('~/.vim/plugged')
source ~/.vim/plugins.vim
call plug#end()
source ~/.vim/private.vim
source ~/.vim/plugin-conf.vim
": General settings
let mapleader = "§"
let g:author = "Klas Segeljakt"
let g:email = "klasseg@kth.se"
syntax enable
filetype plugin indent on       " Detect filetypes
colorscheme gruvbox
set dict+=~/.vim/dict/basic
set autoread                    " Automatically read changes
set autowriteall                " Automatically write when changing file
set background=dark
set bufhidden=hide              " Delete buffer when closing window
set cindent                     " Automatic c indentation
set cinkeys-=0#,:               " Comments don't fiddle with indenting
set cinoptions=l1,c0,C0,\0      " Do not indent switch-cases
set concealcursor=nv            " Conceal only in normal and visual mode
set conceallevel=2              " Replace concealed text with char, if any
set cpoptions-=aA               " Read and write shouldn't set #
set fileformats=unix,mac,dos    " Handle all, but prefer unix
set fileignorecase              " Always do the above
set fillchars=vert:\│           " Borders
set foldclose="all"             " Autoclose folds
set guicursor+=a:blinkon0       " Disable blinking
set guifont=Roboto\ Mono\ Nerd\ Font\ Complete:h11
set cursorline
set relativenumber
" set guifont=FuraCode\ Nerd\ Font:h11
set nomodeline                  " Do not detect modeline
set encoding=utf-8
"set directory^=$HOME/.vim/swapfiles// " Centralize swapfiles
"set updatecount=10000          " Number of chars before flush
set noswapfile                  " I've had enough of this
set hlsearch                    " Highlight matches of search
set ignorecase                  " Ignore case when searching
set incsearch                   " Highlight pattern while searching
set infercase                   " Adjust completion to match case
set laststatus=2                " Always show statusline
set lazyredraw                  " Do not redraw while executing macros
set linebreak                   " Break by word instead of char
set macthinstrokes              " Tighter font
set noshowmode                  " Do not bother showing current mode
set number                      " Row numbers
set pumheight=25                " Only show 5 completion items max
set showcmd                     " Show visual selection
set showfulltag                 " Show full tag when matching from tagfile
set showtabline=2               " Always show tabline
set spelllang=en_us             " We speak American
set splitright                  " Puts splits on right hand side
set tagcase=match               " Case-sensitive tag search
set notitle                     " Do not display title
set titleold=                   " Do not display title
set virtualedit=block           " Select whitespaces
set wildignore=*.class,*.o,*~,*.pyc,.git
set wildignorecase              " Ignore case when completing filenames
set wildmenu                    " Tabcompletion for commandline
set mps=(:),{:},[:],<:>,":"     " Separators
set shell=/usr/local/bin/zsh    " Shell program
set emoji                       " Emoji characters are full-width
set preserveindent              " Preserve indent structure
"set autochdir                   " Change directory to file in buffer ERROR: bugs other stuff
set maxmempattern=2000000       " More memory for pattern matching
set maxmem=2000000              " Max mem for buffers
set maxmemtot=2000000           " Max mem for all buffers combined
set ttyfast                     " Faster
set winminheight=0              " Squeeze win height
set winminwidth=0               " Squeeze win width
set backspace=2                 " Allow backspace over indent,eol,start
set expandtab                   " Expand tabs to spaces
set tabstop=2                   " Number of spaces per tab
set shiftwidth=2                " Number of spaces for each autoindent
set softtabstop=2               " ?
set shiftround                  " Indent to round number of spaces
set undofile                    " Use persistent undo
set undodir=~/.vimundo          " Stored here
set undolevels=2000             " Max number of changes that can be undone
set ruler                       " Show line and column number
set guioptions=
set guiheadroom=60
set foldmethod=expr             " manual,indent,expr,marker,syntax,diff
set foldexpr=MyFoldExpr()       " Custom folding expression
set updatetime=250              " Write to disk after 250 ms
set redrawtime=1000             " timeout for 'hlsearch' and :match highlighting
set terse                       " Shorten messages
"set verbose                     " Lengthen messages
set whichwrap=b,s,h,l           " Allow these to move past EOL
" TURN OFF PLUGINS
let loaded_matchparen = 1       " Avoid loading matchparen plugin
let g:loaded_matchit = 1
" let loaded_netrwPlugin = 1
" normal! :NoMatchParen<CR>
"::----------- DISABLED ------------
"set guipty                     " Pseudo-pty for shell-commands
"set macligatures               " Ligatures (Laggy)
"set makeef=""                  " Quickfix file from make
"set pdev="HP Deskjet"
"set wildmode=list:longest,full " Match
"set guifont=mplus\ Nerd\ Font:h10
"set guifont=Menlo\ Regular\ for\ Powerline\ Nerd\ Font\ Complete:h10
"set guifont=Inconsolata\ Nerd\ Font:h10
"set guifont=Knack\ Nerd\ Font:h10
"set guifont=\monofur\ for\ Powerline:h10
"set scrolloff=2                " Show at least 2 lines above cursor
"set scrolljump=5               " Number of lines to scroll when off-screen
"set showmatch                  " Jump to [{( after entering ]})
"set clipboard=unnamed          " Yank and paste without prefix
"set langmap=li,ko,hn,je,nh,ej,ik,ol,LI,KO,JE,EJ,IK,OL
"set macmeta                     " <Alt> => <M> (BUGGY)
" o: Comment on o
" w: Trailing whitespace = Same
" n: Recognize numbered lists
" l: Do not break long lines
" j: Remove comment when joining lines
": Commands
com! Ix :w ![ -z "$1" ] && curl -F 'f:1=<-' ix.io || ix < "$1"; " Pastebin
": Keybindings
" Rust
nno          <          i<><C-c>i| " Generics
" Plugins
xmap         s          <Plug>VSurround
nno          q          :TComment<CR>
vno <expr>   q          mode()==#'V' ? ':TComment<CR>' : ':TCommentInline<CR>' | " Comment
nno <silent> +          :Neoformat<CR>
nno <silent> gb         :Gbrowse<CR>
nno <silent> <C-w>d     :WindowSwap#EasyWindowSwap<CR>
nno          M          <Plug>ToggleMarkbar
nno          <C-p>      :Rg<CR>
nno          <C-u>      :MRU<CR>
nno          :          :Buffers<CR>
nno          <C-x>      :Stealth<CR>
nno          Ö          :ArgWrap<CR>
nno          ç          :Calendar<CR>|                    " <M-c>
nno          Å          :Bdelete!<CR>
nno          gh         :GHActivity<CR>
nno          ü          :PlugUpdate<CR>|                  " <M-u>
nno          ı          :PlugInstall<CR>|                 " <M-i>
nno          <C-H>      :SidewaysLeft<CR>
nno          <C-L>      :SidewaysRight<CR>
nno          <D-u>      :UndotreeToggle<CR>
nno          ﬁ          :NextColorScheme<CR>|             " <M-l>
nno          ˛          :PrevColorScheme<CR>|             " <M-h>
nno          •          :TableModeToggle<CR>|             " <M-q>
nno          t          :ALEGoToDefinition<CR>zz
nno          ö          :call ToggleDrawIt()<CR>
nno          Ω          :call ToggleWordMode()<CR>        " <M-w>
nno          d<Tab>     :ThesaurusQueryReplaceCurrentWord<CR>
nno          <C-a>      :call ZoomNERDTreeFromOtherWindow()<CR>
nno          g.         :SortScalaImports<CR>
vm           i          <Plug>SchleppToggleReindent
vm           H          <Plug>SchleppLeft
vm           J          <Plug>SchleppDown
vm           K          <Plug>SchleppUp
vm           L          <Plug>SchleppRight
vm           D          <Plug>SchleppDup
"map <silent>  <C-q>     <Plug>NERDCommenterAppend
"map <silent>  q         <Plug>NERDCommenterToggle
nm <silent>  <C-k>      <Plug>(ale_previous_wrap)zz
nm <silent>  <C-j>      <Plug>(ale_next_wrap)zz
nm           K          <Plug>ManPreGetPage<CR>
no           <C-w>m     :WinResizerStartMove<CR>
" no           <C-w>,     :WinResizerStartResize<CR>
" imap         <C-l>      <Plug>(coc-snippets-expand)
map          K          <Plug>(expand_region_expand)
map          L          <Plug>(expand_region_shrink)
" Fixes
nno          n          nzz
nno          N          Nzz
ino          <C-c>      <Esc>|                            " Fix <C-c>
" ino          <C-c>      <Esc>:w<CR>|                      " Fix <C-c>
no           #          gd|                               " Swap # with *
no           *          #N
nno          R          gR|                               " Fix <Tab>
nno          <Tab>      >>
nno          <S-Tab>    <<
vno          <Tab>      >gv
vno          <S-Tab>    <gv
vno <expr>   A          mode()=~'v' ? '$h' : 'A'|         " Fix A
vno          P          "_dp|                             " No yank on paste
vno          p          "_dP
vno          <BS>       <BS>|                             " Fix defaults
" Overrides
" nno          <BS>       <C-^>|                            " Change buffer
nno          B          ^|                                " Go to start of line
nno          E          <C-y>|                            " Scroll up
no           <S-Space>  /|                                " Spacebar
no           <Space>    :
nno          y          vy|                               " Yank char
ino          <C-h>      <Left>|                           " Move in insert mode
ino          <C-j>      <Down>
ino          <C-k>      <Up>
ino          <C-l>      <Right>
no           !          :!
no           <C-d>      <C-w>w|                           " Cycle windows
nno          <Right>    <C-w>l|                           " Navigate splits
nno          <Left>     <C-w>h
nno          <Up>       <C-w>k
nno          <Down>     <C-w>j
nno          S          :%s//g<Left><Left>
xno          S          :s//g<Left><Left>
nno <expr>   C          ':%s/' . @/ . '//g<Left><Left>'
xno <expr>   C          ':s/' . @/ . '//g<Left><Left>'
nno          <C-n>      gt<CR>|                           " Tab page management
nno          <C-b>      gT<CR>|
nno          gt         :tabnew<CR>
nno          <C-CR>     kk<CR>|                           " Reverse <CR>
nno          k          gk
nno          j          gj
" Command line
cno          <C-h>      <Left>|                           " Movement in i-mode
cno          <C-l>      <Right>
cno          <C-k>      <Up>
cno          <C-j>      <Down>
cno          <Up>       <Nop>|                            " Disable arrow keys
cno          <Down>     <Nop>
cno          <Left>     <Nop>
cno          <Right>    <Nop>
" Toggles / Sliders
nno          <Leader>b  :set ri!<CR>|                     " Write backwards
nno          <Leader>fu :set fu!<CR>|                     " Fullscreen toggle
nno          <Leader>dd :set diff!<CR>|                   " Diff mode
nno          <Leader>g  :set crb! scb!<CR>                " Bind cursor/scroll
nno          ≤          :vertical resize -1<CR>|          " <M-<> - Resize
nno          ≥          :vertical resize +1<CR>|          " <M->>
" nno          ¿          :resize -1<CR>|                   " <M-?>
" nno          ±          :resize +1<CR>|                   " <M-+>
nno          Œ          :set wrap!<CR>|                   " <M-O>
" Shortcuts
" nno          <C-s>      :w<CR>
nno          <D-j>      j<C-e>|                           " Move without scroll
nno          <D-k>      k<C-y>
vno          <C-y>      ygvr<Space>|                      " Yank & clear
nno          cu         gg=G``|                           " Format file
nno          gl         <C-w>TgT|                         " Move to new tab
" Commands
nno          <Leader>e  :Ix<CR>                           " Upload to pastebin
no           å          :x<CR>
nno          ä          :%s/\s\+$//e<CR>|                 " Remove whitespaces
nno          cd         :cd %:p:h<CR>:NERDTreeCWD<CR>|    " Change directory
"nno          <C-o>      :reg<CR>|                         " View yanks
nno          <C-o>      :ALEDetail<CR><C-w>j              " Ale Detail"
nno          ˆ          :%s///g<Left><Left>|              " Replace <M-S-i>
nno          ∆          :put =strftime('[%d-%m-%Y]')<CR>| " Insert date <M-S-d>
" nno          <C-f>      :let @/ = ""<CR>|                 " Clear matches
" xno          <C-f>      :<BS><BS><BS><BS><BS>let @/ = ""<CR>| " Clear matches
nno          <D-i>      :terminal ++close<CR>|            " Terminal
nno          <D-b>      :!cargo build<CR>                 " Cargo
nno          <D-r>      :!cargo run<CR>
nno          <D-c>      :!cargo clean<CR>
nno          <D-d>      :!cargo doc --open<CR>
nno          <D-f>      :!cargo test<CR>
nno          <D-e>      :!cargo search 
nno          <D-x>      :!cargo check<CR>
nno          <D-z>      :!cargo bench<CR>
" File shortcuts
nno          π          :tab drop ~/.vim/plugins.vim<CR>|              " <M-p>
nno          æ          :tab drop ~/.vimrc<CR>|                        " <M-ä>
nno          Æ          :tab drop ~/.gvimrc<CR>|                       " <M-Ä>
nno          œ          :tab drop ~/.vim/plugin-conf.vim<CR>|          " <M-o>
nno          ø          :tab drop ~/.vim/bibtex/library.bib<CR>|       " <M-ö>
nno          ›          :AsyncRun open https://www.kth.se/en/kthb<CR>| " <M-v>
nno          ‹          :AsyncRun open https://scholar.google.se<CR>|  " <M-b>
": Syntax
":: C
let c_gnu = 1              " GNU gcc specific items
let c_space_errors = 1     " trailing white space and spaces before a <Tab>
let c_curly_error = 1      " highlight a missing }; this forces syncing from the
let c_syntax_for_h = 1     " for *.h files use C syntax instead of C++ and use objc
let c_comment_strings = 1  " strings and numbers inside a comment
let c_no_bracket_error = 1 " don't highlight {}; inside [] as errors
let c_no_curly_error = 1   " don't highlight {}; inside [] and () as errors;
let c_minlines = 200
"fun! HighlightKeywords_gcc()
  "hi _PRE_PROCESSOR guifg=#f1d200
  "hi _CCOMMENT guifg=#928374 gui=NONE
  "syn match _CCOMMENT /[\*:]/     containedin=.*cComment.*
  "syn match _PRE_PROCESSOR /[A-Z_][A-Z0-9_]\+/ containedin=.*PreCondit.*
  "syn match _PRE_PROCESSOR /[A-Z_][A-Z0-9_]\+/ containedin=.*Macro.*
  "syn match _PRE_PROCESSOR /[A-Z_][A-Z0-9_]\+/ containedin=.*cComment.*
"endfun
":: HTML
let g:html_whole_filler = 1
let g:html_prevent_copy = "fn"
let g:html_pre_wrap = 0
"let g:html_dynamic_folds = 1
"let g:html_no_foldcolumn = 1
"let g:html_hover_unfold = 1
":: Keywords
" TODO DANGER ERROR WARNING Klas Segeljakt <klasseg@kth.se> [2017-10-21 01:26]
fun HighlightKeywords()
  hi _TODO    guibg=#95bc0a guifg=black
  hi _DANGER  guibg=#dd8225 guifg=black
  hi _ERR     guibg=#ea1822 guifg=black
  hi _WARNING guibg=#f1d200 guifg=black gui=underline,italic
  hi _AUTHOR  guifg=#95bc0a gui=italic
  hi _EMAIL   guifg=#95bc0a gui=underline,italic
  hi _DATE    guifg=#1d829e
  hi _COMMENT guifg=#928374 gui=NONE
  syn keyword _TODO    TODO NOTE containedin=.*Comment.*
  syn keyword _DANGER  DANGER    containedin=.*Comment.*
  syn keyword _WARNING WARNING   containedin=.*Comment.*
  syn keyword _ERR     ERROR     containedin=.*Comment.*
  exe "syn keyword _AUTHOR ".g:author." containedin=.*Comment.*"
  syn match _EMAIL /<*[a-zA-Z]\+@[a-zA-Z]\+\.[a-zA-Z]\+>*/ containedin=.*Comment.*
  syn match _DATE /\[[0-9?]\+-[0-9?]\+-[0-9?]\+ [0-9?]\+:[0-9?]\+\]/ containedin=.*Comment.*
  hi _ColorColumn guibg=darkred
endfun
": Templates
":: C
fun! NewTemplate_c(...) " C template
  exe "0read ~/.vim/templates/template_c"
  let l:filename = expand('%:t')
  let l:extension = expand('%:e')
  let l:author_email = g:author." <".g:email.">"
  let l:date=strftime("[%Y-%m-%d %H:%M]")
  " Filename+Author+Date
  undojoin | exe "2s/_".repeat(" ", strlen(l:filename)-1)."/".l:filename."/"
  undojoin | exe "3s/_".repeat(" ", strlen(l:author_email)-1)."/".l:author_email."/"
  undojoin | exe "4s/\\[.*\\]/".l:date."/"
  " File specifics
  if a:0 != 1
    if l:extension == "h" " Header
      let l:FILENAME=substitute(toupper(l:filename), '\.', '_', 0)
      undojoin | call append(7,  "#ifndef ".l:FILENAME)
      undojoin | call append(8,  "#define ".l:FILENAME)
      undojoin | call append(9,  '/'.repeat('*', 77).'/')
      undojoin | call append(10,  '')
      undojoin | call append(11, '/'.repeat('*', 77).'/')
      undojoin | call append(12, "#endif /* ".l:FILENAME." */")
      normal Gddgg10j
    endif
  endif
endfun
fun! UpdateTemplate_gcc() " C template
  undojoin | exe "5s/\\[.*\\]/".strftime("[%Y-%m-%d %H:%M]")."/"
endfun
fun! HasTemplate_gcc() " C template
  return !(line('$') == 1 && getline(1) == '')
endfun
":: Vim
fun! NewTemplate_vim(...) " Vim template
  exe "0read ~/.vim/templates/template_vim"
  let l:filename = expand('%:t')
  let l:author_email = g:author." <".g:email.">"
  let l:date=strftime("[%Y-%m-%d %H:%M]")
  undojoin | exe "2s/-".repeat(" ", strlen(l:filename)-1)."/".l:filename."/"
  undojoin | exe "3s/-".repeat(" ", strlen(l:author_email)-1)."/".l:author_email."/"
  undojoin | exe "4s/\\[.*\\]/".date."/"
endfun
fun! UpdateTemplate_vim() " Vim template
  undojoin | exe "5s/\\[.*\\]/".strftime("[%Y-%m-%d %H:%M]")."/"
endfun
":: Pandoc
fun! NewTemplate_pandoc(...) " Pandoc template
  exe "0read ~/.vim/templates/template_pandoc"
  let l:date=strftime("[%Y-%m-%d %H:%M]")
  undojoin | exe "%s/<author>/".g:author."/"
  undojoin | exe "%s/<email>/<".g:email.">/"
  undojoin | exe '%s/<created>/"'.l:date.'"/'
endfun
": Folding
" Fold Expression
fun! MyFoldExpr()
  let thisline = getline(v:lnum)
  if     match(thisline, '^.:::') >= 0 | return ">3"
  elseif match(thisline, '^.::')  >= 0 | return ">2"
  elseif match(thisline, '^.:')   >= 0 | return ">1"
  else                                 | return "="
  endif
endfun
": Autocmd
aug Autocommands | au!
  "au BufReadPost * if &modifiable | retab | endif
"   au WinEnter * if &previewwindow | set ft=markdown | endif
  au BufReadPost .vimrc set nowrap
  au FocusLost * if &modifiable | wall | endif
"   au CursorHold *.* nested silent! update
  au GUIEnter * set vb t_vb= " Disable bell
  au Syntax * call HighlightKeywords()
  au Syntax * match none
  au Syntax c,cpp,rust match _ColorColumn /\%101v.*/
  "au FileType java setlocal omnifunc=javacomplete#Complete
  " Templates
"   au BufNewFile *.c,*.h,*.rs silent! call NewTemplate_c()
"   au BufNewFile *.vim        silent! call NewTemplate_vim()
"   au BufNewFile *.md         silent! call NewTemplate_pandoc()
"   au QuitPre *.c,*.h,*.rs    silent! call UpdateTemplate_gcc()
  " NERDTree
  au VimEnter * cd %:p:h | NERDTree | 2 wincmd w
  au StdinReadPre * silent let s:std_in=1
  au TabNew * let t:NERDTreeZoomCurrentWindow = winnr()
  au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " Formatoptions
  au BufEnter * setlocal formatoptions=rownlj
aug END
": Spell correction / Abbreviations
iab    retrun  return
iab     pritn  print
iab       teh  the
iab      liek  like
iab  liekwise  likewise
iab      moer  more
iab  previosu  previous
iab      pset  pest
