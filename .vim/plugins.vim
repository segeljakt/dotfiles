"+----------------------------------------------------------------------------+
"|                  Author: Klas Segeljakt <klasseg@kth.se>                   |
"+----------------------------------------------------------------------------+
" [Color-Schemes]
Plug 'nlknguyen/papercolor-theme'

" [Libraries]
Plug 'vim-scripts/ingo-library'        " Blockwise-repeat
Plug 'mattn/webapi-vim'                " Needed by vim-gist

" [My Plugins]
" Plug '/Users/Klas/Workspace/vim/vim-sentencer'
" Plug '/Users/Klas/Workspace/vim/vim-stealth'
Plug 'segeljakt/vim-isotope'
Plug 'segeljakt/vim-silicon'
Plug '~/Workspace/vim-commando'
Plug '~/Workspace/arc/arc-lang/editor/vim/'

" [General-purpose]
Plug 'josa42/vim-lightline-coc'
Plug 'itchyny/vim-highlighturl'
Plug 'flwyd/vim-conjoin'
Plug 'vim-utils/vim-troll-stopper'
Plug 'ryanoasis/vim-devicons'
Plug 'farmergreg/vim-lastplace'
Plug 'simeji/winresizer'               " Window management
Plug 'rhysd/git-messenger.vim'
Plug 'ruanyl/vim-gh-line'
Plug 'godlygeek/tabular'               " Align stuff
Plug 'zirrostig/vim-schlepp'           " Drag visual block and visual line
Plug 'mhinz/vim-startify'              " Start-screen
Plug 'mbbill/undotree'                 " Undo history
Plug 'danro/rename.vim'                " Rename current buffer
Plug 'moll/vim-bbye'                   " Delete buffers and close files
Plug 'nelstrom/vim-visual-star-search' " Search by visual block
Plug 'machakann/vim-sandwich'          " Change surrounding parentheses
Plug 'vim-scripts/visualrepeat'        " Repeat . for visual mode
Plug 'tpope/vim-repeat'                " Improved '.'
Plug 'tpope/vim-abolish'               " iabbrev, %S, snake_case => camelCase
Plug 'tpope/vim-fugitive'              " Git essentials
Plug 'romainl/vim-cool'                " Turn off hlsearch
Plug 'tmsvg/pear-tree'                 " Auto-pairs but better
Plug 'bkad/camelcasemotion'            " camelCaseMotion and snake_case_motion
Plug 'tomtom/tcomment_vim'             " Commenting plugin
Plug 'github/copilot.vim'              " AI Overlords
Plug 'itchyny/lightline.vim'
Plug 'andymass/vim-matchup'            " Better matching
Plug 'lervag/vimtex'
Plug 'ron89/thesaurus_query.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" [File-specific]
Plug 'plasticboy/vim-markdown',        { 'for':'markdown' } " (Must come after Tabular)
Plug 'junegunn/limelight.vim',         { 'for':['markdown', 'latex'] } " (*) Fade adjacent paragraphs
Plug 'junegunn/goyo.vim',              { 'for':['markdown', 'latex'] } " (*) Distraction-less mode
Plug 'dhruvasagar/vim-table-mode',     { 'for':['markdown', 'latex'] } " (*) Draw tables
Plug 'AndrewRadev/splitjoin.vim',                         " Split and join code
Plug 'rrethy/vim-illuminate',                             " Highlight word under cursor
Plug 'andrewradev/sideways.vim'                           " Move arguments sideways
Plug 'foosoft/vim-argwrap'                                " Wrap/unwrap arguments
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mg979/vim-visual-multi'
Plug 'https://gist.github.com/PeterRincker/582ea9be24a69e6dd8e237eb877b8978.git',
  \ { 'as': 'SortGroup', 'do': 'mkdir plugin; mv -f *.vim plugin/', 'on': 'SortGroup' } " Sort Multi Line Groups
Plug 't9md/vim-choosewin'
Plug 'camspiers/lens.vim'

" [Teaching]
Plug 'hyhugh/coc-erlang_ls', {'do': 'yarn install --frozen-lockfile'}

" [Filetype]
Plug 'elliottcable/vim-menhir'
Plug 'rust-lang/rust.vim'
Plug 'elzr/vim-json'
Plug 'cespare/vim-toml'
Plug 'tie/llvm.vim'
Plug 'ocaml/merlin'
Plug 'chrisbra/vim-zsh'
