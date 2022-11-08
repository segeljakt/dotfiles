vim.opt.compatible = false -- Don't be compatible

require('utils')

vim.cmd('source ~/.vim/vimrc')
vim.cmd('source ~/.vim/plugin-conf.vim')

vim.cmd('let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1')
vim.opt.runtimepath:append(vim.fn.expand('~/.vim'))
vim.opt.runtimepath:append(vim.fn.expand('~/.vim/after'))
-- vim.opt.packpath = vim.opt.runtimepath

require('plugins')

-- set('filetype', {'plugin', 'indent', 'on'})
vim.diagnostic.config {
  virtual_text = false,
  signs = false,
  underline = false,
  update_in_insert = true,
}
vim.opt.autochdir = false -- Change directory to file in buffer !WARNING!
vim.opt.autoread = true -- Automatically read changes
vim.opt.autoindent = true -- Copy indent from current line
vim.opt.autowriteall = true -- Automatically write when changing file
vim.opt.background = 'light'
vim.opt.backspace = 'indent,eol,start' -- Allow backspace over indent,eol,start
vim.opt.belloff = 'all' -- STOP IT
vim.opt.bufhidden = 'hide' -- Delete buffer when closing window
vim.opt.buflisted = true -- Show in buffer list
vim.opt.breakindent = true -- Indent wrapped lines
vim.opt.cdhome = true -- Change directory to home when opening vim
vim.opt.cindent = true -- Automatic C indentation
vim.opt.cinkeys:remove('0#,:') -- Comments don't fiddle with indenting
vim.opt.cinoptions = 'l1,c0,C0,\0' -- Do not indent switch-cases
vim.opt.cmdheight = 1 -- Height of command line
vim.opt.completeopt = 'noinsert,menuone,noselect,preview'
vim.opt.concealcursor = '' -- Conceal only when on a different line
vim.opt.conceallevel = 0 -- Replace concealed text with char, if any
vim.opt.cpoptions:remove('aA') -- Read and write shouldn't set #
vim.opt.dict:append(vim.fn.expand('~/.vim/dict/basic'))
vim.opt.diffopt = 'iwhite,internal,filler,closeoff,vertical,algorithm:patience'
vim.opt.display = 'lastline' -- Show as much as possible of paragraphs
vim.opt.emoji = true -- Emoji characters are full-width
vim.opt.encoding = 'utf-8' --
vim.opt.expandtab = true -- Expand tabs to spaces
vim.opt.fileformats = 'unix,mac,dos' -- Handle all, but prefer unix
vim.opt.fileignorecase = false -- Always do the above
-- vim.opt.foldexpr='nvim_treesitter#foldexpr()'
vim.opt.foldnestmax = 4
-- vim.opt.foldmethod='expr'             -- manual,indent,expr,marker,syntax,diff
vim.opt.formatoptions = 'rownlj'
vim.opt.grepformat:prepend('%f:%l:%c:%m')
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.guicursor:append('a:blinkon0') -- Disable blinking
vim.opt.guifont = 'Fura Code Regular Nerd Font Complete:h13'
vim.opt.hlsearch = true -- Highlight matches of search
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.incsearch = true -- Highlight pattern while searching
vim.opt.infercase = true -- Adjust completion to match case
vim.opt.joinspaces = false -- Insert only one space when joining
vim.opt.laststatus = 2 -- Always show statusline
vim.opt.lazyredraw = true -- Do not redraw while executing macros
vim.opt.linebreak = true -- Break by word instead of char
vim.opt.matchpairs = '(:),{:},[:],<:>,":"' -- Separators
vim.opt.maxmempattern = 2000000 -- Max memory for pattern matching
vim.opt.modeline = false -- Do not detect modeline
vim.opt.nrformats = 'alpha,octal,hex,bin'
vim.opt.number = true -- Row numbers
vim.opt.preserveindent = true -- Preserve indent structure
vim.opt.pumheight = 25 -- Only show 25 completion items max
vim.opt.redrawtime = 200 -- timeout for 'hlsearch' and :match highlighting
vim.opt.scrolloff = 0 -- Show at least X lines above/below cursor
vim.opt.selection = 'inclusive'
vim.opt.shada = "'1000,n" .. vim.fn.expand('~/.vim/nviminfo')
vim.opt.shell = '/opt/homebrew/bin/zsh'
vim.opt.shellcmdflag = '-c'
vim.opt.shiftround = true -- Indent to round number of spaces
vim.opt.shiftwidth = 2 -- Number of spaces for each autoindent
vim.opt.shortmess = 'aoOstTWAIcF'
vim.opt.showcmd = true -- Show visual selection
vim.opt.showfulltag = true -- Show full tag when matching from tagfile
vim.opt.showmode = false -- Do not bother showing current mode
vim.opt.showtabline = 2 -- Always show tabline
vim.opt.signcolumn = 'yes' -- Always show signcolumn
vim.opt.softtabstop = 2 -- ?
-- vim.opt.spell = true -- Spell check
vim.opt.spelllang = 'en_us' -- We speak American
vim.opt.splitright = true -- Puts splits on right hand side
vim.opt.swapfile = false -- I've had enough of this
vim.opt.syntax = 'enable'
vim.opt.tabstop = 2 -- Number of spaces per tab
vim.opt.tagcase = 'match' -- Case-sensitive tag search
-- vim.opt.terse = true -- Shorten messages
vim.opt.title = false -- Do not display title
vim.opt.titleold = '' -- Do not display title
vim.opt.ttyfast = true -- Faster
vim.opt.undodir = vim.fn.expand('~/.vimundo') -- Stored here
vim.opt.undofile = true -- Use persistent undo
vim.opt.undolevels = 2000 -- Max number of changes that can be undone
vim.opt.updatetime = 100 -- Write to disk after 150 ms
-- vim.opt.verbose                    -- Lengthen messages
vim.opt.virtualedit = 'block' -- Select whitespaces
vim.opt.whichwrap = 'b,s,h,l' -- Allow these keys to move past EOL
vim.opt.wildcharm = string.byte(termcode('<Tab>')) -- Allow macros to tabcomplete
vim.opt.wildignore = '*.class,*.o,*~,*.pyc,.git,*.lock,target,*.out'
vim.opt.wildignorecase = true -- Ignore case when completing filenames
vim.opt.wildmenu = true -- Tabcompletion for commandline
vim.opt.winminheight = 0 -- Squeeze win height
vim.opt.winminwidth = 0 -- Squeeze win width
-- vim.opt.wrap = true

