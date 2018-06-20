"+----------------------------------------------------------------------------+
"|                  Author: Klas Segeljakt <klasseg@kth.se>                   |
"+----------------------------------------------------------------------------+
": My plugins
Plug 'klassegeljakt/vim-sentencer'
": General-purpose
Plug 'junegunn/fzf'                        " Fuzzy file finder
Plug 'airblade/vim-matchquote'             " % match quotes
Plug 'rhysd/clever-f.vim'                  " f{char} f
Plug 'tommcdo/vim-exchange'                " Swap two visual selections
Plug 'osyo-manga/vim-over'                 " Substitute preview
Plug 'sodapopcan/vim-twiggy'               " Git integration
Plug 'dougbeney/pickachu'                  " Pick file/date/color
Plug 'wesq3/vim-windowswap'                " Swap buffers
Plug 'godlygeek/tabular'                   " Align stuff
Plug 'chrisbra/unicode.vim'                " Insert unicode characters
Plug 'seydoggy/vim-watchforchanges'        " Autoread files
Plug 'rykka/colorv.vim'                    " Color viewer
Plug 'zirrostig/vim-schlepp'               " Drag visual block and visual line
Plug 'vim-scripts/ZoomWin'                 " Put all focus on one window
Plug 'ap/vim-css-color'                    " Highlight colors
Plug 'tpope/vim-rhubarb'                   " Browse GitHub
Plug 'tpope/vim-eunuch'                    " Helpers for UNIX
Plug 'vim-scripts/anwolib'                 " KeepView when doing commands
Plug 'skywind3000/asyncrun.vim'            " Run commands asynchronously
Plug 'itchyny/lightline.vim'               " Better airline
Plug 'shougo/unite.vim'                    " GUI
Plug 'shougo/denite.nvim'                  " GUI - Better?
Plug 'embear/vim-foldsearch'               " Fold non-matching lines of search
Plug 'taiansu/nerdtree-ag'                 " Search for
Plug 'rking/ag.vim'                        " Silver searcher
Plug 'mhinz/vim-startify'                  " Start-screen
Plug 'conradirwin/vim-bracketed-paste'     " Indent text when it is pasted
Plug 'seagoj/last-position.vim'            " Goto last position when opening
Plug 'vim-scripts/TextFormat'              " Align and format text
Plug 'sk1418/blockit'                      " Wrap lines in a block
Plug 'mbbill/undotree'                     " undo history
Plug 'scrooloose/nerdtree'                 " File system navigator
Plug 'dhruvasagar/vim-table-mode'          " Draw tables
"Plug 'sirver/ultisnips'                    " Snippets
Plug 'wellle/targets.vim'                  " Additional text objects
Plug 'danro/rename.vim'                    " Rename current buffer
Plug 'nelstrom/vim-visual-star-search'     " Search by visual block
Plug 'moll/vim-bbye'                       " Delete buffers and close files
Plug 'kien/ctrlp.vim'                      " Fuzzy file finder
Plug 'jazzcore/ctrlp-cmatcher'             " CtrlP performance boost
Plug 'vim-scripts/visualrepeat'            " Repeat . for visual mode
Plug 'vim-scripts/mru.vim'                 " Manage most recently used files
Plug 'wellle/visual-split.vim'             " Split windows by visual selection
Plug 'mattboehm/vim-accordion'             " Hide splits if too many
Plug 'vim-scripts/ingo-library'            " Blockwise-repeat
Plug 'tpope/vim-surround'                  " Change surrounding parentheses
Plug 'rargo/vim-line-jump'                 " Jump to lines in NERDTree or tagbar
Plug 'easymotion/vim-easymotion'           " Move batween words
Plug 'drzel/vim-line-no-indicator'         " Line number indicator
"::------------ DISABLED ------------
"Plug 'goldfeld/vim-seek'                   " f search with 2 characters
"Plug 'jeetsukumaran/vim-buffergator'       " Buffers (REMAPS EVERYTHING)
"Plug 'ensime/ensime-vim'                   " IDE stuff (Needs python 3)
"Plug 'yggdroot/indentline'                 " Indent guides (Not what I wanted)
"Plug 'nathanaelkane/vim-indent-guides'     " Indent guides (Not what I wanted)
"Plug 'kana/vim-textobj-entire'             " Select whole buffer (Doesnt work)
"Plug 'gioele/vim-autoswap'                " Corrected autoswap (Only works with terminal)
"Plug 'kovetskiy/next-indentation'         " Move with indentation (Only py2)
"Plug 'fisadev/dragvisuals.vim'            " Drag visual block and visual line
"Plug 'justincampbell/vim-eighties'        " Automatic resizing of windows
"Plug 'chrisbra/improvedft'                " Make f t F T move between lines (rebinds t)
"Plug 'colqer'                             " colqer - Colemak langmap
"Plug 'vim-airline/vim-airline-themes'     " Airline themes
"Plug 'chrisbra/nrrwrgn'                   " narrow region
"Plug 'ntpeters/vim-better-whitespace'     " Highlight trailing whitespaces (LAGGY)
"Plugin 'kurkale6ka/vim-sequence'          " Visual increment
"Plug 'dominikduda/vim_current_word'
"Plugin 'aperezdc/vim-template'            " Custom templates for files
"Plug 'thaerkh/vim-workspace'              " Automated vim session management and autosave
"Plug 'roman/golden-ratio'                 " Automatic resizing of windows
"Plug 'xolox/vim-easytags'                 " Automated tag generation and syntax highlighting
"Plug 'xolox/vim-misc'                     " Dependency to vim-easytags
"Plug 'yonchu/accelerated-smooth-scroll'   " Smooth scrolling
"Plug 'LargeFile'                          " View large files (>100MB)
"Plug 'RepeatLast.vim'                     " Repeat last X commands
"Plug 'tpope/vim-repeat'                   " Improved '.'
"Plug 'shuffle.vim'                        " Shuffle lines
"Plug 'posva/rndm'                         " Random number generator
"Plug 'thirtythreeforty/lessspace.vim'     " Strip whitespace
"Plug 'bufkill.vim'                        " Kill, clean buffers
"Plug 'raimondi/delimitmate'               " Automatic closing of quotes
"Plug 'bronson/vim-trailing-whitespace'
"Plug 'thinca/vim-visualstar'              " Search in selection
"Plug 'vim-scripts/YankRing.vim'            " Keep history of yanks
": Writing
Plug 'ron89/thesaurus_query.vim'           " Synonyms
Plug 'brennier/quicktex'                   " Math-equations
Plug 'vim-pandoc/vim-pandoc'               " Pandoc
Plug 'vim-pandoc/vim-pandoc-syntax'        " Pandoc syntax
Plug 'vim-pandoc/vim-pandoc-after'         " Integration with other plugins
Plug 'msprev/unite-bibtex'                 " Bibtex+unite
Plug 'junegunn/limelight.vim'              " Highlighting
Plug 'maksimr/vim-translator'              " Translator
Plug 'reedes/vim-wordy'                    " Word writing tips
Plug 'jamshedvesuna/vim-corpus'            " Word editing
Plug 'vasconcelloslf/vim-interestingwords' " Highlight interesting words
Plug 'tpope/vim-abolish'                   " abbreviate, substitute and coerce
Plug 'reedes/vim-lexical'                  " Spell check
Plug 'junegunn/goyo.vim'                   " dependency for vim-zenroom2
Plug 'vim-scripts/loremipsum'              " Lorem ipsum
Plug 'pct/present.vim'                     " Presentation tool
Plug 'rhysd/vim-grammarous'                " Grammar checker
Plug 'tkhren/vim-fake'                     " Random text generator
Plug 'vim-scripts/VisIncr'                 " Produce increasing/decreasing columns of numbers
Plug 'xavierchow/vim-sequence-diagram'     " Draw sequence diagram
Plug 'davidbeckingsale/writegood.vim'      " Highlight common writing problems
"::---------- DISABLED ----------
"Plug 'suan/vim-instant-markdown'          " Markdown preview
"Plug 'vim-pandoc/vim-criticmarkup'        " Critic markup
"Plug 'rafaqz/citation.vim'                " Citations
"Plug 'beloglazov/vim-online-thesaurus'    " Synonyms
"Plug 'lervag/vimtex'                      " latex
"Plug 'UniCycle'                           " Unicode character cycle
"Plug 'soares/write.vim'                   " Writing-mode
"Plug 'jamestomasino/vim-writingsyntax'    " Adjectives, weasel words, passive language
"Plug 'rlofc/vorg'                         " Plaintext organizer
": Programming
Plug 'sbdchd/neoformat'                    " Format code
Plug 'w0rp/ale'                            " Async linting
Plug 'majutsushi/tagbar'                   " Display tags of window
Plug 'bkad/camelcasemotion'                " camelCaseMotion and snake_case_motion
Plug 'ajh17/vimcompletesme'                " Tabcompletion
Plug 'andrewradev/sideways.vim'            " Move arguments sideways
Plug 'foosoft/vim-argwrap'                 " Wrap/unwrap arguments
Plug 'scrooloose/nerdcommenter'            " Commenting plugin
Plug 'ararslan/license-to-vim'             " Add lincense information
Plug 'tacahiroy/ctrlp-funky'               " Function navigator
Plug 'gabesoft/vim-ags'                    " Silver searcher, find code
Plug 'jiangmiao/auto-pairs'                " Insert pairs of separators
"--> Rust
Plug 'racer-rust/vim-racer'                " Rust completions
Plug 'timonv/vim-cargo'                    " Cargo bindings
"--> C
Plug 'justinmk/vim-syntax-extra'           " Better syntax highlighting for C
"Plug 'vim-scripts/CRefVim'                 " C documentation
"Plug 'hari-rangarajan/cctree'              " C dependency tree
Plug 'vim-scripts/a.vim'                   " Toggle between header and source
"Plug 'ujihisa/quicklearn'                  " Show assembly code from C
"--> C++
Plug 'tenfyzhong/vim-gencode-cpp'          " Generate Declaration/Definition
"--> Java
Plug 'artur-shaik/vim-javacomplete2'       " Java code completion
Plug 'apalmer1377/factorus'                " Java and python automated refactoring
"--> Python
"Plug 'klen/python-mode'                    " Python-mode
"--> Git
Plug 'zivyangll/git-blame.vim'             " Show git-blame
Plug 'cohama/agit.vim'                     " View git log
Plug 'tpope/vim-fugitive'                  " Git wrapper
Plug 'junegunn/vim-github-dashboard'       " Github dashboard
Plug 'airblade/vim-gitgutter'              " Show changes in git
"::---------- DISABLED ----------
"Plug 'yggdroot/hipairs'                    " Show enclosing pairs
"Plug 'joonty/vdebug'                       " Debugging for Python, Ruby, Perl, etc
"Plug 'autozimu/LanguageClient-neovim', {
      "\ 'branch': 'next',
      "\ 'do': 'bash install.sh',
      "\ }                                  " Language Server Protocol
