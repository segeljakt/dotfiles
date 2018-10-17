"+----------------------------------------------------------------------------+
"|                  Author: Klas Segeljakt <klasseg@kth.se>                   |
"+----------------------------------------------------------------------------+
": Load plugins
set nocp                        " Always do this first
call plug#begin('~/.vim/plugged')
source ~/.vim/plugins.vim
call plug#end()
source ~/.vim/private.vim
source ~/.vim/plugin-settings.vim
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
set cindent                     " Autmatic c indentation
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
"set guifont=Menlo\ for\ Powerline:h11
"set guifont=Menlo\ Regular\ Nerd\ Font\ Complete:h11
set guifont=Roboto\ Mono\ Nerd\ Font\ Complete:h11
"set directory^=$HOME/.vim/swapfiles// " Centralize swapfiles
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
" o: Comment on o
" w: Trailing whitespace = Same
" n: Recognize numbered lists
" l: Do not break long lines
" j: Remove comment when joining lines
"::----------- DISABLED ------------
"set guipty                     " Pseudo-pty for shell-commands
"set macligatures               " Ligatures (Laggy)
"set macmeta                    " <Alt> => <M>
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
": Remaps
" Date
nnoremap ∆ :put =strftime('[%d-%m-%Y]')<CR>j
" Tags
nnoremap t <c-]>
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
nnoremap # gd
nnoremap * #N
vnoremap # *N
vnoremap * *N
" Spacebar
nnoremap <S-Space> /
vnoremap <S-Space> /
nnoremap <Space> :
vnoremap <Space> :
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
inoremap ¨ ~
" Move in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
" <Alt+Space> key should be treated as <Space>
inoremap   <Space>
" View yanks with <C-o>
nnoremap <C-o> :reg<CR>
" Vim file shortcut
nnoremap † :tabedit ~/.vim/trash.vim<CR>
nnoremap π :tabedit ~/.vim/plugins.vim<CR>
nnoremap æ :tabedit ~/.vimrc<CR>
nnoremap œ :tabedit ~/.vim/plugin-settings.vim<CR>
" Update vimrc
nnoremap rv :source ~/.vimrc<CR>:source ~/.gvimrc<CR>
"::----------- DISABLED ------------
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
": Conceal
"fun! ForwardSkipConceal(count)
""let cnt=a:count
"let cnt=1
"let mvcnt=0
"let c=col('.')
"let l=line('.')
"let lc=col('$')
"let line=getline('.')
"while cnt
"if c>=lc
"let mvcnt+=cnt
"break
"endif
"if stridx(&concealcursor, 'n')==-1
"let isconcealed=0
"else
"let [isconcealed, cchar, group]=synconcealed(l, c)
"endif
"if isconcealed
"let cnt-=strchars(cchar) " Unicode???
"let oldc=c
"let c+=1
"while c<lc && synconcealed(l, c)[0]
"let c+=1
"endwhile
"let mvcnt+=strchars(line[oldc-1:c-2])
"else
"let cnt-=1
"let mvcnt+=1
"let c+=len(matchstr(line[c-1:], '.'))
"endif
"endwhile
"return ":\<C-u>\e".mvcnt."l"
"endfun
"        ßaaaaß ßaaaaaaß
"fun! ForwardSkipConceal(count)
"let c=col('.')
"let l=line('.')
"let mvcnt=0
"let [isconcealed, cchar, group] = synconcealed(l, c+1)
"if isconcealed
"let mvcnt=2
"else
"let mvcnt=1
"endif
"return ":\<C-u>\e".mvcnt.'l'
"endfun
"fun! BackwardSkipConceal(count)
"let cnt=a:count
"let mvcnt=0
"let c=col('.')
"let l=line('.')
"let lc=1
"let line=getline('.')
"while cnt
"if c<=lc
"let mvcnt+=cnt
"break
"endif
"if stridx(&concealcursor, 'n')==-1
"let isconcealed=0
"else
"let [isconcealed, cchar, group]=synconcealed(l, c)
"endif
"if isconcealed
"let cnt-=strchars(cchar)
"let oldc=c
"let c-=1
"while c<lc && synconcealed(l, c)[0]
"let c-=1
"endwhile
"let mvcnt+=strchars(line[oldc-1:c-2])
"else
"let cnt-=1
"let mvcnt+=1
"let c+=len(matchstr(line[c-1:], '.'))
"endif
"endwhile
"return ":\<C-u>\e".mvcnt."h"
"endfun
"nnoremap <expr> <silent> <buffer> l ForwardSkipConceal(v:count1)
"nnoremap <expr> <silent> <buffer> h BackwardSkipConceal(v:count1)
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
nnoremap ™ :TOhtml<CR>
      \:x! ~/.vim/index.html<CR>
      \:AsyncRun dropbox_uploader.sh upload ~/.vim/index.html Apps/Pancake.io/index.html<CR>
      \:let @* = 'klasseg.pancakeapps.com'<CR>