-- vim.opt.spell = false

-- Disabled plugins
vim.api.nvim_set_var('loaded_matchparen', 1)
vim.api.nvim_set_var('loaded_matchit', 1)
vim.api.nvim_set_var('loaded_tarPlugin', 1)
vim.api.nvim_set_var('loaded_tar', 1)
vim.api.nvim_set_var('loaded_zipPlugin', 1)
vim.api.nvim_set_var('loaded_zip', 1)
vim.api.nvim_set_var('loaded_gzip', 1)
-- vim.api.nvim_set_var('loaded_netrw', 0)
-- vim.api.nvim_set_var('loaded_netrwPlugin', 0)
vim.api.nvim_set_var('loaded_vimballPlugin', 1)
vim.api.nvim_set_var('loaded_vimball', 1)
vim.api.nvim_set_var('loaded_logiPat', 1)
vim.api.nvim_set_var('loaded_getscriptPlugin', 1)
vim.api.nvim_set_var('loaded_2html_plugin', 1)
vim.api.nvim_set_var('loaded_rrhelper', 1)
vim.api.nvim_set_var('loaded_spellfile_plugin', 1)
vim.api.nvim_set_var('no_pdf_maps', 1)

vim.api.nvim_set_var('maplocalleader', ',')
vim.api.nvim_set_var('mapleader', '§')
vim.api.nvim_set_var('author', 'Klas Segeljakt')
vim.api.nvim_set_var('email', 'klasseg@kth.se')
vim.api.nvim_set_var('conjoin_map_J', '<Leader>z')

vim.cmd('colorscheme PaperColor')
vim.cmd('filetype plugin indent on') -- Detect filetypes
vim.cmd('syn sync minlines=256') -- Less syntax lagging
-- vim.opt.background = 'light'