"Plug 'Shougo/deoplete.nvim'                " Completion plugin option 2
"Plug 'natebosch/vim-lsc'                   " Language Server Protocol Client
"Plug 'Shougo/deoplete.nvim'                " Completion
"Plug 'roxma/nvim-yarp'                     " Dependency to deoplete.vim
"Plug 'roxma/vim-hug-neovim-rpc'            " Dependency to deoplete.vim
"Plug 'sebastianmarkow/deoplete-rust'       " deoplete.vim for Rust
"Plug 'gcmt/wildfire.vim'                   " Select closest text object (Bad mappings)
"Plug 'kien/rainbow_parentheses.vim'        " Pretty parentheses
"Plug 'vim-scripts/AutoComplPop'            " Automatically open completion menu
"Plug 'rsslldnphy/vim-exercism'            " Exercises
"Plug 'rip-rip/clang_complete'              " C code-completion
"Plug 'scrooloose/syntastic'               " Syntax checking (Replaced by ALE)
"Plug 'vim-scripts/Conque-GDB'             " GDB support
"Plug 'drmikehenry/vim-headerguard'        " Header guards
"Plug 'gcmt/tube.vim'                      " Macvim + terminal interaction
"Plug 'ervandew/supertab'                  " Code completion
"Plug 'shougo/vimshell.vim'                " Shell in vim
"Plug 'xuyuanp/nerdtree-git-plugin'        " Show git status of files
"Plug 'ryanoasis/vim-devicons'             " Development icons for NERDTree
"Plug 'vim-scripts/toggle_comment'         " Toggle comments
"Plug 'lastsupertim/vimsuperdebug'         " Debugging for C
"Plug 'gilligan/vim-lldb'                  " Debugging for C
"Plug 'vim-scripts/gdbmgr'                 " GDB
"Plug 'ervandew/eclim'                     " Eclipse in Vim
"Plug 'neomake/neomake'                    " Asynchronous syntax checking
"Plug 'gcmt/psearch.vim'                   " Show matching lines in all buffers
"Plug 'andrewradev/splitjoin.vim'          " Toggle single and multi-line code
"Plug 'gilligan/vim-lldb'                  " lldb for vim
"Plug 'maxboisvert/vim-simple-complete'    " Autocompletion
"Plug 'Conque-GDB'                         " GDB
"Plug 'junegunn/tabularize'                " Align equal symbol (=) (Disabled)
"Plug 'nvie/vim-pyunit'                    " Python unit testing
"Plug 'airblade/vim-rooter'                " Change working directory to project root
"Plug 'boundincode/autofilename'           " Autocomplete filenames
"Plug 'keith/investigate.vim'              " Find documentation
"Plug 'flyovergu/cu.vim'                   " Switch between camelCase and snake_case
"Plug 'idanarye/vim-merginal'              " Merge git branches DOES NOT WORK?
"Plug 'int3/vim-extradite'                 " Git commit browser DOES NOT WORK?
"Plug 'vimwiki/vimwiki'                    " Write personal wiki
"Plug 'shijiebei2009/algorithms'           " algorithms - Useful algorithm descriptions
"Plug 'showbrace'                          " Show line of opening brace
"Plug 'wilhelmtell/reimin'                 " :Include files
"Plug 'deonponcini/includefixer'           " Complete #include
"Plug 'git-time-metric/gtm'                " Git time tracking
": Filetype
Plug 'cespare/vim-toml'                    " .toml
"::---------- DISABLED ----------
"Plug 'valloric/matchtagalways'            " .xml/.html
"Plug 'elzr/vim-json'                      " .json
"Plug 'chrisbra/csv.vim'                   " .csv
"Plug 'datsuns/vim-smv'                    " .smv
"Plug 'yakiang/excel.vim'                  " .xls
"Plug 'nessss/vim-gml'                     " .gml
"Plug 'darfink/vim-plist'                  " .plist
"Plug 'wannesm/wmnusmv.vim'                " .nusmv
": Syntax
Plug 'vim-scripts/SyntaxAttr.vim'          " Show :hi attributes
Plug 'sheerun/vim-polyglot'
Plug 'milad14000/vim_p4'
":: DISABLED
"Plug 'TagHighlight'                       " Highlight C typedefs and enums
"Plug 'reinh/vim-makegreen'                " Show if code compiled successfully
"Plug 'luochen1990/rainbow'                " Unlimited parentheses
"Plug 'xaizek/vim-inccomplete'             " Autocomplete #include directives
": Misc
Plug 'qualiabyte/vim-colorstepper'         " Color switcher
Plug 'johngrib/vim-game-code-break'        " Ball breaking game
Plug 'yever/rtl.vim'                       " Change writing direction
Plug 'textlint/textlint'                   " Text linting
Plug 'nixon/vim-vmath'                     " Calculate average, median, etc
Plug 'shougo/vimproc.vim'                  " Asynchronous execution library
Plug 'vim-scripts/DrawIt'                  " Draw lines
Plug 'vim-scripts/TaskList.vim'            " Task management
Plug 'wakatime/vim-wakatime'               " Monitor programming statistics
Plug 't9md/vim-macvim-transparency'        " Macvim window transparency
Plug 'konfekt/fastfold'                    " Reduce performance loss from folding
Plug 'itchyny/calendar.vim'                " Calendar
"::---------- DISABLED ----------
"Plug 'rosenfeld/conque-term'              " Terminal inside vim
"Plug 'vim-scripts/morse.vim'              " Write morse code
"Plug 'mattn/vim-soundcloud'               " Soundcloud plugin for vim
"Plug 'mattn/webapi-vim'                   " Soundcloud dependency
"Plug 'fredkschott/covim'                  " Collaborative editing !!! MAKES VIM CRASH !!!
"Plug 'koron/minimap-vim'                  " Minimap
"Plug 'sunaku/vim-shortcut'                " Search for shortcuts
"Plug 'luchermitte/mu-template'            " Vim templates expander
"Plug 'Floobits/floobits-vim'              " Collaborative editing
"Plug 'sunitha/skypeshell'                 " Skype chat
"Plug 'VimIRC.vim'                         " irc chat
"Plug 'MailApp'                            " mail
"Plug 'deris/vim-duzzle'                   " Game
"Plug 'nakajima/slidedown'                 " Presentation tool
"Plug 'tybenz/vimdeck'                     " Presentation tool
"Plug 'trapd00r/vimpoint'                  " Presentation tool
"Plug 'sorah/presen.vim'                   " Presentation tool
"Plug 'roggan87/vim-bible'                 " Insert bible passages
"Plug 'pantoine/timekeeper'                " Track time spent editing
"Plug 'irrationalistic/vim-tasks'          " Task list
"Plug 'teddywing/auditory.vim'             " Vim sounds
"Plug 'severin-lemaignan/vim-minimap'      " Minimap for vim
": Colorschemes
Plug 'morhetz/gruvbox'
"::---------- DISABLED ----------
"Plug 'hauleth/blame.vim'
"Plug 'xolox/vim-colorscheme-switcher'
"Plug 'xolox/vim-misc'
"Plug 'reedes/vim-thematic'
"Plug 'chriskempson/tomorrow-theme'
"Plug 'noahfrederick/vim-hemisu'
"Plug 'rakr/vim-one'
"Plug 'tpope/vim-vividchalk'
"Plug 'lokaltog/vim-distinguished'
"Plug 'joshdick/onedark.vim'
"Plug 'nlknguyen/papercolor-theme'
"Plug 'vim-scripts/wombat256.vim'
"Plug 'reedes/vim-colors-pencil'
"Plug 'ajh17/spacegray.vim'
"Plug 'noahfrederick/vim-hemisu'
"Plug 'altercation/vim-colors-solarized'
"Plug 'lifepillar/vim-solarized8'
"Plug 'jacoborus/tender'
"Plug 'arcticicestudio/nord-vim'
"Plug 'noahfrederick/vim-noctu'
"Plug 'nielsmadan/harlequin'
"Plug 'roosta/srcery'
"Plug 'reewr/vim-monokai-phoenix'
"Plug 'jeetsukumaran/vim-nefertiti'
"Plug 'davidklsn/vim-sialoquent'
"Plug 'aliou/moriarty.vim'
"Plug 'orthecreedence/void.vim'
"Plug 'xero/blaquemagick.vim'
"Plug 'kocakosm/hilal'
"Plug 'andbar-ru/vim-unicon'
"Plug 'mhallendal/spacedust-theme'
"Plug 'kamwitsta/flatwhite-vim'
"Plug 'kamwitsta/mythos'
"Plug 'vim-scripts/kellys'
"Plug '1995parham/tomorrow-night-vim'
"Plug 'dikiaap/minimalist'
"Plug 'kiddos/malokai.vim'
"Plug 'altercation/vim-colors-solarized'
"Plug 'nanotech/jellybeans.vim'
"Plug 'otaku'
"Plug 'whatyouhide/vim-gotham'
"Plug 'hhsnopek/vim-firewatch'
"Plug 'HiColors'
