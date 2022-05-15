-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
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
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1Ä4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0¿\bset\vkeymap\bvim\vbuffer1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1¿\6~\rdiffthisç\6\1\1\b\0)\0[6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0005\5\4\0'\6\5\0'\a\6\0B\3\4\1\18\3\2\0005\5\a\0'\6\b\0'\a\t\0B\3\4\1\18\3\2\0'\5\n\0'\6\v\0'\a\f\0B\3\4\1\18\3\2\0'\5\n\0'\6\r\0009\a\14\1B\3\4\1\18\3\2\0'\5\n\0'\6\15\0009\a\16\1B\3\4\1\18\3\2\0'\5\n\0'\6\17\0009\a\18\1B\3\4\1\18\3\2\0'\5\n\0'\6\19\0009\a\20\1B\3\4\1\18\3\2\0'\5\n\0'\6\21\0009\a\22\1B\3\4\1\18\3\2\0'\5\n\0'\6\23\0009\a\24\1B\3\4\1\18\3\2\0'\5\n\0'\6\25\0009\a\26\1B\3\4\1\18\3\2\0'\5\n\0'\6\27\0009\a\28\1B\3\4\1\18\3\2\0'\5\n\0'\6\29\0003\a\30\0B\3\4\1\18\3\2\0'\5\n\0'\6\31\0009\a\28\1B\3\4\1\18\3\2\0'\5\n\0'\6 \0009\a!\1B\3\4\1\18\3\2\0'\5\n\0'\6\"\0003\a#\0B\3\4\1\18\3\2\0'\5\n\0'\6$\0009\a%\1B\3\4\1\18\3\2\0005\5&\0'\6'\0'\a(\0B\3\4\0012\0\0ÄK\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\19toggle_deleted\15<leader>td\0\15<leader>hD\rdiffthis\15<leader>hd\15<leader>tb\0\15<leader>hb\30toggle_current_line_blame\a¬ª\15stage_hunk\aŒì\14prev_hunk\a¬∫\14next_hunk\a¬¨\17preview_hunk\agp\17reset_buffer\15<leader>hR\20undo_stage_hunk\agu\17stage_buffer\bgfs\28:Gitsigns show_hunk<CR>\agh\6n\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\3\0\0\6n\6v\0\rgitsigns\vloaded\fpackage’\a\1\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\19preview_config\1\0\5\bcol\3\1\brow\3\0\rrelative\vcursor\nstyle\fminimal\vborder\vsingle\28current_line_blame_opts\1\0\4\ndelay\3Ë\a\18virt_text_pos\beol\14virt_text\2\22ignore_whitespace\1\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3Ë\a\nsigns\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\6~\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\b‚Äæ\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\6_\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\b‚îÇ\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\ttext\b‚îÇ\vlinehl\18GitSignsAddLn\14on_attach\1\0\n\nnumhl\1\23current_line_blame\1\24attach_to_untracked\2\vlinehl\1\20max_file_length\3¿∏\2\14word_diff\1\15signcolumn\2\20update_debounce\3d\18sign_priority\3\6!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nŒ\1\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\0024\3\0\0=\3\n\0024\3\0\0=\3\v\2B\0\2\1K\0\1\0\15extensions\fpickers\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\1\0\2\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n‰\1\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0024\3\0\0=\3\n\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\fcontext\3\n\15treesitter\2\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\2\rinactive\1\nalpha\4\0ÄÄ¿˛\3\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/klasseg/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nŒ\1\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\0024\3\0\0=\3\n\0024\3\0\0=\3\v\2B\0\2\1K\0\1\0\15extensions\fpickers\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\1\0\2\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1Ä4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0¿\bset\vkeymap\bvim\vbuffer1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1¿\6~\rdiffthisç\6\1\1\b\0)\0[6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0005\5\4\0'\6\5\0'\a\6\0B\3\4\1\18\3\2\0005\5\a\0'\6\b\0'\a\t\0B\3\4\1\18\3\2\0'\5\n\0'\6\v\0'\a\f\0B\3\4\1\18\3\2\0'\5\n\0'\6\r\0009\a\14\1B\3\4\1\18\3\2\0'\5\n\0'\6\15\0009\a\16\1B\3\4\1\18\3\2\0'\5\n\0'\6\17\0009\a\18\1B\3\4\1\18\3\2\0'\5\n\0'\6\19\0009\a\20\1B\3\4\1\18\3\2\0'\5\n\0'\6\21\0009\a\22\1B\3\4\1\18\3\2\0'\5\n\0'\6\23\0009\a\24\1B\3\4\1\18\3\2\0'\5\n\0'\6\25\0009\a\26\1B\3\4\1\18\3\2\0'\5\n\0'\6\27\0009\a\28\1B\3\4\1\18\3\2\0'\5\n\0'\6\29\0003\a\30\0B\3\4\1\18\3\2\0'\5\n\0'\6\31\0009\a\28\1B\3\4\1\18\3\2\0'\5\n\0'\6 \0009\a!\1B\3\4\1\18\3\2\0'\5\n\0'\6\"\0003\a#\0B\3\4\1\18\3\2\0'\5\n\0'\6$\0009\a%\1B\3\4\1\18\3\2\0005\5&\0'\6'\0'\a(\0B\3\4\0012\0\0ÄK\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\19toggle_deleted\15<leader>td\0\15<leader>hD\rdiffthis\15<leader>hd\15<leader>tb\0\15<leader>hb\30toggle_current_line_blame\a¬ª\15stage_hunk\aŒì\14prev_hunk\a¬∫\14next_hunk\a¬¨\17preview_hunk\agp\17reset_buffer\15<leader>hR\20undo_stage_hunk\agu\17stage_buffer\bgfs\28:Gitsigns show_hunk<CR>\agh\6n\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\3\0\0\6n\6v\0\rgitsigns\vloaded\fpackage’\a\1\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\19preview_config\1\0\5\bcol\3\1\brow\3\0\rrelative\vcursor\nstyle\fminimal\vborder\vsingle\28current_line_blame_opts\1\0\4\ndelay\3Ë\a\18virt_text_pos\beol\14virt_text\2\22ignore_whitespace\1\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3Ë\a\nsigns\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\6~\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\b‚Äæ\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\6_\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\b‚îÇ\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\ttext\b‚îÇ\vlinehl\18GitSignsAddLn\14on_attach\1\0\n\nnumhl\1\23current_line_blame\1\24attach_to_untracked\2\vlinehl\1\20max_file_length\3¿∏\2\14word_diff\1\15signcolumn\2\20update_debounce\3d\18sign_priority\3\6!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n‰\1\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0024\3\0\0=\3\n\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\fcontext\3\n\15treesitter\2\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\2\rinactive\1\nalpha\4\0ÄÄ¿˛\3\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
