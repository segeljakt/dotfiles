require('utils')

-- set('filetype', {'plugin', 'indent', 'on'})
vim.opt.compatible = false
vim.opt.shada = "'1000,n~/.vim/nviminfo"
vim.opt.syntax = 'enable'
vim.opt.dict:append('~/.vim/dict/basic')
vim.opt.background = 'light'
vim.opt.cmdheight = 1
vim.opt.autoread = true -- Automatically read changes
vim.opt.autowriteall = true -- Automatically write when changing file
vim.opt.bufhidden = 'hide' -- Delete buffer when closing window
vim.opt.cindent = true -- Automatic C indentation
vim.opt.cinkeys:remove('0#,:') -- Comments don't fiddle with indenting
vim.opt.cinoptions = 'l1,c0,C0,\0' -- Do not indent switch-cases
vim.opt.concealcursor = '' -- Conceal only when on a different line
vim.opt.conceallevel = 0 -- Replace concealed text with char, if any
vim.opt.cpoptions:remove('aA') -- Read and write shouldn't set #
vim.opt.fileformats = 'unix,mac,dos' -- Handle all, but prefer unix
vim.opt.fileignorecase = false -- Always do the above
vim.opt.fillchars = 'vert:│' -- Borders
vim.opt.guicursor:append('a:blinkon0') -- Disable blinking
vim.opt.scrolloff = 0 -- Show at least X lines above/below cursor
-- vim.opt.display = lastline -- Show as much as possible of paragraphs
vim.opt.guifont = 'Fura Code Regular Nerd Font Complete:h13'
vim.opt.modeline = false -- Do not detect modeline
vim.opt.encoding = 'utf-8' --
vim.opt.swapfile = false -- I've had enough of this
vim.opt.hlsearch = true -- Highlight matches of search
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.incsearch = true -- Highlight pattern while searching
vim.opt.infercase = true -- Adjust completion to match case
vim.opt.laststatus = 2 -- Always show statusline
vim.opt.lazyredraw = true -- Do not redraw while executing macros
vim.opt.linebreak = true -- Break by word instead of char
vim.opt.showmode = false -- Do not bother showing current mode
vim.opt.number = true -- Row numbers
vim.opt.pumheight = 25 -- Only show 25 completion items max
vim.opt.showcmd = true -- Show visual selection
vim.opt.showfulltag = true -- Show full tag when matching from tagfile
vim.opt.showtabline = 2 -- Always show tabline
vim.opt.spelllang = 'en_us' -- We speak American
vim.opt.splitright = true -- Puts splits on right hand side
vim.opt.signcolumn = 'yes' -- Always show signcolumn
vim.opt.tagcase = 'match' -- Case-sensitive tag search
vim.opt.title = false -- Do not display title
vim.opt.titleold = '' -- Do not display title
vim.opt.virtualedit = 'block' -- Select whitespaces
vim.opt.wildignore = '*.class,*.o,*~,*.pyc,.git,*.lock,target,*.out'
vim.opt.wildignorecase = true -- Ignore case when completing filenames
vim.opt.wildmenu = true -- Tabcompletion for commandline
vim.opt.wildcharm = termcode('<Tab>') -- Allow macros to tabcomplete
vim.opt.matchpairs = '(:),{:},[:],<:>,":"' -- Separators
-- vim.opt.wrap = true
if vim.fn.has('mac') then
  vim.opt.shell = '/opt/homebrew/bin/zsh'
else
  vim.opt.shell = '/bin/zsh'
