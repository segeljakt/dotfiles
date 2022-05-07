"+----------------------------------------------------------------------------+
"|                  Author: Klas Segeljakt <klasseg@kth.se>                   |
"+----------------------------------------------------------------------------+
" [Color-Schemes]
Plug 'nlknguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'camgunz/amber'
Plug 'endel/vim-github-colorscheme'
Plug 'sainnhe/edge'
Plug 'yassinebridi/vim-purpura'
Plug 'lifepillar/vim-gruvbox8'
Plug 'lifepillar/vim-wwdc17-theme'
Plug 'katawful/kat.vim'

" [Libraries]
Plug 'mattn/webapi-vim'                " (*) Needed by vim-gist
Plug 'shougo/vimproc.vim'              " (*) Asynchronous execution library
Plug 'vim-scripts/ingo-library'        " (*) Blockwise-repeat
" Plug 'camspiers/animate.vim'

" [My Plugins]
" Plug '/Users/Klas/Workspace/vim/vim-sentencer'
" Plug '/Users/Klas/Workspace/vim/vim-stealth'
Plug 'segeljakt/vim-isotope'
Plug 'segeljakt/vim-silicon'
Plug '~/Workspace/vim-commando'
Plug '~/Workspace/arc/arc-lang/editor/vim/'
Plug 'stevearc/dressing.nvim'
Plug 'rcarriga/nvim-notify'

" [General-purpose]
Plug 'josa42/vim-lightline-coc'
Plug 'itchyny/vim-highlighturl'
Plug 'flwyd/vim-conjoin'
Plug 'vim-utils/vim-troll-stopper'
" Plug 'tom-doerr/vim_codex'
" Plug 'puremourning/vimspector'
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'ryanoasis/vim-devicons'
" Plug 'psliwka/vim-smoothie'            " Smooth scrolling
" Plug 'skywind3000/vim-quickui'
Plug 'farmergreg/vim-lastplace'
" Plug 'lilydjwg/colorizer', { 'do': 'make install' }
" Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'simeji/winresizer'               " (*) Window management
" Plug '/usr/local/opt/fzf'              " (*) FZF installation
" Plug 'junegunn/fzf.vim'                " (*) FZF
Plug 'rhysd/git-messenger.vim'
"Plug 'tjdevries/cyclist.vim'
Plug 'haorenW1025/floatLf-nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ruanyl/vim-gh-line'
Plug 'andweeb/presence.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'               " (*) Align stuff
Plug 'zirrostig/vim-schlepp'           " (*) Drag visual block and visual line
Plug 'mhinz/vim-startify'              " (*) Start-screen
Plug 'mbbill/undotree'                 " (*) Undo history
" Plug 'scrooloose/nerdtree'             " (*) Would be nice to find a replacement
Plug 'danro/rename.vim'                " (*) Rename current buffer
Plug 'moll/vim-bbye'                   " (*) Delete buffers and close files
Plug 'nelstrom/vim-visual-star-search' " (*) Search by visual block
Plug 'machakann/vim-sandwich'          " (*) Change surrounding parentheses
Plug 'vim-scripts/visualrepeat'        " (*) Repeat . for visual mode
Plug 'tpope/vim-repeat'                " (*) Improved '.'
Plug 'tpope/vim-abolish'               " (*) iabbrev, %S, snake_case => camelCase
Plug 'tpope/vim-fugitive'              " (*) Git essentials
Plug 'romainl/vim-cool'                " (*) Turn off hlsearch
" Plug 'vim-scripts/DrawIt'              " (*) Draw lines
Plug 'gyim/vim-boxdraw'
Plug 'tmsvg/pear-tree'                 " (*) Auto-pairs but better
Plug 'bkad/camelcasemotion'            " (*) camelCaseMotion and snake_case_motion
Plug 'tomtom/tcomment_vim'             " (*) Commenting plugin
Plug 'github/copilot.vim'              " AI Overlords
" Plug '~/Workspace/vim/lightline.vim'   " (*) The best statusline
Plug 'itchyny/lightline.vim'
Plug 'andymass/vim-matchup'            " (*) Better matching
Plug 'airblade/vim-gitgutter'          " (*) Git - Show changes in git (Better)
Plug 'lervag/vimtex'
Plug 'ron89/thesaurus_query.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'mhinz/vim-signify'
" [File-specific]

