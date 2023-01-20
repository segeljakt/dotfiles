vim.opt.compatible = false -- Don't be compatible

require('plugins')

vim.cmd('filetype plugin indent on') -- Detect filetypes
vim.cmd('syn sync minlines=256') -- Less syntax lagging

-- vim.opt.t_ti = "\\<Esc>[?47h"
-- vim.opt.t_te = "\\<Esc>[?47l"
vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = true,
}
vim.opt.autochdir = false -- Change directory to file in buffer !WARNING!
vim.opt.autoread = true -- Automatically read changes
vim.opt.autoindent = true -- Copy indent from current line
vim.opt.autowriteall = true -- Automatically write when changing file
vim.opt.backspace = 'indent,eol,start' -- Allow backspace over indent,eol,start
vim.opt.belloff = 'all' -- STOP IT
vim.opt.bufhidden = 'hide' -- Delete buffer when closing window
vim.opt.buflisted = true -- Show in buffer list
vim.opt.breakindent = true -- Indent wrapped lines
vim.opt.cdhome = true -- Change directory to home when opening vim
-- vim.opt.cindent = true -- Automatic C indentation
vim.opt.cinkeys:remove('0#,:') -- Comments don't fiddle with indenting
vim.opt.cinoptions = 'l1,c0,C0,\0' -- Do not indent switch-cases
vim.opt.cmdheight = 1 -- Height of command line
vim.opt.completeopt = 'noinsert,menuone,noselect,preview'
vim.opt.concealcursor = '' -- Conceal only when on a different line
vim.opt.conceallevel = 0 -- Replace concealed text with char, if any
vim.opt.cpoptions:remove('aA') -- Read and write shouldn't set #
vim.opt.dict:append(vim.fn.expand('~/.config/nvim/dict/basic'))
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
vim.opt.jumpoptions = 'stack' -- Jump to previous location
vim.opt.laststatus = 2 -- Always show statusline
vim.opt.shiftwidth = 2 -- Shift width
-- vim.opt.lazyredraw = true -- Do not redraw while executing macros
vim.opt.linebreak = true -- Break by word instead of char
vim.opt.matchpairs = '(:),{:},[:],<:>,":"' -- Separators
vim.opt.maxmempattern = 2000000 -- Max memory for pattern matching
vim.opt.modeline = false -- Do not detect modeline
vim.opt.nrformats = 'alpha,octal,hex,bin'
vim.opt.number = true -- Row numbers
vim.opt.preserveindent = true -- Preserve indent structure
vim.opt.pumheight = 25 -- Only show 25 completion items max
vim.opt.redrawtime = 200 -- timeout for 'hlsearch' and :match highlighting
vim.opt.scrollback = 100000 -- Scrollback lines
vim.opt.scrolloff = 0 -- Show at least X lines above/below cursor
vim.opt.selection = 'inclusive'
vim.opt.shada = "'1000,n" .. vim.fn.expand('~/.vim/nviminfo')
vim.opt.shell = '/opt/homebrew/bin/zsh'
vim.opt.shellcmdflag = '-c'
vim.opt.shiftround = true -- Indent to round number of spaces
vim.opt.shortmess = 'aoOstTWAIcF'
vim.opt.showbreak = '' -- No break symbol
vim.opt.showcmd = true -- Show visual selection
vim.opt.showfulltag = true -- Show full tag when matching from tagfile
vim.opt.showmode = false -- Do not bother showing current mode
vim.opt.showtabline = 2 -- Always show tabline
vim.opt.signcolumn = 'yes' -- Always show signcolumn
-- vim.opt.smarttab = true
vim.opt.softtabstop = 2 -- ?
vim.opt.spelllang = 'en_us' -- We speak American
vim.opt.splitright = true -- Puts splits on right hand side
vim.opt.swapfile = false -- I've had enough of this
vim.opt.syntax = 'enable'
vim.opt.synmaxcol = 0 -- Don't limit syntax highlighting
vim.opt.tabstop = 2 -- Number of spaces per tab
vim.opt.tagcase = 'match' -- Case-sensitive tag search
vim.opt.title = false -- Do not display title
vim.opt.titleold = '' -- Do not display title
vim.opt.ttyfast = true -- Faster
vim.opt.undodir = vim.fn.expand('~/.vimundo') -- Stored here
vim.opt.undofile = true -- Use persistent undo
vim.opt.undolevels = 2000 -- Max number of changes that can be undone
vim.opt.updatetime = 100 -- Write to disk after 150 ms
vim.opt.virtualedit = 'block' -- Select whitespaces
vim.opt.whichwrap = 'b,s,h,l' -- Allow these keys to move past EOL
vim.opt.wildcharm = string.byte(vim.api.nvim_replace_termcodes('<Tab>', true, true, true)) -- Allow macros to tabcomplete
vim.opt.wildignore = '*.class,*.o,*~,*.pyc,.git,*.lock,target,*.out'
vim.opt.wildignorecase = true -- Ignore case when completing filenames
vim.opt.wildmenu = true -- Tabcompletion for commandline
vim.opt.winminheight = 0 -- Squeeze win height
vim.opt.winminwidth = 0 -- Squeeze win width

