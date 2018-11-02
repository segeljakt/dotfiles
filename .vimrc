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
set title                       " Show filename in titlebar
set virtualedit=block           " Select whitespaces
set wildignore=*.class,*.o,*~,*.pyc,.git
set wildignorecase              " Ignore case when completing filenames
set wildmenu                    " Tabcompletion for commandline
set formatoptions=rownlj        " r: Comment on Enter
set mps=(:),{:},[:],<:>,":"     " Separators
set shell=/usr/local/bin/zsh    " Shell program
set emoji                       " Emoji characters are full-width
"set autochdir                   " Change directory to file in buffer ERROR: bugs other stuff
set maxmempattern=2000000       " More memory for pattern matching
set maxmem=2000000              " Max mem for buffers
set maxmemtot=2000000           " Max mem for all buffers combined
set winminheight=0              " Squeeze win height
set winminwidth=0               " Squeeze win width
set backspace=1                 " Allow backspace over indent,eol,start
set expandtab                   " Expand tabs to spaces
set tabstop=2                   " Number of spaces per tab
set shiftwidth=2                " Number of spaces for each autoindent
set softtabstop=2               " ?
set shiftround                  " Indent to round number of spaces
set undofile                    " Use persistent undo
set undodir=~/.vimundo          " Stored here
set undolevels=2000             " Max number of changes that can be undone
"set langmap=li,ko,hn,je,nh,ej,ik,ol,LI,KO,JE,EJ,IK,OL
"set macmeta                     " <Alt> => <M> (BUGGY)
" o: Comment on o
" w: Trailing whitespace = Same
" n: Recognize numbered lists
" l: Do not break long lines
" j: Remove comment when joining lines
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
": Keybindings
" Plugins
nno <silent> <C-p>      :Rg<CR>
nno <silent> <C-u>      :MRU<CR>
nno <silent> :          :Buffers<CR>
nno <silent> <C-x>      :Stealth<CR>
nno <silent> Ö          :ArgWrap<CR>
nno <silent> ç          :Calendar<CR>|                    " <M-c>
nno <silent> Å          :Bdelete!<CR>
nno <silent> gh         :GHActivity<CR>
nno <silent> ü          :PlugUpdate<CR>|                  " <M-u>
nno <silent> ı          :PlugInstall<CR>|                 " <M-i>
nno <silent> <C-H>      :SidewaysLeft<CR>
nno <silent> <C-L>      :SidewaysRight<CR>
nno <silent> <D-u>      :UndotreeToggle<CR>
nno <silent> ﬁ          :NextColorScheme<CR>|             " <M-l>
nno <silent> ˛          :PrevColorScheme<CR>|             " <M-h>
nno <silent> •          :TableModeToggle<CR>|             " <M-q>
nno <silent> t          :ALEGoToDefinition<CR>
nno <silent> ö          :call ToggleDrawIt()<CR>
nno <silent> Ω          :call ToggleWordMode()<CR>        " <M-w>
nno <silent> d<Tab>     :ThesaurusQueryReplaceCurrentWord<CR>
nno <silent> <C-a>      :call ZoomNERDTreeFromOtherWindow()<CR>
" Fixes
ino          <C-c>      <Esc>|                            " Fix <C-c>
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
vunmap       <BS>|                                        " Fix defaults
" Overrides
"nno          t          <c-]>|                            " Tags
nno          <BS>       <C-^>|                            " Change buffer
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
nno <silent> <Leader>b  :set ri!<CR>|                     " Write backwards
nno <silent> <Leader>fu :set fu!<CR>|                     " Fullscreen toggle
nno <silent> <Leader>dd :set diff!<CR>|                   " Diff mode
nno <silent> <Leader>g  :set crb! scb!<CR>                " bind cursor/scroll
nno <silent> ≤          :vertical resize -1<CR>|          " <M-<> - Resize
nno <silent> ≥          :vertical resize +1<CR>|          " <M->>
nno <silent> ¿          :resize -1<CR>|                   " <M-?>
nno <silent> ±          :resize +1<CR>|                   " <M-+>
" Shortcuts
nno          <D-j>      j<C-e>|                           " Move without scroll
nno          <D-k>      k<C-y>
vno          <C-y>      ygvr<Space>|                      " Yank & clear
nno          cu         gg=G``|                           " Format file
nno          gl         <C-w>TgT|                         " Move to new tab
" Commands
nno <silent> <C-s>      :w<CR>
no  <silent> å          :x<CR>
nno <silent> ä          :%s/\s\+$//e<CR>|                 " Remove whitespaces
nno <silent> cd         :cd %:p:h<CR>:NERDTreeCWD<CR>|    " Change directory
nno <silent> <C-o>      :reg<CR>|                         " View yanks
nno          ˆ          :%s///g<Left><Left>|              " Replace <M-S-i>
nno <silent> ∆          :put =strftime('[%d-%m-%Y]')<CR>| " Insert date <M-S-d>
no  <silent> <C-f>      :let @/ = ""<CR>|                 " Clear matches
nno <silent> <D-i>      :terminal ++close<CR>|            " Terminal
nno <silent> <D-b>      :!cargo build<CR>                 " Cargo
nno <silent> <D-r>      :!cargo run<CR>
nno <silent> <D-c>      :!cargo clean<CR>
nno <silent> <D-d>      :!cargo doc --open<CR>
nno <silent> <D-f>      :!cargo test<CR>
nno <silent> <D-e>      :!cargo search 
nno <silent> <D-x>      :!cargo check<CR>
nno <silent> <D-z>      :!cargo bench<CR>
" File shortcuts
nno <silent> π          :tabe ~/.vim/plugins.vim<CR>|                  " <M-p>
nno <silent> æ          :tabe ~/.vimrc<CR>|                            " <M-ä>
nno <silent> œ          :tabe ~/.vim/plugin-conf.vim<CR>|              " <M-o>
nno <silent> ø          :tabe ~/.vim/bibtex/library.bib<CR>|           " <M-ö>
nno <silent> ›          :AsyncRun open https://www.kth.se/en/kthb<CR>| " <M-v>
nno <silent> ‹          :AsyncRun open https://scholar.google.se<CR>|  " <M-b>
":: Reference
" §:¶• 1:©¡ 2:@” 3:£¥ 4:$¢ 5:∞‰ 6:§¶ 7:|\ 8:[{ 9:]} 0:≈≠ +:±¿ /:$`
" q:•° w:Ω˝ e:éÉ r:®√ t:†‡ y:µ˜ u:üÜ i:ıˆ o:œŒ p:π∏ å:˙˚ ~:~^
" a:◊ s:ß∑ d:∂∆ f:ƒ∫ g:¸¯ h:˛˘ j:√¬ k:ªº l:ﬁﬂ ö:øØ ä:æÆ ':™’
" <:≤≥ z:÷⁄ x:≈ˇ c:çÇ v:‹« b:›» n:‘“ m:’” ,:‚„ .:…· -:–—
":: Disabled
"imap  <M-2>    @|                                          " Fix :set macmeta
"imap  <M-4>    $
"imap  <M-7>    \|
"imap  <M-8>    [
"imap  <M-9>    ]
"imap  <M-!>    \\
"imap  <M-(>    {
"imap  <M-)>    }
": Export
" format.vim Setup
"let g:format_HTMLAdditionalCSS = '@import url(http://fonts.googleapis.com/css?family=Droid+Sans+Mono);' .
"\' body { font-family: "Droid Sans Mono"; font-size:11pt; line-height: 120%; -webkit-font-smoothing: antialiased }'
" Gist it to bl.ocks.org
command! -range=% Blocks
      \ <line1>,<line2>Format format | f index.html | exe 'Gist -a' | bd!                                       |
      \ let @+ = 'http://bl.ocks.org/anonymous/raw/' . matchstr(@+, 'https://gist.github.com/\zs\w\+\ze') . '/' |
      \ redraw | echomsg 'Done: ' . @+ | setlocal nomodified
