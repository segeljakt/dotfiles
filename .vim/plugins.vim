"+----------------------------------------------------------------------------+
"|                  Author: Klas Segeljakt <klasseg@kth.se>                   |
"+----------------------------------------------------------------------------+
": My plugins
Plug 'segeljakt/vim-sentencer'
Plug 'segeljakt/vim-stealth'
": General-purpose
Plug 'morhetz/gruvbox'                     " (*) The ultimate color theme
" Plug 'inside/vim-search-pulse'             " Highlight search result
Plug 'vimwiki/vimwiki'                     " Personal Wiki
Plug 'simeji/winresizer'                   " (*) Window management
Plug 'Yilin-Yang/vim-markbar'              " Mark lines and add notes
Plug '/usr/local/opt/fzf'                  " (*) FZF installation
Plug 'junegunn/fzf.vim'                    " (*) FZF
Plug 'godlygeek/tabular'                   " (*) Align stuff
Plug 'plasticboy/vim-markdown'             " Must come after Tabular
Plug 'kshenoy/vim-signature'               " Show and navigate signatures
Plug 'zirrostig/vim-schlepp'               " (*) Drag visual block and visual line
Plug 'mhinz/vim-startify'                  " (*) Start-screen
Plug 'mbbill/undotree'                     " (*) undo history
Plug 'mcchrish/nnn.vim'                    " NerdTree replacement
" Plug 'scrooloose/nerdtree'                 " (*) File system navigator
Plug 'dhruvasagar/vim-table-mode'          " (*) Draw tables
Plug 'danro/rename.vim'                    " (*) Rename current buffer
Plug 'moll/vim-bbye'                       " (*) Delete buffers and close files
Plug 'vim-scripts/mru.vim'                 " (*) Manage most recently used files
Plug 'drzel/vim-line-no-indicator'         " (*) Line number indicator
Plug 'tommcdo/vim-exchange'                " (*) Swap two visual selections
Plug 'wesq3/vim-windowswap'                " (*) Swap buffers
Plug 'tpope/vim-rhubarb'                   " (*) Browse GitHub
Plug 'skywind3000/asyncrun.vim'            " (*) Run commands asynchronously
Plug 'itchyny/lightline.vim'               " (*) Better airline
Plug 'nelstrom/vim-visual-star-search'     " (*) Search by visual block
Plug 'vim-scripts/visualrepeat'            " (*) Repeat . for visual mode
Plug 'vim-scripts/ingo-library'            " (*) Blockwise-repeat
Plug 'tpope/vim-surround'                  " (*) Change surrounding parentheses
Plug 'easymotion/vim-easymotion'           " (*) Move batween words
Plug 'tpope/vim-repeat'                    " (*) Improved '.'
Plug 'tpope/vim-abolish'                   " (*) iabbrev, %S, snake_case => camelCase
Plug 'romainl/vim-cool'                    " (*) Turn off hlsearch
Plug 'vim-scripts/DrawIt'                  " (*) Draw lines
Plug 'shougo/vimproc.vim'                  " (*) Asynchronous execution library
Plug 'wakatime/vim-wakatime'               " (*) Monitor programming statistics
": Writing
fun! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release --no-default-features --features json-rpc
  endif
endfun
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
" Plug 'vim-pandoc/vim-pandoc'               " (*) Pandoc
" Plug 'vim-pandoc/vim-pandoc-syntax'        " (*) Pandoc syntax
" Plug 'vim-pandoc/vim-pandoc-after'         " (*) Integration with other plugins
Plug 'junegunn/limelight.vim'              " (*) Fade adjacent paragraphs
Plug 'junegunn/goyo.vim'                   " (*) Distraction-less mode
": Programming
Plug 'mattn/gist-vim'                      " Create gist from buffer
Plug 'janko-m/vim-test'                    " Test stuff
Plug 'AndrewRadev/splitjoin.vim'           " Split and join code
Plug 'andymass/vim-matchup'                " Better matching
Plug 'rrethy/vim-illuminate'               " Highlight word under cursor
Plug 'honza/vim-snippets'
"Plug 'metakirby5/codi.vim'                 " (*) Live coding REPL
Plug 'segeljakt/auto-pairs'                " (*) Insert pairs of separators (fork)
Plug 'shougo/echodoc'                      " (*) Display function signature in cmd
"Plug 'sirver/ultisnips'                    " (*) Snippets
Plug 'tenfyzhong/completeparameter.vim'    " (*) Complete YCM function parameters
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'} " (*) Generate YCM config files
"Plug 'valloric/youcompleteme',             " (*) YCM
  "\ {'do': './install.py --clang-completer --rust-completer'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'ryanoasis/vim-devicons'              " (*) Unicode for NERDTree
Plug 'w0rp/ale'                            " (*) Async linting
Plug 'majutsushi/tagbar'                   " (*) Display tags of window
Plug 'bkad/camelcasemotion'                " (*) camelCaseMotion and snake_case_motion
Plug 'andrewradev/sideways.vim'            " (*) Move arguments sideways
Plug 'foosoft/vim-argwrap'                 " (*) Wrap/unwrap arguments
Plug 'tomtom/tcomment_vim'                 " (*) Commenting plugin
Plug 'vim-scripts/a.vim'                   " (*) C - Toggle between header and source
Plug 'airblade/vim-gitgutter'              " (*) Git - Show changes in git (Better)
Plug 'derekwyatt/vim-scala'                " (*) Scala - Filetype plugin
Plug 'justinmk/vim-syntax-extra'           " (*) C - Better syntax highlighting
Plug 'sbdchd/neoformat'                    " (*) Format code
Plug 'cohama/agit.vim'                     " (*) Git - View git log
Plug 'tpope/vim-fugitive'                  " (*) Git - Git wrapper
Plug 'terryma/vim-expand-region'           " (*) Expand/close closest text-object
": Filetype
"Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'                  " (*) .rs
Plug 'octol/vim-cpp-enhanced-highlight'    " (*) .cpp
Plug 'cespare/vim-toml'                    " (*) .toml
Plug 'pest-parser/pest.vim'                " (*) .pest
Plug 'mechatroner/rainbow_csv'             " (*) .csv
Plug 'jrozner/vim-antlr'                   " .antlr
Plug 'valloric/matchtagalways'             " .xml/.html
Plug 'elzr/vim-json'                       " .json
Plug 'darfink/vim-plist'                   " .plist