map('n', 'c,', ':cd %:p:h|pwd<CR>')
-- map('n', 'Ç', ':CocCommand editor.action.organizeImport<CR>') -- <D-c>
-- map('n', '∏', ':CocConfig<CR>') -- <M-P>
map('n', '´', '/HEAD<CR>')
map('n', 'q', '<Plug>(comment_toggle_linewise_current)', { noremap = false })
map('v', 'q', '<Plug>(comment_toggle_linewise_visual)', { noremap = false })
-- map('n', '<C-p>', ':w|RG<CR>')
-- map('n', '<C-u>', ':History<CR>')
map('n', '<C-g>v', ':GH<CR>')
map('n', 'ı', ':Telescope git_files<CR>')
map('n', '<C-u>', ':Telescope oldfiles<CR>')
map('n', '<C-p>', ':Telescope live_grep<CR>')
map('n', '<C-Space>', ':Telescope buffers<CR>')
-- map('n', 'ı', ':w|GitFiles<CR>') -- <C-i>
map('n', 'ª', ':ArgWrap<CR>')
map('n', 'Å', ':Bdelete!<CR>')
map('n', 'ü', ':PlugUpdate<CR>') -- <M-u>
map('n', '<C-H>', ':SidewaysLeft<CR>')
map('n', '<C-L>', ':SidewaysRight<CR>')
map('n', '<F5>', ':UndotreeToggle<CR>')
map('n', '<C-o>', ':call GoBackToRecentBuffer()<CR>zz')
-- map('n', '<C-w>m', ':WinResizerStartMove<CR>', { }, true)
map('x', '?', "mode()=~'V' ? ':Tabularize' : '?'", { expr = true })
map('n', '<C-t>', '<C-^>')
map('i', '<C-p>', '|> ') -- OCAML
map('i', '<C-o>', '-> ') -- OCAML
map('i', 'ı', '| ')
map('n', '<C-w>+', ':tab split<CR>')
map('n', '<C-w>-', '<C-w><C-q>')
map('v', 'E', '<C-y>')
map('n', '*', '*N')
map('v', '(', 'sa(i', { noremap = false })
map('v', ')', 'sa)i', { noremap = false })
map('n', '-', ':noa w<CR>')
map('v', 'H', '<Plug>SchleppLeft', { noremap = false })
map('v', 'J', '<Plug>SchleppDown', { noremap = false })
map('v', 'K', '<Plug>SchleppUp', { noremap = false })
map('v', 'L', '<Plug>SchleppRight', { noremap = false })
map('v', 'D', '<Plug>SchleppDup', { noremap = false })
map('v', 'D', '<Plug>SchleppDup', { noremap = false })
map('i', '<BS>', '<Plug>(PearTreeBackspace)', { noremap = false })
-- map('i', '<CR>', '<Plug>(PearTreeExpand)', { noremap = false })
map('i', '<Esc>', '<Plug>(PearTreeFinishExpansion)', { noremap = false })
map('i', '<C-c>', '<Plug>(PearTreeFinishExpansion)', { noremap = false })
-- map('i', '<C-e>', '<Plug>(PearTreeJump)', { noremap = false })
map('', 'w', '<Plug>CamelCaseMotion_w', { noremap = false })
map('', 'b', '<Plug>CamelCaseMotion_b', { noremap = false })
map('', 'e', '<Plug>CamelCaseMotion_e', { noremap = false })
map('', 'ge', '<Plug>CamelCaseMotion_ge', { noremap = false })
map('v', 'Ç', '"+y') -- <D-S-c>

-- Fixes
map('n', '<Tab>', "col('$') == 1? 'i<Tab>' : '>>'", { expr = true })
map('v', 'A', "mode()=~'v' ? '$h' : 'A'", { expr = true })
map('n', '<C-q>', 'q') -- " Record with <C-q>
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', 'R', 'gR')
map('n', '<S-Tab>', '<<')
map('v', '<Tab>', '>gv')
map('v', '<S-Tab>', '<gv')
map('v', 'P', '"_dp') -- " No yank on paste
map('v', 'p', '"_dP')
map('v', '<BS>', '<BS>') -- " Fix defaults
map('n', '<C-c>', '<Esc>')
map('n', 'gn', ':cnext<CR>')
map('n', 'gN', ':cNext<CR>')

-- Overrides
map('n', 'C', "':%s/'.@/.'//g<Left><Left>'", { expr = true })
map('x', 'C', "':s/'.@/.'//g<Left><Left>'", { expr = true })
map('n', 'D', '"Add')
map('n', 'B', '^') -- Go to start of line
map('n', 'E', '<C-y>') -- Scroll up
map('n', '<Space>', ':')
map('v', '<Space>', ':')
map('i', '<C-h>', '<Left>') -- Move in insert mode
map('i', '<C-l>', '<Right>')
map('n', '!', ':!')
map('n', '<C-d>', ':x<CR>')
map('n', 'S', ':%s//g<Left><Left>')
map('n', '<C-n>', 'gt') -- Tab page management
map('n', '<C-b>', 'gT')
map('n', 'gt', ':tabnew<CR>')
map('n', 'gj', ':bnext<CR>')
map('n', '<C-CR>', 'kk<CR>') -- Reverse <CR>

-- Disabled
map('c', '<Up>', '<Nop>')
map('c', '<Down>', '<Nop>')
map('c', '<Left>', '<Nop>')
map('c', '<Right>', '<Nop>')
map('n', '<Right>', 'i<Right>')
map('n', '<Left>', 'i<Left>')
map('n', '<Up>', 'i<Up>')
map('n', '<Down>', 'i<Down>')