": Syntax
let c_gnu = 1              " GNU gcc specific items
"let c_comment_strings = 1  " strings and numbers inside a comment
let c_space_errors = 1     " trailing white space and spaces before a <Tab>
"let c_no_trail_space_error " but no trailing spaces
"let c_no_tab_space_error   " but no spaces before a <Tab>
"let c_no_bracket_error     " don't highlight {}; inside [] as errors
"let c_no_curly_error       " don't highlight {}; inside [] and () as errors;
" except { and } in first column
" Default is to highlight them, otherwise you
" can't spot a missing ")".
let c_curly_error = 1      " highlight a missing }; this forces syncing from the
" start of the file, can be slow
"let c_no_ansi              " don't do standard ANSI types and constants
"let c_ansi_typedefs        " but do standard ANSI types
"let c_ansi_constants       " but do standard ANSI constants
"let c_no_utf               " don't highlight \u and \U in strings
let c_syntax_for_h = 1     "for *.h files use C syntax instead of C++ and use objc
": Keywords
fun! HighlightKeywords()
  " TODO DANGER ERROR WARNING Klas Segeljakt <klasseg@kth.se> [2017-10-21 01:26]
  hi _TODO    guibg=#95bc0a guifg=black
  hi _DANGER  guibg=#dd8225 guifg=black
  hi _ERR     guibg=#ea1822 guifg=black
  hi _WARNING guibg=#f1d200 guifg=black
  hi _AUTHOR  guifg=#95bc0a gui=italic
  hi _EMAIL   guifg=#95bc0a gui=underline,italic
  hi _DATE    guifg=#1d829e
  hi _COMMENT guifg=#928374 gui=NONE
  syn keyword _TODO    TODO NOTE containedin=.*Comment.*
  syn keyword _DANGER  DANGER    containedin=.*Comment.*
  syn keyword _WARNING WARNING   containedin=.*Comment.*
  syn keyword _ERR     ERROR     containedin=.*Comment.*
  exe "syntax keyword _AUTHOR ".g:author." containedin=.*Comment.*"
  syn match _EMAIL /<*[a-zA-Z]\+@[a-zA-Z]\+\.[a-zA-Z]\+>*/ containedin=.*Comment.*
  syn match _DATE /\[[0-9?]\+-[0-9?]\+-[0-9?]\+ [0-9?]\+:[0-9?]\+\]/ containedin=.*Comment.*
  "syntax match _COMMENT /\-\-\-/    containedin=.*Comment.*
  "syntax match _COMMENT /[\|+:]/    containedin=.*Comment.*
