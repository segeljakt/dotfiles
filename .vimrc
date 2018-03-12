"+----------------------------------------------------------------------------+
"|                  Author: Klas Segeljakt <klasseg@kth.se>                   |
"+----------------------------------------------------------------------------+
": General settings
set nocp                        " Always do this first
let mapleader = "§"             " Leader key
let g:gruvbox_contrast_dark="hard" " Needs to be put before loading
let g:pymode_run_bind='…'
" Manually installed plugins
set runtimepath^=~/.vim/bundle/formatvim-4.3/
set runtimepath^=~/.vim/bundle/ZyX_I-frawor-52d18a3895c9/
"let g:pandoc#folding#foldryaml = 1
source ~/.vim/private.vim
call plug#begin('~/.vim/plugged')
source ~/.vim/plugins.vim       " Load plugins
call plug#end()
let g:author = "Klas Segeljakt" " My name
let g:email = "klasseg@kth.se"  " My email
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
set guicursor+=a:blinkon0       " Disable blinking
set guifont=Menlo\ for\ Powerline:h11
"set guifont=Ubuntu\ Mono\ derivative\ Powerline:h13
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
" o: Comment on o
" w: Trailing whitespace = Same
" n: Recognize numbered lists
" l: Do not break long lines
" j: Remove comment when joining lines
let g:rust_recommended_style = 0
"::----------- DISABLED ------------
"set guipty
"set macligatures               " Ligatures (Laggy)
"set macmeta                    " <Alt> => <M>
"set makeef=""                  " Quickfix file from make
"set matchpairs=""
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
" Delete previous word
"inoremap <C-BS> <C-W>
"inoremap <expr> <BS> IsEmptyComment() ? "\<C-c>dd\<BS>a" : "\<BS>"
"fun! IsEmptyComment()
  "return getline(".") == "// "
"endfun
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
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
" <Alt+Space> key should be treated as <Space>
inoremap   <Space>
" View yanks with <C-o>
nnoremap <C-o> :reg<CR>
"::----------- DISABLED ------------
" Disabled keys
"inoremap <Right> <NOP>
"inoremap <Left>  <NOP>
"inoremap <Up>    <NOP>
"inoremap <Down>  <NOP>
" No yank on paste
"vnoremap p "_dP
"xnoremap p "_dP
" System clipboard (Does not work)
"xnoremap <silent> ç :.w !pbcopy silent<CR><CR>
" Select previously pasted text
"nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'
" Move to edges
"nnoremap <C-h> 0
"nnoremap <C-j> L
"nnoremap <C-k> H
"nnoremap <C-l> $
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
  return getline(1) == "/".repeat('*', 78)
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
fun! GenerateTags()
  if &tags != "" && &tags != "tags"
    let l:tagdir_path=substitute(&tags, '/tags', '', 0)
    exe "AsyncRun ctags --tag-relative -f" &tags "-R" l:tagdir_path
  endif
endfun
nnoremap <silent> t <C-]>
nnoremap <silent> <D-r> :call GenerateTags()<CR>
": Visual mode
" Move to edges in visual mode, append in block mode
vnoremap <expr> A mode()=~'v' ? '$h' : 'A'
" No yank on paste
vnoremap P "_dp
xnoremap P "_dp
vnoremap p "_dP
xnoremap p "_dP
": vimrc
" Vimrc shortcut
nnoremap æ :tabedit ~/.vim/plugins.vim<CR>:split ~/.vimrc<CR>
" Update vimrc
nnoremap rv :source ~/.vimrc<CR>:source ~/.gvimrc<CR>
": GUI settings
if has("gui_running")
  set guioptions=
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
nnoremap <C-Tab> gt
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
nnoremap : :AsyncRun tmux send-keys -t Rust "clear && cargo test -- --nocapture" Enter<CR>
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
aug END
aug BufReadPostGroup | au!
  " Reformat
  au BufReadPost * if &modifiable | retab | endif
  au BufReadPost *.c,*.h,*.rs if HasTemplate_gcc() == 0 | call NewTemplate_c() | endif
  " Filter (Fix indentation on lines except comments and dots (struct assignment))
  au BufReadPost *.c,*.h,*.cpp exe 'normal mz' | exe 'g!/^\(\*\|\/\| *\.\| *&\| *\/\)/normal ==' | exe 'normal `z'
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
": Plugin Settings
":: Plugged
let g:plug_window = "tab new"
" <Alt-u> to update, <Alt-i> to install
nnoremap ı :PlugInstall<CR>
nnoremap ü :PlugUpdate<CR>
":: deoplete.vim and deoplete-rust
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#rust#racer_binary='/Users/Klas/.cargo/bin/racer'
":: rainbow_parentheses.vim
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
":: vim-racer
set hidden
let g:racer_cmd = "/Users/Klas/.cargo/bin/racer"
let g:racer_experimental_completer = 1
":: Language Server Client
"let g:lsc_server_commands = {'rust': 'rustup run stable rls'}
":: Language Server Protocol
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
":: Yankring
"nnoremap <C-o> :YRShow<CR>  
"let g:yankring_replace_n_pkey = ""
"let g:yankring_replace_n_nkey = ""
":: clang_complete
let g:clang_library_path='/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib'
":: Vdebug
fun! Pydbgp(command)
  exe "python -S /Users/Klas/Git/other-projects/pydbgp/pydbgp -d localhost:9000" a:command