-- Disabled plugins
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_gzip = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.no_pdf_maps = 1

vim.g.maplocalleader = ','
vim.g.mapleader = '§'

-- vim.cmd('set background = light')

local opt = { noremap = true, silent = false, nowait = true }
local opt_plug = { noremap = false, silent = true, nowait = true }
local opt_expr = { noremap = true, silent = false, nowait = true, expr = true }

vim.keymap.set('n', 'c,', '<Cmd>cd %:p:h|pwd<CR>', opt)
vim.keymap.set('n', '´', '/HEAD<CR>', opt)
vim.keymap.set('n', '<C-t>', '<C-^>', opt)
vim.keymap.set('n', '<C-o>', '<Cmd>call GoBackToRecentBuffer()<CR>zz', opt)
vim.keymap.set('n', '<C-s-o>', '<C-o>', opt)
vim.keymap.set('n', '<C-w>+', '<Cmd>tab split<CR>', opt)
vim.keymap.set('n', '<C-w>-', '<C-w><C-q>', opt)
vim.keymap.set('v', 'E', '<C-y>', opt)
vim.keymap.set('n', '*', '*N', opt)
vim.keymap.set('v', '(', 'sa(i', opt_plug)
vim.keymap.set('v', ')', 'sa)i', opt_plug)
vim.keymap.set('n', '-', '<Cmd>noa w<CR>', opt)
vim.keymap.set('v', 'Ç', '"+y', opt) -- <D-S-c>

vim.cmd('map θ vAsa(biSome<C-c>b')
vim.cmd('map ® vAsa(biOk<C-c>b')

-- Fixes
vim.keymap.set('n', '<Tab>', "col('$') == 1? 'i<Tab>' : '>>'", opt_expr)
vim.keymap.set('v', 'A', "mode()=~'v' ? '$h' : 'A'", opt_expr)
vim.keymap.set('n', '<C-q>', 'q', opt) -- " Record with <C-q>
vim.keymap.set('n', 'n', 'nzz', opt)
vim.keymap.set('n', 'N', 'Nzz', opt)
vim.keymap.set('n', 'R', 'gR', opt)
vim.keymap.set('n', '<S-Tab>', '<<', opt)
vim.keymap.set('v', '<Tab>', '>gv', opt)
vim.keymap.set('v', '<S-Tab>', '<gv', opt)
vim.keymap.set('v', 'P', '"_dp', opt) -- " No yank on paste
vim.keymap.set('v', 'p', '"_dP', opt)
vim.keymap.set('v', '<BS>', '<BS>', opt) -- " Fix defaults
vim.keymap.set({ 'n', 'v', 'i' }, '<C-c>', '<Esc>', opt)
vim.keymap.set({ 'n', 'v', 's' }, '<Space>', ':', opt)
vim.keymap.set('n', 'gn', '<Cmd>cnext<CR>', opt)
vim.keymap.set('n', 'gN', '<Cmd>cNext<CR>', opt)
vim.keymap.set('n', 's<C-c>', '<Nop>')

