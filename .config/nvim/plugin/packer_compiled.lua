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
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
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
    config = { "\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1Ä4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0¿\bset\vkeymap\bvim\vbuffer1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1¿\6~\rdiffthisç\6\1\1\b\0)\0[6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0005\5\4\0'\6\5\0'\a\6\0B\3\4\1\18\3\2\0005\5\a\0'\6\b\0'\a\t\0B\3\4\1\18\3\2\0'\5\n\0'\6\v\0'\a\f\0B\3\4\1\18\3\2\0'\5\n\0'\6\r\0009\a\14\1B\3\4\1\18\3\2\0'\5\n\0'\6\15\0009\a\16\1B\3\4\1\18\3\2\0'\5\n\0'\6\17\0009\a\18\1B\3\4\1\18\3\2\0'\5\n\0'\6\19\0009\a\20\1B\3\4\1\18\3\2\0'\5\n\0'\6\21\0009\a\22\1B\3\4\1\18\3\2\0'\5\n\0'\6\23\0009\a\24\1B\3\4\1\18\3\2\0'\5\n\0'\6\25\0009\a\26\1B\3\4\1\18\3\2\0'\5\n\0'\6\27\0009\a\28\1B\3\4\1\18\3\2\0'\5\n\0'\6\29\0003\a\30\0B\3\4\1\18\3\2\0'\5\n\0'\6\31\0009\a\28\1B\3\4\1\18\3\2\0'\5\n\0'\6 \0009\a!\1B\3\4\1\18\3\2\0'\5\n\0'\6\"\0003\a#\0B\3\4\1\18\3\2\0'\5\n\0'\6$\0009\a%\1B\3\4\1\18\3\2\0005\5&\0'\6'\0'\a(\0B\3\4\0012\0\0ÄK\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\19toggle_deleted\15<leader>td\0\15<leader>hD\rdiffthis\15<leader>hd\15<leader>tb\0\15<leader>hb\30toggle_current_line_blame\a¬ª\15stage_hunk\aŒì\14prev_hunk\a¬∫\14next_hunk\a¬¨\17preview_hunk\agp\17reset_buffer\15<leader>hR\20undo_stage_hunk\agu\17stage_buffer\bgfs\28:Gitsigns show_hunk<CR>\agh\6n\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\3\0\0\6n\6v\0\rgitsigns\vloaded\fpackage’\a\1\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\19preview_config\1\0\5\vborder\vsingle\bcol\3\1\brow\3\0\rrelative\vcursor\nstyle\fminimal\28current_line_blame_opts\1\0\4\22ignore_whitespace\1\ndelay\3Ë\a\18virt_text_pos\beol\14virt_text\2\17watch_gitdir\1\0\2\rinterval\3Ë\a\17follow_files\2\nsigns\17changedelete\1\0\4\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\6~\14topdelete\1\0\4\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\b‚Äæ\vdelete\1\0\4\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\6_\vchange\1\0\4\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\b‚îÇ\badd\1\0\0\1\0\4\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\ttext\b‚îÇ\14on_attach\1\0\n\nnumhl\1!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\20max_file_length\3¿∏\2\23current_line_blame\1\24attach_to_untracked\2\vlinehl\1\15signcolumn\2\14word_diff\1\20update_debounce\3d\18sign_priority\3\6\0\nsetup\rgitsigns\frequire\0" },
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
  ["litee.nvim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/litee.nvim",
    url = "https://github.com/ldelossa/litee.nvim"
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
  merlin = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/opt/merlin",
    url = "https://github.com/ocaml/merlin"
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
    config = { "\27LJ\2\n◊\3\0\0\6\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0005\5\16\0=\5\17\4=\4\18\3=\3\19\0024\3\0\0=\3\20\2B\0\2\1K\0\1\0\15extensions\fpickers\14live_grep\18layout_config\1\0\4\20prompt_position\vbottom\vheight\4ÊÃô≥\6ÊÃπˇ\3\vmirror\2\17scroll_speed\3\1\1\0\1\20layout_strategy\rvertical\14old_files\1\0\1\ntheme\rdropdown\14git_files\1\0\0\1\0\1\ntheme\rdropdown\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\1\0\4\a¬™\26cycle_previewers_prev\n<C-j>\24move_selection_next\f<C-s-j>\26cycle_previewers_next\n<C-k>\28move_selection_previous\nsetup\14telescope\frequire\0" },
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
    config = { "\27LJ\2\n‰\1\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0024\3\0\0=\3\n\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\15treesitter\2\fcontext\3\n\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\2\rinactive\1\nalpha\4\0ÄÄ¿˛\3\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
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
  ["vim-lightline-coc"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-lightline-coc",
    url = "https://github.com/josa42/vim-lightline-coc"
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
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
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
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1Ä4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0¿\bset\vkeymap\bvim\vbuffer1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1¿\6~\rdiffthisç\6\1\1\b\0)\0[6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0005\5\4\0'\6\5\0'\a\6\0B\3\4\1\18\3\2\0005\5\a\0'\6\b\0'\a\t\0B\3\4\1\18\3\2\0'\5\n\0'\6\v\0'\a\f\0B\3\4\1\18\3\2\0'\5\n\0'\6\r\0009\a\14\1B\3\4\1\18\3\2\0'\5\n\0'\6\15\0009\a\16\1B\3\4\1\18\3\2\0'\5\n\0'\6\17\0009\a\18\1B\3\4\1\18\3\2\0'\5\n\0'\6\19\0009\a\20\1B\3\4\1\18\3\2\0'\5\n\0'\6\21\0009\a\22\1B\3\4\1\18\3\2\0'\5\n\0'\6\23\0009\a\24\1B\3\4\1\18\3\2\0'\5\n\0'\6\25\0009\a\26\1B\3\4\1\18\3\2\0'\5\n\0'\6\27\0009\a\28\1B\3\4\1\18\3\2\0'\5\n\0'\6\29\0003\a\30\0B\3\4\1\18\3\2\0'\5\n\0'\6\31\0009\a\28\1B\3\4\1\18\3\2\0'\5\n\0'\6 \0009\a!\1B\3\4\1\18\3\2\0'\5\n\0'\6\"\0003\a#\0B\3\4\1\18\3\2\0'\5\n\0'\6$\0009\a%\1B\3\4\1\18\3\2\0005\5&\0'\6'\0'\a(\0B\3\4\0012\0\0ÄK\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\19toggle_deleted\15<leader>td\0\15<leader>hD\rdiffthis\15<leader>hd\15<leader>tb\0\15<leader>hb\30toggle_current_line_blame\a¬ª\15stage_hunk\aŒì\14prev_hunk\a¬∫\14next_hunk\a¬¨\17preview_hunk\agp\17reset_buffer\15<leader>hR\20undo_stage_hunk\agu\17stage_buffer\bgfs\28:Gitsigns show_hunk<CR>\agh\6n\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\3\0\0\6n\6v\0\rgitsigns\vloaded\fpackage’\a\1\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\19preview_config\1\0\5\vborder\vsingle\bcol\3\1\brow\3\0\rrelative\vcursor\nstyle\fminimal\28current_line_blame_opts\1\0\4\22ignore_whitespace\1\ndelay\3Ë\a\18virt_text_pos\beol\14virt_text\2\17watch_gitdir\1\0\2\rinterval\3Ë\a\17follow_files\2\nsigns\17changedelete\1\0\4\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\6~\14topdelete\1\0\4\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\b‚Äæ\vdelete\1\0\4\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\6_\vchange\1\0\4\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\b‚îÇ\badd\1\0\0\1\0\4\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\ttext\b‚îÇ\14on_attach\1\0\n\nnumhl\1!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\20max_file_length\3¿∏\2\23current_line_blame\1\24attach_to_untracked\2\vlinehl\1\15signcolumn\2\14word_diff\1\20update_debounce\3d\18sign_priority\3\6\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n‰\1\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0024\3\0\0=\3\n\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\15treesitter\2\fcontext\3\n\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\2\rinactive\1\nalpha\4\0ÄÄ¿˛\3\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n◊\3\0\0\6\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0005\5\16\0=\5\17\4=\4\18\3=\3\19\0024\3\0\0=\3\20\2B\0\2\1K\0\1\0\15extensions\fpickers\14live_grep\18layout_config\1\0\4\20prompt_position\vbottom\vheight\4ÊÃô≥\6ÊÃπˇ\3\vmirror\2\17scroll_speed\3\1\1\0\1\20layout_strategy\rvertical\14old_files\1\0\1\ntheme\rdropdown\14git_files\1\0\0\1\0\1\ntheme\rdropdown\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\1\0\4\a¬™\26cycle_previewers_prev\n<C-j>\24move_selection_next\f<C-s-j>\26cycle_previewers_next\n<C-k>\28move_selection_previous\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rmappings\1\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\nÉ\1\0\0\5\0\b\0\0146\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0024\3\0\0=\3\5\0029\2\6\0009\4\a\1B\2\2\1K\0\1\0\vconfig\nsetup\bval\vheader\fsection\26alpha.themes.startify\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType toml ++once lua require("packer.load")({'vim-toml'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'vim-json'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType llvm ++once lua require("packer.load")({'llvm.vim'}, { ft = "llvm" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'limelight.vim', 'vim-illuminate', 'vim-markdown', 'vim-table-mode', 'goyo.vim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType ocaml ++once lua require("packer.load")({'merlin'}, { ft = "ocaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'limelight.vim', 'vim-illuminate', 'vim-table-mode', 'goyo.vim'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'limelight.vim', 'vim-illuminate', 'vim-table-mode', 'goyo.vim'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType menhir ++once lua require("packer.load")({'vim-menhir'}, { ft = "menhir" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'vim-argwrap', 'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'vim-zsh'}, { ft = "zsh" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/llvm-lit.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/llvm-lit.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/llvm-lit.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/llvm.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/llvm.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/llvm.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/tablegen.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/tablegen.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/llvm.vim/ftdetect/tablegen.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-menhir/after/ftdetect/menhir.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-menhir/after/ftdetect/menhir.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-menhir/after/ftdetect/menhir.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], false)
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], true)
vim.cmd [[source /Users/klasseg/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
time([[Sourcing ftdetect script at: /Users/klasseg/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], false)
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
