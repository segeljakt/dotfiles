-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/klasseg/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/klasseg/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/klasseg/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/klasseg/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/klasseg/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rmappings\1\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\nÉ\1\0\0\5\0\b\0\0146\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0024\3\0\0=\3\5\0029\2\6\0009\4\a\1B\2\2\1K\0\1\0\vconfig\nsetup\bval\vheader\fsection\26alpha.themes.startify\nalpha\frequire\0" },
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  camelcasemotion = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/camelcasemotion",
    url = "https://github.com/bkad/camelcasemotion"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1Ä4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0¿\bset\vkeymap\bvim\vbuffer1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1¿\6~\rdiffthisç\6\1\1\b\0)\0[6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0005\5\4\0'\6\5\0'\a\6\0B\3\4\1\18\3\2\0005\5\a\0'\6\b\0'\a\t\0B\3\4\1\18\3\2\0'\5\n\0'\6\v\0'\a\f\0B\3\4\1\18\3\2\0'\5\n\0'\6\r\0009\a\14\1B\3\4\1\18\3\2\0'\5\n\0'\6\15\0009\a\16\1B\3\4\1\18\3\2\0'\5\n\0'\6\17\0009\a\18\1B\3\4\1\18\3\2\0'\5\n\0'\6\19\0009\a\20\1B\3\4\1\18\3\2\0'\5\n\0'\6\21\0009\a\22\1B\3\4\1\18\3\2\0'\5\n\0'\6\23\0009\a\24\1B\3\4\1\18\3\2\0'\5\n\0'\6\25\0009\a\26\1B\3\4\1\18\3\2\0'\5\n\0'\6\27\0009\a\28\1B\3\4\1\18\3\2\0'\5\n\0'\6\29\0003\a\30\0B\3\4\1\18\3\2\0'\5\n\0'\6\31\0009\a\28\1B\3\4\1\18\3\2\0'\5\n\0'\6 \0009\a!\1B\3\4\1\18\3\2\0'\5\n\0'\6\"\0003\a#\0B\3\4\1\18\3\2\0'\5\n\0'\6$\0009\a%\1B\3\4\1\18\3\2\0005\5&\0'\6'\0'\a(\0B\3\4\0012\0\0ÄK\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\19toggle_deleted\15<leader>td\0\15<leader>hD\rdiffthis\15<leader>hd\15<leader>tb\0\15<leader>hb\30toggle_current_line_blame\a¬ª\15stage_hunk\aŒì\14prev_hunk\a¬∫\14next_hunk\a¬¨\17preview_hunk\agp\17reset_buffer\15<leader>hR\20undo_stage_hunk\agu\17stage_buffer\bgfs\28:Gitsigns show_hunk<CR>\agh\6n\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\3\0\0\6n\6v\0\rgitsigns\vloaded\fpackage’\a\1\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\19preview_config\1\0\5\rrelative\vcursor\nstyle\fminimal\vborder\vsingle\bcol\3\1\brow\3\0\28current_line_blame_opts\1\0\4\18virt_text_pos\beol\14virt_text\2\ndelay\3Ë\a\22ignore_whitespace\1\17watch_gitdir\1\0\2\rinterval\3Ë\a\17follow_files\2\nsigns\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6~\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\b‚Äæ\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\6_\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ttext\b‚îÇ\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ttext\b‚îÇ\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\14on_attach\1\0\n\23current_line_blame\1\24attach_to_untracked\2\15signcolumn\2\nnumhl\1\14word_diff\1\20update_debounce\3d\18sign_priority\3\6!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\20max_file_length\3¿∏\2\vlinehl\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["highlight-current-n.nvim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/highlight-current-n.nvim",
    url = "https://github.com/rktjmp/highlight-current-n.nvim"
  },
  ["ingo-library"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/ingo-library",
    url = "https://github.com/vim-scripts/ingo-library"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/lightline.vim",
    url = "https://github.com/itchyny/lightline.vim"
  },
  ["limelight.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/limelight.vim",
    url = "https://github.com/junegunn/limelight.vim"
  },
  ["llvm.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim",
    url = "https://github.com/tie/llvm.vim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvimi\0\0\4\0\6\0\b6\0\0\0009\0\1\0009\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nfloat\1\0\1\twrap\1\1\0\2\vheader\1\vborder\frounded\14goto_prev\15diagnostic\bvimi\0\0\4\0\6\0\b6\0\0\0009\0\1\0009\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nfloat\1\0\1\twrap\1\1\0\2\vheader\1\vborder\frounded\14goto_next\15diagnostic\bvim∫\1\0\0\b\0\n\1\0266\0\0\0006\2\1\0009\2\2\0029\2\3\2B\2\1\0A\0\0\4H\3\bÄ9\5\4\4\t\5\0\0X\5\5Ä6\5\1\0009\5\5\5'\a\6\0B\5\2\1K\0\1\0F\3\3\3R\3ˆ\1276\0\1\0009\0\a\0009\0\b\0B\0\1\0016\0\1\0009\0\5\0'\2\t\0B\0\2\1K\0\1\0\rwincmd p\14setqflist\15diagnostic\vcclose\bcmd\rquickfix\15getwininfo\afn\bvim\npairs\2)\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2¸ˇB\0\2\1K\0\1\0\3¿\16scroll_docs)\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\4\0B\0\2\1K\0\1\0\3¿\16scroll_docs*\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3¿\21select_next_item*\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3¿\21select_prev_item\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3¿\nabort∂\1\0\0\b\1\n\0\24-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\5Ä-\0\0\0009\0\1\0005\2\2\0B\0\2\1X\0\rÄ6\0\3\0009\0\4\0009\0\5\0006\2\3\0009\2\6\0029\2\a\2'\4\b\0+\5\2\0+\6\2\0+\a\2\0B\2\5\2'\3\t\0B\0\3\1K\0\1\0\3¿\6n\t<CR>\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\1\0\1\vselect\2\fconfirm\fvisibleŸ\1\0\0\n\1\n\0\28-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\18Ä6\0\2\0009\0\3\0009\0\4\0006\2\2\0009\2\5\0029\2\6\0026\4\2\0009\4\3\0049\4\a\4'\6\b\0+\a\2\0+\b\2\0+\t\2\0B\4\5\0A\2\0\2'\3\t\0+\4\2\0B\0\4\1K\0\1\0\3¿\6n\n<Tab>\27nvim_replace_termcodes\19copilot#Accept\afn\18nvim_feedkeys\bapi\bvim\21select_next_item\fvisible∞\1\0\0\b\1\t\0\23-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\rÄ6\0\2\0009\0\3\0009\0\4\0006\2\2\0009\2\5\0029\2\6\2'\4\a\0+\5\2\0+\6\2\0+\a\2\0B\2\5\2'\3\b\0B\0\3\1K\0\1\0\3¿\6n\t<BS>\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\21select_prev_item\fvisibleõ\f\1\2\v\1K\0¸\0015\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0006\a\2\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0006\a\2\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\f\0006\a\2\0009\a\a\a9\a\b\a9\a\r\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\14\0006\a\2\0009\a\a\a9\a\b\a9\a\15\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\16\0006\a\2\0009\a\a\a9\a\b\a9\a\17\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\18\0006\a\2\0009\a\a\a9\a\b\a9\a\19\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\20\0006\a\2\0009\a\a\a9\a\b\a9\a\21\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\22\0006\a\2\0009\a\a\a9\a\b\a9\a\23\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\24\0003\a\25\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\26\0003\a\27\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\28\0003\a\29\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\30\0003\a\31\0\18\b\2\0B\3\5\0016\3 \0'\5!\0B\3\2\0026\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a#\0003\b$\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a%\0003\b&\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a\28\0003\b'\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a\26\0003\b(\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a)\0003\b*\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a+\0003\b,\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a-\0003\b.\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a/\0003\b0\0\18\t\2\0B\4\5\0016\4\2\0009\4\a\0049\0041\0046\5\2\0009\5\a\0059\0053\0056\a\2\0009\a\a\a9\a4\a9\a5\a5\b6\0B\5\3\2=\0052\0046\4\2\0009\4\a\0049\0041\0046\5\2\0009\5\a\0059\0053\0056\a\2\0009\a\a\a9\a1\a9\a\v\a5\b8\0B\5\3\2=\0057\4-\4\0\0\a\0049\0X\4\aÄ6\4 \0'\6:\0B\4\2\0029\4;\0044\6\0\0B\4\2\1X\4\18Ä-\4\0\0\a\4<\0X\4\15Ä6\4 \0'\6=\0B\4\2\0029\4<\0049\4;\0045\6E\0005\aC\0005\bA\0005\t?\0005\n>\0=\n@\t=\tB\b=\bD\a=\aF\6B\4\2\0016\4\2\0009\4G\0049\4H\4)\6\0\0'\aI\0005\bJ\0B\4\4\0012\0\0ÄK\0\1\0\0¿\1\0\1\tlink\nFloat\16FloatBorder\16nvim_set_hl\bapi\rsettings\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\14lspconfig\16sumneko_lua\nsetup\15rust-tools\18rust_analyzer\1\0\1\vborder\frounded\23textDocument/hover\1\0\2\21update_in_insert\1\14underline\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\0\f<S-Tab>\0\n<Tab>\0\t<CR>\0\n<C-e>\0\0\0\a¬¨\0\b‚àß\6i\bcmp\frequire\0\aŒõ\0\n<C-j>\0\n<C-k>\0\6+\16code_action\b‚óä\19signature_help\aÀò\19implementation\aÀÜ\20type_definition\a√ú\16declaration\aŒò\15references\a√â\nhover\6K\15definition\bbuf\blsp\6t\6n\bset\vkeymap\bvim\vbuffer\1\0\2\fnoremap\2\vsilent\2p\1\1\5\1\a\0\r6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\3\0-\4\0\0=\4\4\0033\4\5\0=\4\6\3B\1\2\0012\0\0ÄK\0\1\0\0¿\14on_attach\0\17capabilities\1\0\0\nsetup\14lspconfig\frequireˆ\1\1\0\5\0\n\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0B\0\1\0026\1\0\0'\3\1\0B\1\2\0029\1\b\0014\3\3\0003\4\t\0>\4\1\3B\1\2\0012\0\0ÄK\0\1\0\0\19setup_handlers\25default_capabilities\17cmp_nvim_lsp\21ensure_installed\1\0\0\1\4\0\0\16sumneko_lua\26rust_analyzer@nightly\rocamllsp\nsetup\20mason-lspconfig\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    after = { "mason-lspconfig.nvim" },
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n®\1\0\0\3\0\6\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\2\14\0\0\0X\0\bÄ6\0\0\0'\2\1\0B\0\2\0029\0\4\0'\2\5\0B\0\2\2\19\0\0\0X\1\3Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\fComment\20in_syntax_group\fcomment\26in_treesitter_capture\23cmp.config.context\frequire;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim]\0\2\4\0\4\0\0065\2\0\0009\3\2\0009\3\3\0038\3\3\2=\3\1\1L\1\2\0\tname\vsource\tmenu\1\0\4\rnvim_lsp\aŒª\vbuffer\aŒ©\nvsnip\b‚ãó\tpath\tüñ´∞\3\1\0\b\0\27\0,6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0003\4\3\0=\4\5\0035\4\a\0003\5\6\0=\5\b\4=\4\t\0035\4\r\0009\5\n\0009\5\v\0059\5\f\5B\5\1\2=\5\14\0049\5\n\0009\5\v\0059\5\f\5B\5\1\2=\5\15\4=\4\v\0039\4\n\0009\4\16\0044\6\5\0005\a\17\0>\a\1\0065\a\18\0>\a\2\0065\a\19\0>\a\3\0065\a\20\0>\a\4\6B\4\2\2=\4\16\0035\4\22\0005\5\21\0=\5\23\0043\5\24\0=\5\25\4=\4\26\3B\1\2\1K\0\1\0\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tmenu\tabbr\tkind\1\0\2\tname\nvsnip\19keyword_length\3\2\1\0\1\tname\vbuffer\1\0\2\tname\rnvim_lsp\19keyword_length\3\3\1\0\1\tname\tpath\fsources\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\vexpand\1\0\0\0\fenabled\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/papercolor-theme",
    url = "https://github.com/nlknguyen/papercolor-theme"
  },
  ["pear-tree"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/pear-tree",
    url = "https://github.com/tmsvg/pear-tree"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["rename.vim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/rename.vim",
    url = "https://github.com/danro/rename.vim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["rust.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["sideways.vim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/sideways.vim",
    url = "https://github.com/andrewradev/sideways.vim"
  },
  tabular = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n¸\3\0\0\6\0\23\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0005\5\16\0=\5\17\4=\4\18\3=\3\19\0024\3\0\0=\3\20\0025\3\21\0=\3\22\2B\0\2\1K\0\1\0\25file_ignore_patterns\1\2\0\0\b%.o\15extensions\fpickers\14live_grep\18layout_config\1\0\4\vheight\4ÊÃô≥\6ÊÃπˇ\3\vmirror\2\17scroll_speed\3\1\20prompt_position\vbottom\1\0\1\20layout_strategy\rvertical\14old_files\1\0\1\ntheme\rdropdown\14git_files\1\0\0\1\0\1\ntheme\rdropdown\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\1\0\4\a¬™\26cycle_previewers_prev\n<C-j>\24move_selection_next\n<C-k>\28move_selection_previous\f<C-s-j>\26cycle_previewers_next\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["thesaurus_query.vim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/thesaurus_query.vim",
    url = "https://github.com/ron89/thesaurus_query.vim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n‰\1\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0024\3\0\0=\3\n\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\15treesitter\2\fcontext\3\n\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\2\nalpha\4\0ÄÄ¿˛\3\rinactive\1\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  vim = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim",
    url = "/Users/klasseg/Workspace/arc/arc-lang/editor/vim/"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-argwrap"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-argwrap",
    url = "https://github.com/foosoft/vim-argwrap"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-commando"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-commando",
    url = "/Users/klasseg/Workspace/vim-commando"
  },
  ["vim-conjoin"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-conjoin",
    url = "https://github.com/flwyd/vim-conjoin"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-cool",
    url = "https://github.com/romainl/vim-cool"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gh-line"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-gh-line",
    url = "https://github.com/ruanyl/vim-gh-line"
  },
  ["vim-highlighturl"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-highlighturl",
    url = "https://github.com/itchyny/vim-highlighturl"
  },
  ["vim-illuminate"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-illuminate",
    url = "https://github.com/rrethy/vim-illuminate"
  },
  ["vim-isotope"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-isotope",
    url = "https://github.com/segeljakt/vim-isotope"
  },
  ["vim-json"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-json",
    url = "https://github.com/elzr/vim-json"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-menhir"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-menhir",
    url = "https://github.com/elliottcable/vim-menhir"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-schlepp"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-schlepp",
    url = "https://github.com/zirrostig/vim-schlepp"
  },
  ["vim-silicon"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-silicon",
    url = "https://github.com/segeljakt/vim-silicon"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-toml"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-toml",
    url = "https://github.com/cespare/vim-toml"
  },
  ["vim-troll-stopper"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-troll-stopper",
    url = "https://github.com/vim-utils/vim-troll-stopper"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-visual-star-search",
    url = "https://github.com/nelstrom/vim-visual-star-search"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-zsh"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-zsh",
    url = "https://github.com/chrisbra/vim-zsh"
  },
  vimtex = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  visualrepeat = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/visualrepeat",
    url = "https://github.com/vim-scripts/visualrepeat"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/webapi-vim",
    url = "https://github.com/mattn/webapi-vim"
  },
  winresizer = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/winresizer",
    url = "https://github.com/simeji/winresizer"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n‰\1\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0024\3\0\0=\3\n\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\15treesitter\2\fcontext\3\n\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\2\nalpha\4\0ÄÄ¿˛\3\rinactive\1\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n¸\3\0\0\6\0\23\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0005\5\16\0=\5\17\4=\4\18\3=\3\19\0024\3\0\0=\3\20\0025\3\21\0=\3\22\2B\0\2\1K\0\1\0\25file_ignore_patterns\1\2\0\0\b%.o\15extensions\fpickers\14live_grep\18layout_config\1\0\4\vheight\4ÊÃô≥\6ÊÃπˇ\3\vmirror\2\17scroll_speed\3\1\20prompt_position\vbottom\1\0\1\20layout_strategy\rvertical\14old_files\1\0\1\ntheme\rdropdown\14git_files\1\0\0\1\0\1\ntheme\rdropdown\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\1\0\4\a¬™\26cycle_previewers_prev\n<C-j>\24move_selection_next\n<C-k>\28move_selection_previous\f<C-s-j>\26cycle_previewers_next\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n®\1\0\0\3\0\6\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\2\14\0\0\0X\0\bÄ6\0\0\0'\2\1\0B\0\2\0029\0\4\0'\2\5\0B\0\2\2\19\0\0\0X\1\3Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\fComment\20in_syntax_group\fcomment\26in_treesitter_capture\23cmp.config.context\frequire;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim]\0\2\4\0\4\0\0065\2\0\0009\3\2\0009\3\3\0038\3\3\2=\3\1\1L\1\2\0\tname\vsource\tmenu\1\0\4\rnvim_lsp\aŒª\vbuffer\aŒ©\nvsnip\b‚ãó\tpath\tüñ´∞\3\1\0\b\0\27\0,6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0003\4\3\0=\4\5\0035\4\a\0003\5\6\0=\5\b\4=\4\t\0035\4\r\0009\5\n\0009\5\v\0059\5\f\5B\5\1\2=\5\14\0049\5\n\0009\5\v\0059\5\f\5B\5\1\2=\5\15\4=\4\v\0039\4\n\0009\4\16\0044\6\5\0005\a\17\0>\a\1\0065\a\18\0>\a\2\0065\a\19\0>\a\3\0065\a\20\0>\a\4\6B\4\2\2=\4\16\0035\4\22\0005\5\21\0=\5\23\0043\5\24\0=\5\25\4=\4\26\3B\1\2\1K\0\1\0\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tmenu\tabbr\tkind\1\0\2\tname\nvsnip\19keyword_length\3\2\1\0\1\tname\vbuffer\1\0\2\tname\rnvim_lsp\19keyword_length\3\3\1\0\1\tname\tpath\fsources\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\vexpand\1\0\0\0\fenabled\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rmappings\1\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1Ä4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0¿\bset\vkeymap\bvim\vbuffer1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1¿\6~\rdiffthisç\6\1\1\b\0)\0[6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0005\5\4\0'\6\5\0'\a\6\0B\3\4\1\18\3\2\0005\5\a\0'\6\b\0'\a\t\0B\3\4\1\18\3\2\0'\5\n\0'\6\v\0'\a\f\0B\3\4\1\18\3\2\0'\5\n\0'\6\r\0009\a\14\1B\3\4\1\18\3\2\0'\5\n\0'\6\15\0009\a\16\1B\3\4\1\18\3\2\0'\5\n\0'\6\17\0009\a\18\1B\3\4\1\18\3\2\0'\5\n\0'\6\19\0009\a\20\1B\3\4\1\18\3\2\0'\5\n\0'\6\21\0009\a\22\1B\3\4\1\18\3\2\0'\5\n\0'\6\23\0009\a\24\1B\3\4\1\18\3\2\0'\5\n\0'\6\25\0009\a\26\1B\3\4\1\18\3\2\0'\5\n\0'\6\27\0009\a\28\1B\3\4\1\18\3\2\0'\5\n\0'\6\29\0003\a\30\0B\3\4\1\18\3\2\0'\5\n\0'\6\31\0009\a\28\1B\3\4\1\18\3\2\0'\5\n\0'\6 \0009\a!\1B\3\4\1\18\3\2\0'\5\n\0'\6\"\0003\a#\0B\3\4\1\18\3\2\0'\5\n\0'\6$\0009\a%\1B\3\4\1\18\3\2\0005\5&\0'\6'\0'\a(\0B\3\4\0012\0\0ÄK\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\19toggle_deleted\15<leader>td\0\15<leader>hD\rdiffthis\15<leader>hd\15<leader>tb\0\15<leader>hb\30toggle_current_line_blame\a¬ª\15stage_hunk\aŒì\14prev_hunk\a¬∫\14next_hunk\a¬¨\17preview_hunk\agp\17reset_buffer\15<leader>hR\20undo_stage_hunk\agu\17stage_buffer\bgfs\28:Gitsigns show_hunk<CR>\agh\6n\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\3\0\0\6n\6v\0\rgitsigns\vloaded\fpackage’\a\1\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\19preview_config\1\0\5\rrelative\vcursor\nstyle\fminimal\vborder\vsingle\bcol\3\1\brow\3\0\28current_line_blame_opts\1\0\4\18virt_text_pos\beol\14virt_text\2\ndelay\3Ë\a\22ignore_whitespace\1\17watch_gitdir\1\0\2\rinterval\3Ë\a\17follow_files\2\nsigns\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6~\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\b‚Äæ\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\6_\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ttext\b‚îÇ\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ttext\b‚îÇ\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\14on_attach\1\0\n\23current_line_blame\1\24attach_to_untracked\2\15signcolumn\2\nnumhl\1\14word_diff\1\20update_debounce\3d\18sign_priority\3\6!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\20max_file_length\3¿∏\2\vlinehl\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\nÉ\1\0\0\5\0\b\0\0146\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0024\3\0\0=\3\5\0029\2\6\0009\4\a\1B\2\2\1K\0\1\0\vconfig\nsetup\bval\vheader\fsection\26alpha.themes.startify\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd mason-lspconfig.nvim ]]