end
vim.opt.shellcmdflag = '-c'
vim.opt.emoji = true -- Emoji characters are full-width
vim.opt.autochdir = false -- Change directory to file in buffer !WARNING!
vim.opt.ttyfast = true -- Faster
vim.opt.winminheight = 0 -- Squeeze win height
vim.opt.winminwidth = 0 -- Squeeze win width
vim.opt.backspace = 'indent,eol,start' -- Allow backspace over indent,eol,start
vim.opt.expandtab = true -- Expand tabs to spaces
vim.opt.tabstop = 2 -- Number of spaces per tab
vim.opt.shiftwidth = 2 -- Number of spaces for each autoindent
vim.opt.softtabstop = 2 -- ?
vim.opt.shiftround = true -- Indent to round number of spaces
vim.opt.preserveindent = true -- Preserve indent structure
vim.opt.undofile = true -- Use persistent undo
vim.opt.undodir = '~/.vimundo' -- Stored here
vim.opt.undolevels = 2000 -- Max number of changes that can be undone
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.grepformat:prepend('%f:%l:%c:%m')
-- vim.opt.foldmethod='expr'             -- manual,indent,expr,marker,syntax,diff
-- vim.opt.foldexpr='nvim_treesitter#foldexpr()'
vim.opt.foldnestmax = 4
vim.opt.updatetime = 100 -- Write to disk after 150 ms
vim.opt.redrawtime = 200 -- timeout for 'hlsearch' and :match highlighting
vim.opt.terse = true -- Shorten messages
vim.opt.belloff = 'all' -- STOP IT
-- vim.opt.verbose                    -- Lengthen messages
vim.opt.whichwrap = 'b,s,h,l' -- Allow these keys to move past EOL
vim.opt.joinspaces = false -- Insert only one space when joining
vim.opt.shortmess = 'aoOstTWAIcF'
vim.opt.completeopt = 'noinsert,menuone,noselect,preview'
vim.opt.formatoptions = 'rownlj'
vim.opt.maxmempattern = 2000000 -- Max memory for pattern matching
vim.opt.nrformats = 'alpha,octal,hex,bin'
vim.opt.selection = 'inclusive'

-- Disabled plugins
let('loaded_matchparen', 1)
let('loaded_matchit', 1)
let('loaded_tarPlugin', 1)
let('loaded_tar', 1)
let('loaded_zipPlugin', 1)
let('loaded_zip', 1)
let('loaded_gzip', 1)
-- let('loaded_netrw', 0)
-- let('loaded_netrwPlugin', 0)
let('loaded_vimballPlugin', 1)
let('loaded_vimball', 1)
let('loaded_logiPat', 1)
let('loaded_getscriptPlugin', 1)
let('loaded_2html_plugin', 1)
let('loaded_rrhelper', 1)
let('loaded_spellfile_plugin', 1)
let('no_pdf_maps', 1)

let('maplocalleader', ',')
let('mapleader', '§')
let('author', 'Klas Segeljakt')
let('email', 'klasseg@kth.se')

cmd('colorscheme PaperColor')
cmd('filetype plugin indent on') -- Detect filetypes
cmd('syn sync minlines=256') -- Less syntax lagging
-- vim.opt.background = 'light'

-- Unmaps
unmap('n', 'Y')