Plug 'iamcco/markdown-preview.nvim',   { 'do': 'cd app & yarn install'  }
Plug 'plasticboy/vim-markdown',        { 'for':'markdown' } " (Must come after Tabular)
Plug 'junegunn/limelight.vim',         { 'for':['markdown', 'latex'] } " (*) Fade adjacent paragraphs
Plug 'junegunn/goyo.vim',              { 'for':['markdown', 'latex'] } " (*) Distraction-less mode
Plug 'dhruvasagar/vim-table-mode',     { 'for':['markdown', 'latex'] } " (*) Draw tables
Plug 'da-x/name-assign.vim'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
" Plug 'lervag/vimtex',                  { 'for':'latex'  }
" Plug 'KeitaNakamura/tex-conceal.vim',  { 'for':'latex'  }
" Plug 'metakirby5/codi.vim',            { 'for':'python' } " (*) Live coding REPL
Plug 'mattn/gist-vim',                                    " Create gist from buffer
Plug 'AndrewRadev/splitjoin.vim',                         " Split and join code
Plug 'rrethy/vim-illuminate',                             " Highlight word under cursor
Plug 'iandingx/leetcode.vim'                             
" Plug 'w0rp/ale',                                          " (*) Async linting
Plug 'andrewradev/sideways.vim'                             " (*) Move arguments sideways
Plug 'foosoft/vim-argwrap'                                  " (*) Wrap/unwrap arguments
" Plug 'sbdchd/neoformat',                                    " (*) Format code
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hyhugh/coc-erlang_ls', {'do': 'yarn install --frozen-lockfile'}
Plug 'mg979/vim-visual-multi'
Plug 'Xuyuanp/scrollbar.nvim'
Plug 'https://gist.github.com/PeterRincker/582ea9be24a69e6dd8e237eb877b8978.git',
  \ { 'as': 'SortGroup', 'do': 'mkdir plugin; mv -f *.vim plugin/', 'on': 'SortGroup' } " Sort Multi Line Groups
Plug 't9md/vim-choosewin'
" Plug 'AaronLasseigne/yank-code'
" Plug 'vim/killersheep'
" Plug 'IMOKURI/line-number-interval.nvim'
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'mhinz/vim-crates'
Plug 'APZelos/blamer.nvim'
Plug 'camspiers/lens.vim'

" [Filetype]
Plug 'vmchale/ipkg-vim'
Plug 'elliottcable/vim-menhir'
" Plug 'wlangstroth/vim-racket'
Plug 'rust-lang/rust.vim',               { 'for':'rust'         } " (*) .rs
Plug 'elzr/vim-json',                    { 'for':'json'         } " .json
" Plug 'derekwyatt/vim-scala',             { 'for':'scala'        } " (*) Scala - Filetype plugin
Plug 'cespare/vim-toml',                 { 'for':'toml'         } " (*) .toml
" Plug 'darfink/vim-plist',                                         " .plist
" Plug 'neovimhaskell/haskell-vim'
" Plug 'vale1410/vim-minizinc'
Plug 'tie/llvm.vim'
" Plug 'idris-hackers/idris-vim' " Idris
Plug 'ocaml/merlin' " Ocaml
Plug 'vim-syntastic/syntastic',          { 'for':'idris2' }
Plug 'Shougo/vimshell.vim',              { 'for':'idris2' }
Plug 'edwinb/idris2-vim'
Plug 'greymd/oscyank.vim'
" Plug 'fcpg/vim-osc52'
" Plug 'OCamlPro/ocp-indent' "Ocaml
Plug 'chrisbra/vim-zsh'
" Plug 'lifepillar/pgsql.vim'
" Plug 'tpope/vim-dadbod'
" Plug 'kristijanhusak/vim-dadbod-ui'

" Plug 'derekelkins/agda-vim',             { 'for':'agda'         } " (*) .agda
" Plug 'bfrg/vim-cpp-modern'
" Plug 'octol/vim-cpp-enhanced-highlight', { 'for':'cpp'          } " (*) .cpp
" Plug 'lyuts/vim-rtags'
" Plug 'Yilin-Yang/vim-markbar'
" Plug 'majutsushi/tagbar'
" Plug 'justinmk/vim-syntax-extra',        { 'for':'c'            } " (*) C - Better syntax highlighting
" Plug 'valloric/matchtagalways',          { 'for':['xml','html'] } " .xml/.html
" Plug 'pest-parser/pest.vim',             { 'for':'pest'         } " (*) .pest
Plug 'karsai5/DES-Vim-Highlighting'
" Plug 'mechatroner/rainbow_csv',          { 'for':'csv'          } " (*) .csv
" Plug 'jrozner/vim-antlr',                { 'for':'antlr4'       } " .antlr
" Plug 'julialang/julia-vim',              { 'for':'julia'        }