-- Config for: mason-lspconfig.nvim
try_loadstring("\27LJ\2\n@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvimi\0\0\4\0\6\0\b6\0\0\0009\0\1\0009\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nfloat\1\0\1\twrap\1\1\0\2\vheader\1\vborder\frounded\14goto_prev\15diagnostic\bvimi\0\0\4\0\6\0\b6\0\0\0009\0\1\0009\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nfloat\1\0\1\twrap\1\1\0\2\vheader\1\vborder\frounded\14goto_next\15diagnostic\bvim∫\1\0\0\b\0\n\1\0266\0\0\0006\2\1\0009\2\2\0029\2\3\2B\2\1\0A\0\0\4H\3\bÄ9\5\4\4\t\5\0\0X\5\5Ä6\5\1\0009\5\5\5'\a\6\0B\5\2\1K\0\1\0F\3\3\3R\3ˆ\1276\0\1\0009\0\a\0009\0\b\0B\0\1\0016\0\1\0009\0\5\0'\2\t\0B\0\2\1K\0\1\0\rwincmd p\14setqflist\15diagnostic\vcclose\bcmd\rquickfix\15getwininfo\afn\bvim\npairs\2)\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2¸ˇB\0\2\1K\0\1\0\3¿\16scroll_docs)\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\4\0B\0\2\1K\0\1\0\3¿\16scroll_docs*\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3¿\21select_next_item*\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3¿\21select_prev_item\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3¿\nabort∂\1\0\0\b\1\n\0\24-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\5Ä-\0\0\0009\0\1\0005\2\2\0B\0\2\1X\0\rÄ6\0\3\0009\0\4\0009\0\5\0006\2\3\0009\2\6\0029\2\a\2'\4\b\0+\5\2\0+\6\2\0+\a\2\0B\2\5\2'\3\t\0B\0\3\1K\0\1\0\3¿\6n\t<CR>\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\1\0\1\vselect\2\fconfirm\fvisibleŸ\1\0\0\n\1\n\0\28-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\18Ä6\0\2\0009\0\3\0009\0\4\0006\2\2\0009\2\5\0029\2\6\0026\4\2\0009\4\3\0049\4\a\4'\6\b\0+\a\2\0+\b\2\0+\t\2\0B\4\5\0A\2\0\2'\3\t\0+\4\2\0B\0\4\1K\0\1\0\3¿\6n\n<Tab>\27nvim_replace_termcodes\19copilot#Accept\afn\18nvim_feedkeys\bapi\bvim\21select_next_item\fvisible∞\1\0\0\b\1\t\0\23-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\rÄ6\0\2\0009\0\3\0009\0\4\0006\2\2\0009\2\5\0029\2\6\2'\4\a\0+\5\2\0+\6\2\0+\a\2\0B\2\5\2'\3\b\0B\0\3\1K\0\1\0\3¿\6n\t<BS>\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\21select_prev_item\fvisibleõ\f\1\2\v\1K\0¸\0015\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0006\a\2\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0006\a\2\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\f\0006\a\2\0009\a\a\a9\a\b\a9\a\r\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\14\0006\a\2\0009\a\a\a9\a\b\a9\a\15\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\16\0006\a\2\0009\a\a\a9\a\b\a9\a\17\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\18\0006\a\2\0009\a\a\a9\a\b\a9\a\19\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\20\0006\a\2\0009\a\a\a9\a\b\a9\a\21\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\22\0006\a\2\0009\a\a\a9\a\b\a9\a\23\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\24\0003\a\25\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\26\0003\a\27\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\28\0003\a\29\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\30\0003\a\31\0\18\b\2\0B\3\5\0016\3 \0'\5!\0B\3\2\0026\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a#\0003\b$\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a%\0003\b&\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a\28\0003\b'\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a\26\0003\b(\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a)\0003\b*\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a+\0003\b,\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a-\0003\b.\0\18\t\2\0B\4\5\0016\4\2\0009\4\3\0049\4\4\4'\6\"\0'\a/\0003\b0\0\18\t\2\0B\4\5\0016\4\2\0009\4\a\0049\0041\0046\5\2\0009\5\a\0059\0053\0056\a\2\0009\a\a\a9\a4\a9\a5\a5\b6\0B\5\3\2=\0052\0046\4\2\0009\4\a\0049\0041\0046\5\2\0009\5\a\0059\0053\0056\a\2\0009\a\a\a9\a1\a9\a\v\a5\b8\0B\5\3\2=\0057\4-\4\0\0\a\0049\0X\4\aÄ6\4 \0'\6:\0B\4\2\0029\4;\0044\6\0\0B\4\2\1X\4\18Ä-\4\0\0\a\4<\0X\4\15Ä6\4 \0'\6=\0B\4\2\0029\4<\0049\4;\0045\6E\0005\aC\0005\bA\0005\t?\0005\n>\0=\n@\t=\tB\b=\bD\a=\aF\6B\4\2\0016\4\2\0009\4G\0049\4H\4)\6\0\0'\aI\0005\bJ\0B\4\4\0012\0\0ÄK\0\1\0\0¿\1\0\1\tlink\nFloat\16FloatBorder\16nvim_set_hl\bapi\rsettings\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\14lspconfig\16sumneko_lua\nsetup\15rust-tools\18rust_analyzer\1\0\1\vborder\frounded\23textDocument/hover\1\0\2\21update_in_insert\1\14underline\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\0\f<S-Tab>\0\n<Tab>\0\t<CR>\0\n<C-e>\0\0\0\a¬¨\0\b‚àß\6i\bcmp\frequire\0\aŒõ\0\n<C-j>\0\n<C-k>\0\6+\16code_action\b‚óä\19signature_help\aÀò\19implementation\aÀÜ\20type_definition\a√ú\16declaration\aŒò\15references\a√â\nhover\6K\15definition\bbuf\blsp\6t\6n\bset\vkeymap\bvim\vbuffer\1\0\2\fnoremap\2\vsilent\2p\1\1\5\1\a\0\r6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\3\0-\4\0\0=\4\4\0033\4\5\0=\4\6\3B\1\2\0012\0\0ÄK\0\1\0\0¿\14on_attach\0\17capabilities\1\0\0\nsetup\14lspconfig\frequireˆ\1\1\0\5\0\n\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0B\0\1\0026\1\0\0'\3\1\0B\1\2\0029\1\b\0014\3\3\0003\4\t\0>\4\1\3B\1\2\0012\0\0ÄK\0\1\0\0\19setup_handlers\25default_capabilities\17cmp_nvim_lsp\21ensure_installed\1\0\0\1\4\0\0\16sumneko_lua\26rust_analyzer@nightly\rocamllsp\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust.vim', 'vim-argwrap'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'vim-toml'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType llvm ++once lua require("packer.load")({'llvm.vim'}, { ft = "llvm" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'goyo.vim', 'vim-markdown', 'limelight.vim', 'vim-table-mode', 'vim-illuminate'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'vim-zsh'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'goyo.vim', 'limelight.vim', 'vim-table-mode', 'vim-illuminate'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'goyo.vim', 'limelight.vim', 'vim-table-mode', 'vim-illuminate'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'vim-json'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType menhir ++once lua require("packer.load")({'vim-menhir'}, { ft = "menhir" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-menhir/after/ftdetect/menhir.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-menhir/after/ftdetect/menhir.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-menhir/after/ftdetect/menhir.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/llvm-lit.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/llvm-lit.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/llvm-lit.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/llvm.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/llvm.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/llvm.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/tablegen.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/tablegen.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/tablegen.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