map('n', 'gfs', ':GitGutterStageHunk<CR>')
map('n', 'gp', ':GitGutterPreviewHunk<CR>')
map('n', '´', '/HEAD<CR>')
map('n', 'q', "&ma?':TComment<CR>':''", { expr = true })
map('v', 'q', "&ma?mode()==#'V'?':TComment<CR>':':TCommentInline<CR>':''", { expr = true })
map('n', 'gb', ':Gbrowse<CR>')
map('n', '<C-p>', ':w|RG<CR>')
map('n', '<C-u>', ':History<CR>')
map('n', 'ı', ':w|GitFiles<CR>') --                  <C-i>
map('n', 'Ö', ':ArgWrap<CR>')
map('n', 'Å', ':Bdelete!<CR>')
map('n', 'ü', ':PlugUpdate<CR>') --                  <M-u>
map('n', '<C-H>', ':SidewaysLeft<CR>')
map('n', '<C-L>', ':SidewaysRight<CR>')
map('n', '<F5>', ':UndotreeToggle<CR>')
map('n', '<C-o>', ':call GoBackToRecentBuffer()<CR>')
map('n', '→', ':call ToggleDrawIt()<CR>')
-- map('n', '<C-w>m', ':WinResizerStartMove<CR>', { }, true)
map('x', '?', "mode()=~'V' ? ':Tabularize' : '?'", { expr = true })
map('n', 't', '<Plug>(coc-definition)')
map('n', '<C-t>', '<C-^>')
map('i', '<C-p>', '|>') -- OCAML
map('i', '<C-o>', '->') -- OCAML
map('i', 'ı', '|') --
map('n', 'K', ":call CocAction('doHover')<CR>")
map('n', '*', '*N') --
map('n', 'ca', ':CocAction<CR>')
map('n', 'cd', ':CocFix<CR>')
map('n', '⁄', ':call CocAction("fold")<CR>') -- <D-z>
map('n', ';', '<Plug>(coc-range-select)')
map('x', ';', '<Plug>(coc-range-select)')
map('n', ':', '<Plug>(coc-range-select-backward)')
map('x', ':', '<Plug>(coc-range-select-backward)')
map('n', '-', ':noa w<CR>')
map('n', 'gm', '<Plug>(git-messenger)')
map('n', 'Ω', '<Plug>(coc-refactor)') -- <D-w>
map('n', 'É', '<Plug>(coc-references)') -- <D-e>
map('n', '√', '<Plug>(coc-rename)') -- <D-r>
map('v', '√', '<Plug>NameAssign') -- <D-r>
map('n', 'Θ', '<Plug>(coc-declaration)') -- <D-t>
map('n', 'Ü', '<Plug>(coc-type-definition)') -- <D-u>
map('n', 'ˆ', '<Plug>(coc-implementation)') -- <D-i>
map('n', 'Σ', '<Plug>(coc-format-selected)') -- <D-s>
map('n', '+', '<Plug>(coc-format)')
map('v', '◊', '<Plug>(coc-codeaction-selected)') -- <D-a>
map('n', '◊', '<Plug>(coc-codeaction)') -- <D-a>
map('n', 'Δ', '<Plug>(coc-format-selected)') -- <D-d>
map('v', 'Δ', '<Plug>(coc-format-selected)') -- <D-d>
map('n', 'M', '<Plug>(coc-fix-current)')
map('n', 'Λ', '<Plug>(coc-codelens-action)') -- <D-l>
-- map('n', 'k', ':CocList symbols<CR>')
map('n', 'cl', ':CocList diagnostics<CR>')
map('n', 'cq', ':CocCommand <Tab>')
map('n', 'cm', ':CocCommand rust-analyzer.<Tab><S-Tab>')
map('n', 'c,', ':cd %:p:h|pwd<CR>')
map('n', '↦', ':Lines<CR>') -- <D-ö>
map('n', 'cx', ':CocCommand rust-analyzer.runSingle<CR>')
map('n', 'co', ':CocCommand explorer<CR>')
map('n', '“', ':CocCommand document.jumpToNextSymbol<CR>') -- <S-C-n>
map('n', '”', ':CocCommand document.jumpToPrevSymbol<CR>') -- <S-C-b>
map('n', 'Ç', ':CocCommand editor.action.organizeImport<CR>') -- <D-c>
map('n', 'Φ', ':CocList <CR>') -- <D-o>
map('n', '»', ':CocRestart<CR>') -- <D-b>
map('x', 'if', '<Plug>(coc-funcobj-i)')
map('x', 'af', '<Plug>(coc-funcobj-a)')
map('o', 'if', '<Plug>(coc-funcobj-i)')
map('o', 'af', '<Plug>(coc-funcobj-a)')
map('x', '<TAB>', '<Plug>(coc-range-select)')
map('i', '<C-Space>', 'coc#refresh()', { expr = true })
map('i', '<C-Space>', 'coc#refresh()', { expr = true })



let('conjoin_map_J', '<Leader>z')
-- map('" nno          cj           :CocList outline<CR>
