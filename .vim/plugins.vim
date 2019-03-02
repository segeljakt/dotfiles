"+----------------------------------------------------------------------------+
"|                  Author: Klas Segeljakt <klasseg@kth.se>                   |
"+----------------------------------------------------------------------------+
" [Color-Schemes]
" Plug 'morhetz/gruvbox'                 " (*) The ultimate color theme
Plug 'vim-scripts/CycleColor'
" Plug 'flazz/vim-colorschemes'
Plug 'nlknguyen/papercolor-theme'
" [Libraries]
Plug 'mattn/webapi-vim'                " (*) Needed by vim-gist
Plug 'shougo/vimproc.vim'              " (*) Asynchronous execution library
Plug 'vim-scripts/ingo-library'        " (*) Blockwise-repeat
" [My plugins]
Plug 'klassegeljakt/vim-sentencer'
Plug '/Users/Klas/Workspace/vim-stealth'
"Plug '/Users/Klas/Git/my-projects/vim-plugins/vim-commando'
Plug '/Users/Klas/Git/my-projects/vim-plugins/vim-isotope'
" [General-purpose]
" Plug 'TaDaa/vimade'                    " Fade text in inactive buffers
" Plug 'inside/vim-search-pulse'         " Highlight search result
Plug 'vimwiki/vimwiki'                 " Personal Wiki
Plug 'simeji/winresizer'               " (*) Window management
Plug 'shougo/denite.nvim'
" Plug 'Yilin-Yang/vim-markbar'          " Mark lines and add notes
Plug '/usr/local/opt/fzf'              " (*) FZF installation
Plug 'junegunn/fzf.vim'                " (*) FZF
Plug 'godlygeek/tabular'               " (*) Align stuff
" Plug 'kshenoy/vim-signature'           " Show and navigate signatures
Plug 'zirrostig/vim-schlepp'           " (*) Drag visual block and visual line
Plug 'mhinz/vim-startify'              " (*) Start-screen
Plug 'mbbill/undotree'                 " (*) Undo history
" Plug 'mcchrish/nnn.vim'                " NerdTree replacement
" Plug 'scrooloose/nerdtree'             " (*) File system navigator
Plug 'mcchrish/nnn.vim'
" Plug 'ryanoasis/vim-devicons'          " (*) Unicode for NERDTree
Plug 'danro/rename.vim'                " (*) Rename current buffer
Plug 'moll/vim-bbye'                   " (*) Delete buffers and close files
Plug 'vim-scripts/mru.vim'             " (*) Manage most recently used files
Plug 'tommcdo/vim-exchange'            " (*) Swap two visual selections
Plug 'skywind3000/asyncrun.vim'        " (*) Run commands asynchronously
Plug 'nelstrom/vim-visual-star-search' " (*) Search by visual block
Plug 'vim-scripts/visualrepeat'        " (*) Repeat . for visual mode
Plug 'tpope/vim-surround'              " (*) Change surrounding parentheses
Plug 'easymotion/vim-easymotion'       " (*) Move batween words
Plug 'tpope/vim-repeat'                " (*) Improved '.'
Plug 'tpope/vim-abolish'               " (*) iabbrev, %S, snake_case => camelCase
Plug 'tpope/vim-fugitive'
Plug 'romainl/vim-cool'                " (*) Turn off hlsearch
Plug 'vim-scripts/DrawIt'              " (*) Draw lines
Plug 'tmsvg/pear-tree'                 " PLZ
" Plug 'segeljakt/auto-pairs'            " (*) Insert pairs of separators (fork)
Plug 'bkad/camelcasemotion'            " (*) camelCaseMotion and snake_case_motion
Plug 'tomtom/tcomment_vim'             " (*) Commenting plugin
Plug 'terryma/vim-expand-region'       " (*) Expand/close closest text-object
Plug '~/Workspace/lightline.vim'       " (*) The best statusline
Plug 'drzel/vim-line-no-indicator'     " (*) Line number indicator
Plug 'wakatime/vim-wakatime'           " (*) Monitor programming statistics
Plug 'andymass/vim-matchup'            " (*) Better matching
Plug 'airblade/vim-gitgutter'          " (*) Git - Show changes in git (Better)
" Plug 'machakann/vim-highlightedyank'
" [File-specific]
fun! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release --no-default-features --features json-rpc
  endif
endfun
Plug 'euclio/vim-markdown-composer',     { 'for':'markdown', 'do':function('BuildComposer') }
Plug 'plasticboy/vim-markdown',          { 'for':'markdown' } " (Must come after Tabular)
Plug 'junegunn/limelight.vim',           { 'for':['markdown', 'latex'] } " (*) Fade adjacent paragraphs
Plug 'junegunn/goyo.vim'                 { 'for':['markdown', 'latex'] } " (*) Distraction-less mode
Plug 'dhruvasagar/vim-table-mode',       { 'for':['markdown', 'latex'] } " (*) Draw tables
Plug 'lervag/vimtex',                    { 'for':'latex'  }
Plug 'KeitaNakamura/tex-conceal.vim',    { 'for':'latex'  }
Plug 'metakirby5/codi.vim',              { 'for':'python' } " (*) Live coding REPL
Plug 'mattn/gist-vim',                   { 'for':'rust'   } " Create gist from buffer
Plug 'janko-m/vim-test',                 { 'for':'rust'   } " Test stuff
Plug 'AndrewRadev/splitjoin.vim',        { 'for':'rust'   } " Split and join code
Plug 'rrethy/vim-illuminate',            { 'for':'rust'   } " Highlight word under cursor
" Plug 'honza/vim-snippets',               { 'for':'rust'   }
Plug 'shougo/echodoc',                   { 'for':'rust'   } " (*) Display function signature in cmd
Plug 'sirver/ultisnips',                 { 'for':'rust'   } " (*) Snippets
" Plug 'neoclide/coc.nvim',                { 'for':['rust','python'], 'tag': '*', 'do':{-> coc#util#install()} }
Plug 'w0rp/ale',                          " (*) Async linting
Plug 'maximbaz/lightline-ale'
" Plug 'majutsushi/tagbar',              { 'for':'rust'   } " (*) Display tags of window
Plug 'andrewradev/sideways.vim'                             " (*) Move arguments sideways
Plug 'foosoft/vim-argwrap',              { 'for':'rust'   } " (*) Wrap/unwrap arguments
Plug 'sbdchd/neoformat',                 { 'for':'rust'   } " (*) Format code
" [Filetype]
"Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim',               { 'for':'rust'         } " (*) .rs
Plug 'octol/vim-cpp-enhanced-highlight', { 'for':'cpp'          } " (*) .cpp
Plug 'justinmk/vim-syntax-extra',        { 'for':'c'            } " (*) C - Better syntax highlighting
Plug 'valloric/matchtagalways',          { 'for':['xml','html'] } " .xml/.html
Plug 'elzr/vim-json',                    { 'for':'json'         } " .json
Plug 'derekwyatt/vim-scala',             { 'for':'scala'        } " (*) Scala - Filetype plugin
Plug 'cespare/vim-toml',                 { 'for':'toml'         } " (*) .toml
Plug 'pest-parser/pest.vim',             { 'for':'pest'         } " (*) .pest
Plug 'mechatroner/rainbow_csv',          { 'for':'csv'          } " (*) .csv
Plug 'jrozner/vim-antlr',                { 'for':'antlr4'       } " .antlr
Plug 'darfink/vim-plist',                                         " .plist
Plug 'natebosch/vim-lsc/'