---- Command line
map('c', '<C-c>', '<C-u><C-c>')
map('c', '<C-h>', '<Left>')
map('c', '<C-l>', '<Right>')
map('c', '<C-k>', '<Up>')
map('c', '<C-j>', '<Down>')
map('c', '<C-b>', '<S-Left><Left>')
map('c', '<C-e>', '<S-Right>')
map('c', '<C-v>', '<C-r><C-l>')
map('c', '<C-f>', '<C-\\>e')

--Toggles / Sliders
map('n', '<Leader>b', ':set ri!<CR>') -- Write backwards
map('n', '<Leader>dd', ':set diff!<CR>') -- Diff mode
map('n', '<Leader>l', ':set cursorbind! scrollbind!<CR>') -- Bind cursor/scroll
map('n', 'cu', 'gg=G``') -- Format file
map('n', 'gl', '<C-w>TgT') -- Move to new tab

-- Commands
map('n', 'cn', ':cn<CR>')
map('n', 'cN', ':cN<CR>')
map('n', 'å', ':x<CR>')
map('n', 'ä', ':%s/\\s\\+$//e<CR>') -- Remove whitespaces
map('n', '<D-i>', ':terminal ++close<CR>') -- Terminal
map('n', '<D-b>', ':!cargo build<CR>') -- Cargo
map('n', '<D-r>', ':!cargo run<CR>')
map('n', '<D-c>', ':!cargo clean<CR>')
map('n', '<D-d>', ':!cargo doc --open<CR>')
map('n', '<D-f>', ':!cargo test<CR>')
map('n', '<D-e>', ':!cargo search ')
map('n', '<D-x>', ':!cargo check<CR>')
map('n', '<D-z>', ':!cargo bench<CR>')

-- Macros
map('n', '®', '<C-q>') -- <M-r>
map('n', '©', '@1') -- <M-1>

-- File shortcuts
map('n', 'π', ':tab drop ~/.config/nvim/lua/plugins.lua<CR>') -- <M-p>
map('n', '→', ':tab drop ~/.config/nvim/init.lua<CR>')
map('n', '⊢', ':tab drop ~/.vim/vimrc<CR>') -- <M-ä>
map('n', 'Æ', ':tab drop ~/.gvimrc<CR>') -- <M-Ä>
map('n', 'ø', ':tab drop ~/.vim/bibtex/library.bib<CR>') -- <M-ö>

-- Unmaps
unmap('n', 'Y')
unmap('s', 'w')
unmap('s', 'b')
unmap('s', 'e')
unmap('s', 'ge')

-- Syntax
-- hl('ColorColumn', { ctermfg = 'Red', ctermbg = 'lightred' })
hl('Pmenu', { ctermbg = 253, ctermfg = 16 })
-- map('" nno          cj           :CocList outline<CR>
-- Spell correction / Abbreviations
vim.cmd('iab retrun return')
vim.cmd('iab pritn print')
vim.cmd('iab teh the')
vim.cmd('iab liek like')
vim.cmd('iab liekwise likewise')
vim.cmd('iab moer more')
vim.cmd('iab previosu previous')
vim.cmd('iab pset pest')

-- Autocmd
local group = vim.api.nvim_create_augroup('AutoCommands', { clear = true })

function Autocmd(event, pattern, command)
  vim.api.nvim_create_autocmd(event, { pattern = pattern, group = group, command = command })
end

-- Return to last position when opening file
Autocmd('BufReadPost', '*', 'if line("\'\\"") > 1 && line("\'\\"") <= line("$") | exe "normal! g\'\\"" | en')
-- Autocmd('TabLeave', '*', 'silent! w')
Autocmd('BufRead,BufNewFile', '*.mlir', 'set filetype=mlir syntax=llvm')
Autocmd('BufRead,BufNewFile', '*.lalrpop', 'set syntax=rust')
Autocmd('BufRead,BufNewFile', '*.sbt', 'set syntax=scala')
Autocmd('BufRead,BufNewFile', '*.arc', 'set filetype=arc')
-- Autocmd('User', 'CocJumpPlaceholder', 'call CocActionAsync(\"showSignatureHelp\")')
-- Autocmd('CursorHold', '*', 'silent call CocActionAsync("highlight")')
Autocmd('BufEnter', '*', 'silent! lcd %:p:h')
Autocmd('BufWritePost', 'plugins.lua', 'source <afile> | PackerCompile')