vnoremap ™ :TOhtml<CR>
      \:x! ~/.vim/index.html<CR>
      \:AsyncRun dropbox_uploader.sh upload ~/.vim/index.html Apps/Pancake.io/index.html<CR>
      \:let @* = 'klasseg.pancakeapps.com'<CR>
let g:html_whole_filler = 1
let g:html_prevent_copy = "fn"
let g:html_pre_wrap = 0
"let g:html_dynamic_folds = 1
"let g:html_no_foldcolumn = 1
"let g:html_hover_unfold = 1
": Windows
" Toggle
nmap <C-d> <C-w>w
" Resize
nnoremap ≤ :vertical resize -1<CR>
nnoremap ≥ :vertical resize +1<CR>
nnoremap ≈ :resize -1<CR>
nnoremap ± :resize +1<CR>
" Navigate splits
nnoremap <Right> <C-w>l
nnoremap <Left>  <C-w>h
nnoremap <Up>    <C-w>k
nnoremap <Down>  <C-w>j
": Command line
cnoremap <C-k>  <Up>
cnoremap <C-j>  <Down>
cnoremap <Up>   <Nop>
cnoremap <Down> <Nop>
nnoremap ! :!
": Git
" Find who wrote line
"vmap g :!git blame =expand("%:p") &#124; sed -n =line("'&lt;") ,=line("'&gt;") p
": Tags
"fun! GenerateTags()
  "if &tags != "" && &tags != "tags"
    "let l:tagdir_path=substitute(&tags, '/tags', '', 0)
    "exe "AsyncRun ctags --tag-relative -f" &tags "-R" l:tagdir_path
  "endif
"endfun
"nnoremap <silent> t <C-]>
nnoremap <silent> <D-r> :call GenerateTags()<CR>
": Visual mode
" Move to edges in visual mode, append in block mode
vnoremap <expr> A mode()=~'v' ? '$h' : 'A'
" No yank on paste
vnoremap P "_dp
xnoremap P "_dp
vnoremap p "_dP
xnoremap p "_dP
": GUI settings
if has("gui_running")
  set guioptions=
  set ghr=60
  colorscheme gruvbox
endif
": Langmap
"set langmap=li,ko,hn,je,nh,ej,ik,ol,LI,KO,JE,EJ,IK,OL
": Fix defaults
vnoremap <BS> <BS>
set backspace=2
": Undo
set undofile
set undodir=~/.vimundo
set undolevels=2000
set updatecount=10000
nnoremap <D-u> :UndotreeToggle<CR>
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
": Hide distractions
let g:hide_distractions = 1
nnoremap <C-x> :call HideDistractions()<CR>
fun! HideDistractions()
  if(g:hide_distractions == 1)
    hi Comment ctermfg=235 guifg=#1d2021
    hi Folded ctermfg=235 guifg=#1d2021 ctermbg=235 guibg=#282828
    let g:hide_distractions = 0
  else
    hi Comment ctermfg=245 guifg=#928374
    hi Folded ctermfg=245 guifg=#928374 ctermbg=237 guibg=#3c3836
    let g:hide_distractions = 1
  endif