endfun
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
":: vim-line-jump
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
":: CtrlP
let g:ctrlp_match_window='bottom,order:btt,min:1,max:10,results:10'
":: Ale
"nunmap <C-k>
"nunmap <C-j>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"let g:ale_c_build_dir_names += 'obj'
"o
"

let g:ale_linters = {
                    \ 'python': ['mypy', 'pylint'],
                    \ 'zsh':    ['shell'],
                    \ 'c':      ['gcc'],
                    \ 'cpp':    ['g++'],
                    \ 'rust':   ['rls', 'rustfmt'],
                    \}
"let g:ale_echo_msg_format = '<%linter%:%severity%> %code: '
nnoremap t :ALEGoToDefinition<CR>
"::: Rust
"let g:ale_rust_rustc_options = ""
let g:ale_rust_rls_toolchain = 'stable' 
"::: C
let g:ale_c_clang_executable = 'clang'
let g:ale_c_clang_options = '-std=c11 -Wall               -I /Users/Klas/Git/my-projects/adpc/src/'
let g:ale_c_clang_options = '-std=c11 -Wall            -I /Users/Klas/Git/my-projects/mario-ascii/src/'
let g:ale_c_gcc_executable = 'gcc-7'
let g:ale_c_gcc_options = '-std=c11 -Wall -fms-extensions /Users/Klas/Git/my-projects/mario-ascii/src/'
"::: CPP
let g:ale_cpp_clang_executable = 'clang'
let g:ale_cpp_clang_options = '-std=c++14 -Wall -I/usr/local/opt/openssl/include'
let g:ale_cpp_gcc_executable = 'gcc-7'
let g:ale_cpp_gcc_options ='-std=c++14 -Wall -I/usr/local/opt/openssl/include' 
"let g:ale_c_gcc_options = '-std=c11 -Wall -fms-extensions -I ~/Git/my-projects/adpc/src/'
 "'-std=c11 -Wall -fms-extensions ~/Git/my-projects/mario-ascii/src/'
let g:ale_set_quickfix = 1 " Use quickfix list instead of loclist
let g:ale_keep_list_window_open = 1 " Always show quickfix list
":: Buffergator
"let g:buffergator_suppress_keymaps = 1 " Disable default keymaps
"let g:buffergator_viewport_split_policy = "n" " Use existing window
"nnoremap : :BuffergatorOpen<CR>
":: AutoPairs
let g:AutoPairs = {
      \ '(':')',
      \ '[':']',
      \ '{':'}',
      \ '"':'"',
      \ '<':'>',
      \ }