endfun
fun! HighlightKeywords_gcc()
  "hi _PRE_PROCESSOR guifg=#f1d200
  "hi _CCOMMENT guifg=#928374 gui=NONE
  "syn match _CCOMMENT /[\*:]/     containedin=.*cComment.*
  "syn match _PRE_PROCESSOR /[A-Z_][A-Z0-9_]\+/ containedin=.*PreCondit.*
  "syn match _PRE_PROCESSOR /[A-Z_][A-Z0-9_]\+/ containedin=.*Macro.*
  "syn match _PRE_PROCESSOR /[A-Z_][A-Z0-9_]\+/ containedin=.*cComment.*
endfun
": Templates
":: C
fun! NewTemplate_c(...) " C template
  exe "0read ~/.vim/templates/template_c"
  " Filename/Extension/Author/Date
  let l:filename = expand('%:t')
  let l:extension = expand('%:e')
  let l:author_email = g:author." <".g:email.">"
  let l:date=strftime("[%Y-%m-%d %H:%M]")
  undojoin | exe "2s/_".repeat(" ", strlen(l:filename)-1)."/".l:filename."/"
  undojoin | exe "3s/_".repeat(" ", strlen(l:author_email)-1)."/".l:author_email."/"
  undojoin | exe "4s/\\[.*\\]/".l:date."/"
  " File specifics
  if a:0 != 1
    if l:extension == "c" " Source
      undojoin | call append(7, "#include \"./".split(l:filename, '\.')[0].".h\"")
      normal G
    elseif l:extension == "h" " Header
      let l:filename=substitute(toupper(l:filename), '\.', '_', 0)
      undojoin | call append(7,  "#ifndef ".l:filename)
      undojoin | call append(8,  "#define ".l:filename)
      undojoin | call append(9,  '/'.repeat('*', 77).'/')
      undojoin | call append(10,  '')
      undojoin | call append(11, '/'.repeat('*', 77).'/')
      undojoin | call append(12, "#endif /* ".l:filename." */")
      normal Gddgg10j
    endif
  endif
endfun
fun! UpdateTemplate_gcc() " C template
  undojoin | exe "5s/\\[.*\\]/".strftime("[%Y-%m-%d %H:%M]")."/"
endfun
fun! HasTemplate_gcc() " C template
  return !(line('$') == 1 && getline(1) == '')
  "return getline(1) == "/".repeat('*', 78)
endfun

":: Vim
fun! NewTemplate_vim(...) " Vim template
  exe "0read ~/.vim/templates/template_vim"
  " File name
  let l:filename = expand('%:t')
  undojoin | exe "2s/-".repeat(" ", strlen(l:filename)-1)."/".l:filename."/"
  " Author
  let l:author_email = g:author." <".g:email.">"
  undojoin | exe "3s/-".repeat(" ", strlen(l:author_email)-1)."/".l:author_email."/"
  " Date
  undojoin | exe "4s/\\[.*\\]/".strftime("[%Y-%m-%d %H:%M]")."/"