endfun
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
"vnoremap <Tab> >
"vnoremap <S-Tab> <
"nnoremap <Tab> >
"nnoremap <S-Tab> <
": Tabpages
" Switch tab forward
"nnoremap <C-Tab> gt
" Switch tab backward with <Alt-Tab>
nnoremap  gT
" Move to new tab
nnoremap gl <C-w>TgT
": Buffers
" Toggle buffer
nnoremap <C-S-Tab> :b#<CR>
": Save
if mapcheck("\<C-s>", "N") == ""
  nnoremap <C-s> :w<CR>
endif
": Open files
let b:makefile_path   = fnamemodify(findfile('makefile'   , ';'), ':p')
let b:readme_path     = fnamemodify(findfile('README.md'  , ';'), ':p')
let b:exe_path        = fnamemodify(findfile('bin/exe'    , ';'), ':p')
let &tags             = fnamemodify(findfile('tags'       , ';'), ':p')
let b:makelog_path    = fnamemodify(findfile('log/makelog', ';'), ':p')
set swb=usetab
fun! OpenFile(filepath) " Open file in new tab, or goto that tab if file already is open
  if a:filepath != ""
    redir => g:openfile_err
    silent! exe "sb" a:filepath
    redir END
    if g:openfile_err =~ 'E94'
      exe "tabedit" a:filepath
    else
      wincmd t
    endif
  endif
endfun
nnoremap <silent> é :call OpenFile(b:makefile_path)<CR>
nnoremap <silent> ® :call OpenFile(b:readme_path)<CR>
": Programming commands
":: Rust
"nnoremap : :AsyncRun tmux send-keys -t Rust "clear && cargo test -- --nocapture" Enter<CR>
":: C
fun! Make(...)
  if b:makefile_path != ""
    let l:makedir_path=substitute(b:makefile_path, '/makefile', '', 0)
    3 wincmd w
    if a:0 == 1
      exe "term ++curwin make -C" l:makedir_path a:1
    else
      exe "term ++curwin make -C" l:makedir_path
    endif
    2 wincmd w
    "exe "AsyncRun make -C $(dirname ".b:makefile_path.") 2> " b:makelog_path
  endif
endfun
fun! Execute()
  if b:exe_path != ""
    let l:exe_path = b:exe_path
    3 wincmd w
    exe "term ++curwin " l:exe_path
    2 wincmd w
  endif
endfun
nnoremap <silent> <D-b> :call Make()<CR>
nnoremap <silent> <D-d> :call Make("clean")<CR>
nnoremap <silent> <D-e> :call Execute()<CR>
": Mode
"let &statusline.='%{RedrawStatuslineColors(mode())}' " Inefficient
"fun! RedrawStatuslineColors(mode)
"if a:mode == 'n'
"call GruvboxHlsHideCursor()
"elseif a:mode == 'i'
"call GruvboxHlsHideCursor()
"elseif a:mode == 'R'
"call GruvboxHlsHideCursor()
"elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
"call GruvboxHlsShowCursor()
"endif
"endfun
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
": Fix?
inoremap <S-Tab> <C-d>
": Experimental
function! _FindItemAtCursor() abort
    let l:buf = bufnr('')
    let l:info = get(g:ale_buffer_info, l:buf, {})
    let l:loclist = get(l:info, 'loclist', [])
    let l:pos = getcurpos()
    let l:index = ale#util#BinarySearch(l:loclist, l:buf, l:pos[1], l:pos[2])
    let l:loc = l:index >= 0 ? l:loclist[l:index] : {}
    return [l:info, l:loc]
endfunction

function! _ShowCursorDetail() abort
    " Only echo the warnings in normal mode, otherwise we will get problems.
    if mode() isnot# 'n'
        return
    endif
    if ale#ShouldDoNothing(bufnr(''))
        return
    endif
    let [l:info, l:loc] = _FindItemAtCursor()
    if !empty(l:loc)
        let l:message = get(l:loc, 'detail', l:loc.text)
        return l:message
    endif
endfunction

fun! _GoogleError()
  let l:msg = _ShowCursorDetail()
  if l:msg != ""
    exe "AsyncRun s" l:msg
  endif
endfun

nnoremap <silent> … :call _GoogleError()<CR>