" Unmap autopairs
"if exists("autopairs_disabled") == 0
"let autopairs_disabled=1
"iunmap <buffer> <C-h>
"endif
"inoremap <buffer> <silent> <CR> <C-R>=AutoPairsReturn()<CR>
":: Colorschemes
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
":: Colorscheme switcher
" <Alt-l> to switch colorscheme
nnoremap ﬁ :NextColorScheme<CR>
nnoremap ˛ :PrevColorScheme<CR>
":: man.vim
nmap K <Plug>ManPreGetPage<CR>
":: Startify
let g:startify_session_dir = '~/.vim/session'
let g:startify_list_order = ['files', 'dir', 'bookmarks', 'sessions', 'commands']
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
let g:startify_files_number = 5
let g:startify_change_to_vcs_root = 0
":: thesaurus_query.vim
nnoremap d<Tab> :ThesaurusQueryReplaceCurrentWord<CR>
":: python-mode
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>B'
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>R'
":: ConqueGDB
"nnoremap cd :ConqueGdbTab
":: camelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
":: Lightline
set ruler                              " Show line and column number
set noshowmode
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
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
":: NERDTree
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
":: Unite-bibtex
nnoremap ø :tabedit ~/.vim/bibtex/library.bib<CR>
nnoremap › :AsyncRun open https://www.kth.se/en/kthb<CR>
nnoremap ‹ :AsyncRun open https://scholar.google.se<CR>
let b:unite_bibtex_prefix = '[@'
let b:unite_bibtex_postfix = ']'
let b:unite_bibtex_separator = ', '
let g:unite_bibtex_bib_files = "/Users/Klas/.vim/bibtex/library.bib"
let g:unite_bibtex_cache_dir = "/Users/Klas/.vim/bibtex/cache"
":: Pandoc
let g:pandoc#syntax#protect#codeblocks = 0 " Disable indented codeblocks
"syn clear pandocCodeblock " Force it
"let g:pandoc#modules#disabled = ["folding"]
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
":: NERDCommenter
nmap <C-q> <plug>NERDCommenterAppend
nmap q <plug>NERDCommenterToggle
vmap q <plug>NERDCommenterToggle
"execute "normal \<Plug>NERDCommenterAltDelims"
let g:NERDAltDelims_c = 0
":: vim-macvim-transparency
"let g:macvim_transparency_roller = [0, 100]
" roll from
"nmap <F10> <Plug>(macvim-transparency-roll)
":: TaskList
nnoremap <leader>v <Plug>TaskList
":: present.vim
nnoremap ∏ :call TogglePresentMode()<CR>
nnoremap π :call StartPresentMode()<CR>
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
":: goyo
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
":: investigate
"let g:investigate_use_dash=1
":: vim-bbye
"nnoremap <Leader>å :Bdelete<CR>
":: vim-argwrap
nnoremap <silent> Ö :ArgWrap<CR>
":: sideways
nnoremap <C-H> :SidewaysLeft<CR>
nnoremap <C-L> :SidewaysRight<CR>
":: nrrwrgn
"vnoremap <C-i> :NR<CR>
":: ultisnips
let g:UltiSnipsExpandTrigger="<Leader><Leader>"
let g:UltiSnipsJumpForwardTrigger="<Leader><Leader>"
let g:UltiSnipsJumpBackwardTrigger=""
":: Schlepp
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
":: DrawIt
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
":: vim-vmath
vmap <expr> ++ VMATH_YankAndAnalyse()
nmap        ++ vip++
":: vim-table-mode
inoremap <C-Q> <Esc>:TableModeToggle<CR><Esc>:TableModeRealign<CR>li
inoremap <Leader>r :TableModeRealign<CR>
":: bbye
nnoremap Å :Bdelete!<CR>
nnoremap å :x<CR>
nnoremap ˙ :Bdelete!<CR>:x<CR>
":: github-dashboard
let g:github_dashboard = { 'username': g:github_username, 'password': g:github_password }
nnoremap gh :GHActivity<CR>
":: ctrlp-funky
nnoremap <Leader>p :CtrlPFunky<CR>
":: ctrlp
nnoremap <C-p> :CtrlP<CR>
":: ag
nnoremap <leader>aa :Ag
":: a.vim
nnoremap ga :A<CR>
":: easytags
"set tags=/Users/Klas/.vimtags
":: vim_current_word
"let g:vim_current_word#highlight_current_word = 0
" Cref
map <silent> <Leader>cq <Plug>CRV_CRefVimAsk
":: MRU
nnoremap <C-u> :MRU<CR>
let MRU_Window_Height = 30
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
