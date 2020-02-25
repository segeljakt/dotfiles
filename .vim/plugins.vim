"+----------------------------------------------------------------------------+
"|                  Author: Klas Segeljakt <klasseg@kth.se>                   |
"+----------------------------------------------------------------------------+
" [Color-Schemes]
Plug 'nlknguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'camgunz/amber'
Plug 'endel/vim-github-colorscheme'
Plug 'sainnhe/edge'

" [Libraries]
Plug 'mattn/webapi-vim'                " (*) Needed by vim-gist
Plug 'shougo/vimproc.vim'              " (*) Asynchronous execution library
Plug 'vim-scripts/ingo-library'        " (*) Blockwise-repeat
" Plug 'camspiers/animate.vim'

" [My Plugins]
" Plug '/Users/Klas/Workspace/vim/vim-sentencer'
" Plug '/Users/Klas/Workspace/vim/vim-stealth'
Plug '/Users/Klas/Workspace/vim/vim-isotope'
Plug '/Users/Klas/Workspace/vim/vim-silicon'

if has("macvim")
  Plug '/Users/Klas/Workspace/vim/vim-commando'
en

" [General-purpose]
" Plug 'psliwka/vim-smoothie'            " Smooth scrolling
" Plug 'skywind3000/vim-quickui'
Plug 'farmergreg/vim-lastplace'
" Plug 'RRethy/vim-hexokinase'           " Hex colors
Plug 'simeji/winresizer'               " (*) Window management
Plug '/usr/local/opt/fzf'              " (*) FZF installation
Plug 'junegunn/fzf.vim'                " (*) FZF
Plug 'godlygeek/tabular'               " (*) Align stuff
Plug 'zirrostig/vim-schlepp'           " (*) Drag visual block and visual line
Plug 'mhinz/vim-startify'              " (*) Start-screen
Plug 'mbbill/undotree'                 " (*) Undo history
Plug 'scrooloose/nerdtree'             " (*) Would be nice to find a replacement
Plug 'danro/rename.vim'                " (*) Rename current buffer
Plug 'moll/vim-bbye'                   " (*) Delete buffers and close files
Plug 'nelstrom/vim-visual-star-search' " (*) Search by visual block
Plug 'machakann/vim-sandwich'          " (*) Change surrounding parentheses
Plug 'vim-scripts/visualrepeat'        " (*) Repeat . for visual mode
Plug 'tpope/vim-repeat'                " (*) Improved '.'
Plug 'tpope/vim-abolish'               " (*) iabbrev, %S, snake_case => camelCase
Plug 'tpope/vim-fugitive'              " (*) Git essentials
Plug 'romainl/vim-cool'                " (*) Turn off hlsearch
Plug 'vim-scripts/DrawIt'              " (*) Draw lines
Plug 'gyim/vim-boxdraw'
Plug 'tmsvg/pear-tree'                 " (*) Auto-pairs but better
Plug 'bkad/camelcasemotion'            " (*) camelCaseMotion and snake_case_motion
Plug 'tomtom/tcomment_vim'             " (*) Commenting plugin
Plug 'terryma/vim-expand-region'       " (*) Expand/close closest text-object
Plug '~/Workspace/vim/lightline.vim'   " (*) The best statusline
Plug 'andymass/vim-matchup'            " (*) Better matching
Plug 'airblade/vim-gitgutter'          " (*) Git - Show changes in git (Better)
" [File-specific]
Plug 'iamcco/markdown-preview.nvim',   { 'do': 'cd app & yarn install'  }
Plug 'plasticboy/vim-markdown',        { 'for':'markdown' } " (Must come after Tabular)
Plug 'junegunn/limelight.vim',         { 'for':['markdown', 'latex'] } " (*) Fade adjacent paragraphs
Plug 'junegunn/goyo.vim',              { 'for':['markdown', 'latex'] } " (*) Distraction-less mode
Plug 'dhruvasagar/vim-table-mode',     { 'for':['markdown', 'latex'] } " (*) Draw tables
Plug 'lervag/vimtex',                  { 'for':'latex'  }
Plug 'KeitaNakamura/tex-conceal.vim',  { 'for':'latex'  }
Plug 'metakirby5/codi.vim',            { 'for':'python' } " (*) Live coding REPL
Plug 'mattn/gist-vim',                                    " Create gist from buffer
Plug 'AndrewRadev/splitjoin.vim',                         " Split and join code
Plug 'rrethy/vim-illuminate',                             " Highlight word under cursor
Plug 'iandingx/leetcode.vim'                             
" Plug 'w0rp/ale',                                          " (*) Async linting
Plug 'andrewradev/sideways.vim'                             " (*) Move arguments sideways
Plug 'foosoft/vim-argwrap'                                  " (*) Wrap/unwrap arguments
Plug 'sbdchd/neoformat',                                    " (*) Format code
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'mg979/vim-visual-multi'
Plug 'https://gist.github.com/PeterRincker/582ea9be24a69e6dd8e237eb877b8978.git',
  \ { 'as': 'SortGroup', 'do': 'mkdir plugin; mv -f *.vim plugin/', 'on': 'SortGroup' } " Sort Multi Line Groups
Plug 't9md/vim-choosewin'
Plug 'AaronLasseigne/yank-code'
" Plug 'vim/killersheep'
" Plug 'IMOKURI/line-number-interval.nvim'
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'mhinz/vim-crates'
Plug 'APZelos/blamer.nvim'
Plug 'camspiers/lens.vim'

" [Filetype]
Plug 'rust-lang/rust.vim',               { 'for':'rust'         } " (*) .rs
Plug 'elzr/vim-json',                    { 'for':'json'         } " .json
Plug 'derekwyatt/vim-scala',             { 'for':'scala'        } " (*) Scala - Filetype plugin
Plug 'cespare/vim-toml',                 { 'for':'toml'         } " (*) .toml
Plug 'darfink/vim-plist',                                         " .plist
" Plug 'neovimhaskell/haskell-vim'
" Plug 'vale1410/vim-minizinc'
Plug 'tie/llvm.vim'
" Plug 'ocaml/merlin' " Ocaml
" Plug 'OCamlPro/ocp-indent' "Ocaml
Plug 'chrisbra/vim-zsh'

" Plug 'derekelkins/agda-vim',             { 'for':'agda'         } " (*) .agda
" Plug 'bfrg/vim-cpp-modern'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for':'cpp'          } " (*) .cpp
" Plug 'lyuts/vim-rtags'
" Plug 'Yilin-Yang/vim-markbar'
" Plug 'majutsushi/tagbar'
" Plug 'justinmk/vim-syntax-extra',        { 'for':'c'            } " (*) C - Better syntax highlighting
" Plug 'valloric/matchtagalways',          { 'for':['xml','html'] } " .xml/.html
" Plug 'pest-parser/pest.vim',             { 'for':'pest'         } " (*) .pest
" Plug 'mechatroner/rainbow_csv',          { 'for':'csv'          } " (*) .csv
" Plug 'jrozner/vim-antlr',                { 'for':'antlr4'       } " .antlr
" Plug 'julialang/julia-vim',              { 'for':'julia'        }
