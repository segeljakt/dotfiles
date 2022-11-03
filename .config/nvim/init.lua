require('utils')

local cmd = vim.cmd
local let = vim.api.nvim_set_var

cmd('source ~/.vim/vimrc')
cmd('source ~/.vim/plugin-conf.vim')

cmd('let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1')
vim.opt.runtimepath:append(vim.fn.expand('~/.vim'))
vim.opt.runtimepath:append(vim.fn.expand('~/.vim/after'))
-- vim.opt.packpath = vim.opt.runtimepath

require('plugins')

-- set('filetype', {'plugin', 'indent', 'on'})
vim.opt.compatible = false
vim.opt.shada = "'1000,n" .. vim.fn.expand('~/.vim/nviminfo')
vim.opt.syntax = 'enable'
vim.opt.dict:append(vim.fn.expand('~/.vim/dict/basic'))
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
vim.opt.wildcharm = string.byte(termcode('<Tab>')) -- Allow macros to tabcomplete
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
vim.opt.undodir = vim.fn.expand('~/.vimundo') -- Stored here
vim.opt.undolevels = 2000 -- Max number of changes that can be undone
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.grepformat:prepend('%f:%l:%c:%m')
-- vim.opt.foldmethod='expr'             -- manual,indent,expr,marker,syntax,diff
-- vim.opt.foldexpr='nvim_treesitter#foldexpr()'
vim.opt.foldnestmax = 4
vim.opt.updatetime = 100 -- Write to disk after 150 ms
vim.opt.redrawtime = 200 -- timeout for 'hlsearch' and :match highlighting
--vim.opt.terse = true -- Shorten messages
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
let('conjoin_map_J', '<Leader>z')

cmd('colorscheme PaperColor')
cmd('filetype plugin indent on') -- Detect filetypes
cmd('syn sync minlines=256') -- Less syntax lagging
-- vim.opt.background = 'light'

-- map('i', '¬', 'coc#float#has_scroll() ? coc#float#scroll(1) : "\\<Right>"', { nowait = true, expr = true })
-- map('i', 'º', 'coc#float#has_scroll() ? coc#float#scroll(0) : "\\<Left>"', { nowait = true, expr = true })
map('i', '¬', 'coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\\<C-f>"', { nowait = true, expr = true })
map('i', 'º', 'coc#float#has_scroll() ? coc#float#scroll(0, 1) : "\\<C-b>"', { nowait = true, expr = true })
-- map('i', '<CR>', 'complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"', {expr=true,silent=true})
map('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"',
  { expr = true, silent = true })
map('i', '<Tab>', 'coc#pum#visible() ? coc#pum#next(1): CheckBackspace() ? "\\<Tab>" : coc#refresh()',
  { expr = true, silent = true })