-- Overrides
vim.keymap.set('n', 'C', "':%s/'.@/.'/'", opt_expr)
vim.keymap.set('x', 'C', "':s/'.@/.'/'", opt_expr)
vim.keymap.set('n', 'D', '"Add', opt)
vim.keymap.set('n', 'B', '^', opt) -- Go to start of line
vim.keymap.set('n', 'E', '<C-y>', opt) -- Scroll up
vim.keymap.set('i', '<C-h>', '<Left>', opt) -- Move in insert mode
vim.keymap.set('i', '<C-l>', '<Right>', opt)
vim.keymap.set('n', '!', ':!', opt)
vim.keymap.set('n', '<C-d>', '<Cmd>x<CR>', opt)
vim.keymap.set('n', 'S', ':%s//g<Left><Left>', opt)
vim.keymap.set('n', '<C-n>', 'gt', opt) -- Tab page management
vim.keymap.set('n', '<C-b>', 'gT', opt)
vim.keymap.set('n', 'gt', '<Cmd>tabnew<CR>', opt)
vim.keymap.set('n', '<C-CR>', 'kk<CR>', opt) -- Reverse <CR>
vim.keymap.set('n', 'f', '/', opt)
vim.keymap.set('n', '/', 'f', opt)

-- Disabled
vim.keymap.set('c', '<Up>', '<Nop>', opt)
vim.keymap.set('c', '<Down>', '<Nop>', opt)
vim.keymap.set('c', '<Left>', '<Nop>', opt)
vim.keymap.set('c', '<Right>', '<Nop>', opt)
vim.keymap.set('n', '<Right>', 'i<Right>', opt)
vim.keymap.set('n', '<Left>', 'i<Left>', opt)
vim.keymap.set('n', '<Up>', 'i<Up>', opt)
vim.keymap.set('n', '<Down>', 'i<Down>', opt)

---- Command line
vim.keymap.set('c', '<C-c>', '<C-u><C-c>', opt)
vim.keymap.set('c', '<C-h>', '<Left>', opt)
vim.keymap.set('c', '<C-l>', '<Right>', opt)
vim.keymap.set('c', '<C-k>', '<Up>', opt)
vim.keymap.set('c', '<C-j>', '<Down>', opt)
vim.keymap.set('c', '<C-b>', '<S-Left><Left>', opt)
vim.keymap.set('c', '<C-e>', '<S-Right>', opt)
vim.keymap.set('c', '<C-v>', '<C-r><C-l>', opt)
vim.keymap.set('c', '<C-f>', '<C-\\>e', opt)

--Toggles / Sliders
vim.keymap.set('n', '<Leader>b', '<Cmd>set ri!<CR>', opt) -- Write backwards
vim.keymap.set('n', '<Leader>dd', '<Cmd>set diff!<CR>', opt) -- Diff mode
vim.keymap.set('n', '<Leader>l', '<Cmd>set cursorbind! scrollbind!<CR>', opt) -- Bind cursor/scroll
vim.keymap.set('n', 'cu', 'gg=G``', opt) -- Format file
vim.keymap.set('n', 'gl', '<C-w>TgT', opt) -- Move to new tab

-- Commands
vim.keymap.set('n', 'cn', '<Cmd>cn<CR>', opt)
vim.keymap.set('n', 'cN', '<Cmd>cN<CR>', opt)
vim.keymap.set('n', 'å', '<Cmd>x<CR>', opt)
vim.keymap.set('n', 'ä', '<Cmd>%s/\\s\\+$//e<CR>', opt) -- Remove whitespaces
vim.keymap.set('n', '<D-i>', '<Cmd>terminal ++close<CR>', opt) -- Terminal
vim.keymap.set('n', '<D-b>', '<Cmd>!cargo build<CR>', opt) -- Cargo
vim.keymap.set('n', '<D-r>', '<Cmd>!cargo run<CR>', opt)
vim.keymap.set('n', '<D-c>', '<Cmd>!cargo clean<CR>', opt)
vim.keymap.set('n', '<D-d>', '<Cmd>!cargo doc --open<CR>', opt)
vim.keymap.set('n', '<D-f>', '<Cmd>!cargo test<CR>', opt)
vim.keymap.set('n', '<D-e>', '<Cmd>!cargo search ', opt)
vim.keymap.set('n', '<D-x>', '<Cmd>!cargo check<CR>', opt)
vim.keymap.set('n', '<D-z>', '<Cmd>!cargo bench<CR>', opt)