endfun
fun! UpdateTemplate_vim() " Vim template
  undojoin | exe "5s/\\[.*\\]/".strftime("[%Y-%m-%d %H:%M]")."/"
endfun
":: Pandoc
fun! NewTemplate_pandoc(...) " Pandoc template
  exe "0read ~/.vim/templates/template_pandoc"
  " Author
  undojoin | exe "%s/<author>/".g:author."/"
  " Email
  undojoin | exe "%s/<email>/<".g:email.">/"
  " Date
  undojoin | exe '%s/<created>/"'.strftime("[%Y-%m-%d %H:%M]").'"/'
endfun
": Website
" Upload current buffer to website
no <M-'> :TOhtml<CR>
  \:x! ~/.vim/index.html<CR>
  \:AsyncRun dropbox_uploader.sh upload ~/.vim/index.html Apps/Pancake.io/index.html<CR>
  \:let @* = 'klasseg.pancakeapps.com'<CR>
let g:html_whole_filler = 1
let g:html_prevent_copy = "fn"
let g:html_pre_wrap = 0
"let g:html_dynamic_folds = 1
"let g:html_no_foldcolumn = 1
"let g:html_hover_unfold = 1
": GUI settings
if has("gui_running")
  set guioptions=
  set ghr=60
  colorscheme gruvbox
endif
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
": AutoCmd
aug VimEnterGroup | au!
  au VimEnter * cd %:p:h
  au VimEnter * NERDTree " NERDTree
  au VimEnter * 2 wincmd w " NERDTree
aug END
aug BufEnterGroup | au!
  " Color Column
  au BufEnter *.c,*.h,*.cpp highlight OverLength ctermbg=red guibg=#592929
  au BufEnter *.c,*.h,*.cpp match OverLength /\%81v.*/
  " Close NERDTree if it is the last window
  au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  au BufEnter * set formatoptions=rownlj " Fix shit
  "au BufEnter * if &ft !~ '^nerdtree$' | silent! lcd %:p:h | endif " autochdir
aug END
aug BufReadPostGroup | au!
  " Reformat
  au BufReadPost * if &modifiable | retab | endif
  au BufReadPost *.c,*.h,*.rs if HasTemplate_gcc() == 0 | call NewTemplate_c() | endif
  " Filter (Fix indentation on lines except comments and dots (struct assignment))
  "au BufReadPost *.c,*.h,*.cpp exe 'normal mz' | exe 'g!/^\(\*\|\/\| *\.\| *&\| *\/\\| *{\| *\"\| *\/\)/normal ==' | exe 'normal `z'
  au BufReadPost .vimrc exe 'set nowrap'
  " Find important files
  au BufReadPost * let b:makefile_path = findfile('makefile'  , ';')
  "au BufReadPost * let &tags           = fnamemodify(findfile('tags'       , ';'), ':p') 
  au BufReadPost * let b:readme_path   = findfile('README.md' , ';')
  au BufReadPost * let b:exe_path      = findfile('bin/exe'   , ';')
aug END
aug StdinReadPreGroup | au!
  au StdinReadPre * silent let s:std_in=1 " NERDTree
aug END
aug TabNewCmd | au!
  au TabNew * let t:NERDTreeZoomCurrentWindow = winnr() " NERDTree
aug END
aug BufNewFileGroup | au!
  au BufNewFile *             call HighlightKeywords()
  au BufNewFile *.c,*.h,*.cpp call HighlightKeywords_gcc()
  au BufNewFile *.c,*.h,*.rs  call NewTemplate_c() " Template
  au BufNewFile *.vim         call NewTemplate_vim() " Template
  au BufNewFile *.md          call NewTemplate_pandoc() " Template
aug END
aug QuitPreGroup | au!
  au QuitPre *.c,*.h,*.rs silent! call UpdateTemplate_gcc()
aug END
aug BufReadGroup | au!
  au BufRead *             call HighlightKeywords()
  au BufRead *.c,*.h,*.cpp call HighlightKeywords_gcc()
  "au BufRead *.c,*.h,*.cpp execute "normal \<Plug>NERDCommenterAltDelims"
aug END
aug GUIEnterGroup | au!
  au GUIEnter * set visualbell t_vb=
aug END
"aug SwapExistsGroup | au!
  "au SwapExists * let v:swapchoice = "o" " Open swap-files as read-only
"aug END