map('i', '<S-Tab>', 'coc#pum#visible() ? coc#pum#prev(1) : "\\<C-h>"', { expr = true, silent = true })
map('i', '<C-j>', 'coc#pum#visible() ? coc#pum#next(0) : "j"', { expr = true, silent = true })
map('i', '<C-k>', 'coc#pum#visible() ? coc#pum#prev(0) : "k"', { expr = true, silent = true })
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
map('n', 't', '<Plug>(coc-definition)', { noremap = false })
map('n', '<C-t>', '<C-^>')
map('i', '<C-p>', '|> ') -- OCAML
map('i', '<C-o>', '-> ') -- OCAML
map('i', 'ı', '| ')
map('n', '<C-w>+', ':tab split<CR>')
map('n', '<C-w>-', '<C-w><C-q>')
map('n', 'K', ':call CocAction("definitionHover")<CR>')
map('n', 'ck', ':CocRestart<CR>')
map('v', 'E', '<C-y>')
map('n', '*', '*N')
map('v', '(', 'sa(i', { noremap = false })
map('v', ')', 'sa)i', { noremap = false })
map('n', 'cd', ':CocFix<CR>')
map('n', '⁄', ':call CocAction("fold")<CR>') -- <D-z>
map('n', ';', '<Plug>(coc-range-select)', { noremap = false })
map('x', ';', '<Plug>(coc-range-select)', { noremap = false })
map('n', ':', '<Plug>(coc-range-select-backward)', { noremap = false })
map('x', ':', '<Plug>(coc-range-select-backward)', { noremap = false })
map('n', '-', ':noa w<CR>')
map('n', 'gm', '<Plug>(git-messenger)', { noremap = false })
map('n', 'Ω', '<Plug>(coc-refactor)', { noremap = false }) -- <D-w>
map('n', 'É', '<Plug>(coc-references)', { noremap = false }) -- <D-e>
map('n', '√', '<Plug>(coc-rename)', { noremap = false }) -- <D-r>
map('n', 'Θ', '<Plug>(coc-declaration)', { noremap = false }) -- <D-t>
map('n', 'Ü', '<Plug>(coc-type-definition)', { noremap = false }) -- <D-u>
map('n', 'ˆ', '<Plug>(coc-implementation)', { noremap = false }) -- <D-i>
map('n', 'Σ', '<Plug>(coc-format-selected)', { noremap = false }) -- <D-s>
map('n', '+', '<Plug>(coc-format)', { noremap = false })
map('v', '◊', '<Plug>(coc-codeaction-selected)', { noremap = false }) -- <D-a>
map('n', 'ca', '<Plug>(coc-codeaction-cursor)', { noremap = false })
map('n', 'Δ', '<Plug>(coc-format-selected)', { noremap = false }) -- <D-d>
map('v', 'Δ', '<Plug>(coc-format-selected)', { noremap = false }) -- <D-d>
map('n', 'M', '<Plug>(coc-fix-current)', { noremap = false })
map('n', 'Λ', '<Plug>(coc-codelens-action)', { noremap = false }) -- <D-l>
-- map('n', 'k', ':CocList symbols<CR>', {noremap=false})
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
-- map('n', 'Φ', ':CocList <CR>') -- <D-o>
map('x', 'if', '<Plug>(coc-funcobj-i)', { noremap = false })
map('x', 'af', '<Plug>(coc-funcobj-a)', { noremap = false })
map('o', 'if', '<Plug>(coc-funcobj-i)', { noremap = false })
map('o', 'af', '<Plug>(coc-funcobj-a)', { noremap = false })
map('x', '<Tab>', '<Plug>(coc-range-select)')
map('i', '<C-Space>', 'coc#refresh()', { expr = true })
map('i', '<C-Space>', 'coc#refresh()', { expr = true })
map('v', 'H', '<Plug>SchleppLeft', { noremap = false })
map('v', 'J', '<Plug>SchleppDown', { noremap = false })
map('v', 'K', '<Plug>SchleppUp', { noremap = false })
map('v', 'L', '<Plug>SchleppRight', { noremap = false })
map('v', 'D', '<Plug>SchleppDup', { noremap = false })
map('v', 'D', '<Plug>SchleppDup', { noremap = false })
map('n', '<C-k>', '<Plug>(coc-diagnostic-prev)', { noremap = false })
map('n', '<C-j>', '<Plug>(coc-diagnostic-next)', { noremap = false })
map('i', '<BS>', '<Plug>(PearTreeBackspace)', { noremap = false })
-- map('i', '<CR>', '<Plug>(PearTreeExpand)', { noremap = false })
map('i', '<Esc>', '<Plug>(PearTreeFinishExpansion)', { noremap = false })
map('i', '<C-c>', '<Plug>(PearTreeFinishExpansion)', { noremap = false })
map('i', '<C-e>', '<Plug>(PearTreeJump)', { noremap = false })
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
map('n', '∏', ':CocConfig<CR>') -- <M-P>
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
hl('ColorColumn', { ctermfg = 'Red', ctermbg = 'lightred' })
hl('CocError', { ctermbg = 210 })
hl('CocWarning', { ctermbg = 216 })
hl('CocInfo', { ctermbg = 200 })
hl('CocHint', { ctermbg = 226, cterm = { italic = true } })
hl('Pmenu', { ctermbg = 253, ctermfg = 16 })

vim.cmd('hi link CocNotificationProgress CocInfo')

-- vim.cmd('hi link CocErrorLine CocError')
-- vim.cmd('hi link CocWarningLine CocWarning')
-- vim.cmd('hi link CocInfoLine CocInfo')
-- vim.cmd('hi link CocHintLine CocHint')
--
-- vim.cmd('hi link CocErrorHighlight CocError')
-- vim.cmd('hi link CocWarningHighlight CocWarning')
-- vim.cmd('hi link CocInfoHighlight CocInfo')
-- vim.cmd('hi link CocHintHighlight CocHint')
--
vim.cmd('hi CocMenuSel ctermfg=white ctermbg=0 guibg=#13354A')
-- vim.cmd('hi link CocErrorSign CocError')
-- vim.cmd('hi link CocWarningSign CocWarning')
-- vim.cmd('hi link CocInfoSign CocInfo')
-- vim.cmd('hi link CocHintSign CocHint')
--
-- vim.cmd('hi link CocErrorVirtualText CocError')
-- vim.cmd('hi link CocWarningVirtualText CocWarning')
-- vim.cmd('hi link CocInfoVirtualText CocInfo')
-- vim.cmd('hi link CocHintVirtualText CocHint')
--
-- vim.cmd('hi link CocFloating CocError')
-- vim.cmd('hi link CocErrorFloat CocError')
-- vim.cmd('hi link CocWarningFloat CocWarning')
-- vim.cmd('hi link CocInfoFloat CocInfo')
-- vim.cmd('hi link CocHintFloat CocHint')
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
local aug = vim.api.nvim_create_augroup('AutoCommands', { clear = true })

function autocmd(event, pattern, command)
  vim.api.nvim_create_autocmd(event, { pattern = pattern, group = aug, command = command })
end

-- Return to last position when opening file
autocmd('BufReadPost', '*', 'if line("\'\\"") > 1 && line("\'\\"") <= line("$") | exe "normal! g\'\\"" | en')
-- autocmd('TabLeave', '*', 'silent! w')
autocmd('BufRead,BufNewFile', '*.mlir', 'set filetype=mlir syntax=llvm')
autocmd('BufRead,BufNewFile', '*.lalrpop', 'set syntax=rust')
autocmd('BufRead,BufNewFile', '*.sbt', 'set syntax=scala')
autocmd('BufRead,BufNewFile', '*.arc', 'set filetype=arc')
autocmd('User', 'CocJumpPlaceholder', 'call CocActionAsync(\"showSignatureHelp\")')
-- autocmd('CursorHold', '*', 'silent call CocActionAsync("highlight")')
autocmd('BufEnter', '*', 'silent! lcd %:p:h')