-- Macros
vim.keymap.set('n', '©', '@1', opt) -- <M-1>

-- File shortcuts
vim.keymap.set('n', 'π', '<Cmd>tab drop ~/.config/nvim/lua/plugins.lua<CR>', opt) -- <M-p>
vim.keymap.set('n', '→', '<Cmd>tab drop ~/.config/nvim/init.lua<CR>', opt)
vim.keymap.set('n', '⊢', '<Cmd>tab drop ~/.vim/vimrc<CR>', opt) -- <M-ä>
vim.keymap.set('n', 'Æ', '<Cmd>tab drop ~/.gvimrc<CR>', opt) -- <M-Ä>
vim.keymap.set('n', 'ø', '<Cmd>tab drop ~/.vim/bibtex/library.bib<CR>', opt) -- <M-ö>

-- Unmaps
vim.keymap.del('n', 'Y')
-- vim.keymap.del('s', 'w')
-- vim.keymap.del('s', 'b')
-- vim.keymap.del('s', 'e')
-- vim.keymap.del('s', 'ge')

-- Spell correction / Abbreviations
vim.cmd('iab retrun return')
vim.cmd('iab pritn print')
vim.cmd('iab teh the')
vim.cmd('iab liek like')
vim.cmd('iab liekwise likewise')
vim.cmd('iab moer more')
vim.cmd('iab previosu previous')
vim.cmd('iab pset pest')

-- Functions

function OpenDiagFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  -- vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'CocErrorHighlight' })
  -- vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'CocErrorHighlight' })
  vim.diagnostic.open_float { focusable = true, header = false, border = "rounded", prefix = "", wrap = true }
end

vim.cmd([[
fun! SynStack()
  if !exists("*synstack")
    return
  en
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfun

fun! GoBackToRecentBuffer()
  let startName = bufname('%')
  for _ in range(100)
    exe "normal! \<C-o>"
    let nowName = bufname('%')
    if nowName != startName
      break
    en
  endfor
endfun

function! GetPreCursorChar()
  if col('.') <= 1
    return ''
  endif
  let before_cursor = getline('.')[:col('.')-2]
  return strcharpart(before_cursor, strchars(before_cursor)-1)
endfunction
]])

-- Autocmd
local group = vim.api.nvim_create_augroup('AutoCommands', { clear = true })

function Autocmd(event, pattern, action)
  if type(action) == 'function' then
    vim.api.nvim_create_autocmd(event, { pattern = pattern, group = group, callback = action })
  else
    vim.api.nvim_create_autocmd(event, { pattern = pattern, group = group, command = action })
  end
end

Autocmd('BufReadPost', '*', 'if line("\'\\"") > 1 && line("\'\\"") <= line("$") | exe "normal! g\'\\"" | en')
Autocmd({ 'BufRead', 'BufNewFile' }, '*.mlir', 'set filetype=mlir syntax=llvm')
Autocmd({ 'BufRead', 'BufNewFile' }, '*.lalrpop', 'set syntax=rust')
Autocmd({ 'BufRead', 'BufNewFile' }, '*.sbt', 'set syntax=scala')
Autocmd({ 'BufRead', 'BufNewFile' }, '*.arc', 'set filetype=arc')
Autocmd({ 'BufRead', 'BufNewFile' }, '*.mll', 'set filetype=ocamllex syntax=ocaml')
Autocmd('BufEnter', '*', 'silent! lcd %:p:h')
Autocmd('BufWritePost', 'plugins.lua', 'source <afile> | PackerCompile')
Autocmd('TabLeave', '*', 'silent! w')
Autocmd('CursorHold', '*', OpenDiagFloat)
Autocmd('BufEnter', '*.txt', 'if &buftype == "help" | wincmd L | endif')
