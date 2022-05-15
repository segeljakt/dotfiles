-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup {
        dimming = {
          alpha = 0.25,
          color = { 'Normal', '#ffffff' },
          inactive = false,
        },
        context = 10,
        treesitter = true,
        expand = {
          'function',
          'method',
          'table',
          'if_statement',
        },
        exclude = {},
      }
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup{
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Actions
          map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', 'gh', ':Gitsigns show_hunk<CR>')
          map('n', 'gfs', gs.stage_buffer)
          map('n', 'gu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', 'gp', gs.preview_hunk)
          map('n', '¬', gs.next_hunk) -- <D-j>
          map('n', 'º', gs.prev_hunk) -- <D-k>
          map('n', 'Γ', gs.stage_hunk) -- <D-k>
          map('n', '»', gs.toggle_current_line_blame) -- <D-b>
          map('n', '<leader>hb', function() gs.blame_line{full=true} end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end,
        signs = {
          add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
          change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
          delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
          topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
          changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        },
        signcolumn = true,  
        numhl      = false, 
        linehl     = false, 
        word_diff  = false, 
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false, 
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
      }
    end
  }
  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }
  use 'andweeb/presence.nvim'
  use 'rcarriga/nvim-notify'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ["<C-k>"] = "move_selection_previous",
              ["<C-j>"] = "move_selection_next"
            }
          }
        },
        pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
        },
        extensions = {
          -- Your extension configuration goes here:
          -- extension_name = {
          --   extension_config_key = value,
          -- }
          -- please take a look at the readme of the extension you want to configure
        }
      }
    end
  }
--   use {
--     'stevearc/dressing.nvim',
--     config = function()
--       require('dressing').setup({
--         input = {
--           enabled = true,
--           default_prompt = "Input:",
--           prompt_align = "left",
--           insert_only = true,
--           anchor = "SW",
--           border = "rounded",
--           relative = "cursor",
--           prefer_width = 40,
--           width = nil,
--           max_width = { 140, 0.9 },
--           min_width = { 20, 0.2 },
--           winblend = 10,
--           winhighlight = "",
--           override = function(conf)
--             return conf
--           end,
--           get_config = nil,
--         },
--         select = {
--           enabled = true,
--           backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
--           telescope = nil,
--           fzf = {
--             window = {
--               width = 0.5,
--               height = 0.4,
--             },
--           },
--           fzf_lua = {
--             winopts = {
--               width = 0.5,
--               height = 0.4,
--             },
--           },
--           nui = {
--             position = "50%",
--             size = nil,
--             relative = "editor",
--             border = {
--               style = "rounded",
--             },
--             max_width = 80,
--             max_height = 40,
--           },
--           builtin = {
--             anchor = "NW",
--             border = "rounded",
--             relative = "editor",
--             winblend = 10,
--             winhighlight = "",
--             width = nil,
--             max_width = { 140, 0.8 },
--             min_width = { 40, 0.2 },
--             height = nil,
--             max_height = 0.9,
--             min_height = { 10, 0.2 },
--
--             override = function(conf)
--               return conf
--             end,
--           },
--           format_item_override = {},
--           get_config = nil,
--         },
--       })
--
--     end
--   }
end)
