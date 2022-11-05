-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
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
  -- use {
  --   "folke/noice.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("noice").setup()
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        on_attach                    = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Actions
          map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', 'gh', ':Gitsigns show_hunk<CR>')
          map('n', 'gfs', gs.stage_buffer)
          map('n', 'gu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', 'gp', gs.preview_hunk)
          map('n', '¬', gs.next_hunk) -- <D-j>
          map('n', 'º', gs.prev_hunk) -- <D-k>
          map('n', 'Γ', gs.stage_hunk) -- <D-k>
          map('n', '»', gs.toggle_current_line_blame) -- <D-b>
          map('n', '<leader>hb', function() gs.blame_line { full = true } end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end,
        signs                        = {
          add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
          change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        },
        signcolumn                   = true,
        numhl                        = false,
        linehl                       = false,
        word_diff                    = false,
        watch_gitdir                 = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked          = true,
        current_line_blame           = false,
        current_line_blame_opts      = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil,
        max_file_length              = 40000,
        preview_config               = {
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
  -- use 'rcarriga/nvim-notify'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = "move_selection_previous",
              ["<C-j>"] = "move_selection_next",
              ["ª"] = "cycle_previewers_prev", -- <C-S-k>
              ["<C-s-j>"] = "cycle_previewers_next", -- <C-S-j>
            }
          }
        },
        pickers = {
          git_files = {
            theme = 'dropdown'
          },
          old_files = {
            theme = 'dropdown'
          },
          live_grep = {
            layout_strategy = 'vertical',
            layout_config = {
              height = 0.95,
              prompt_position = 'bottom',
              mirror = true,
              scroll_speed = 1
            },
          }
        },
        extensions = {},
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
  -- [Color-Schemes]
  use 'nlknguyen/papercolor-theme'

  -- [Libraries]
  use 'vim-scripts/ingo-library' -- Blockwise-repeat
  use 'mattn/webapi-vim' -- Needed by vim-gist

  -- [My Plugins]
  -- use '/Users/Klas/Workspace/vim/vim-sentencer'
  -- use '/Users/Klas/Workspace/vim/vim-stealth'
  use 'segeljakt/vim-isotope'
  use 'segeljakt/vim-silicon'
  use '~/Workspace/vim-commando'
  use '~/Workspace/arc/arc-lang/editor/vim/'

  use 'kyazdani42/nvim-web-devicons'
  use {
    'goolord/alpha-nvim',
    config = function()
      local alpha = require 'alpha'
      local startify = require 'alpha.themes.startify'
      startify.section.header.val = {}
      alpha.setup(startify.config)
    end
  }
  use {
    'ldelossa/litee.nvim'
  }
  -- use {
  --   'ldelossa/gh.nvim',
  --   requires = { { 'ldelossa/litee.nvim' } },
  --   config = function()
  --     require('litee.lib').setup({})
  --     require('litee.gh').setup({})
  --   end
  -- }

  -- [General-purpose]
  -- use 'josa42/vim-lightline-coc'
  use 'itchyny/vim-highlighturl'
  use 'flwyd/vim-conjoin'
  use 'vim-utils/vim-troll-stopper'
  use 'ryanoasis/vim-devicons'
  use 'farmergreg/vim-lastplace'
  use 'simeji/winresizer' -- Window management
  use 'rhysd/git-messenger.vim'
  use 'ruanyl/vim-gh-line'
  use 'godlygeek/tabular' -- Align stuff
  use 'zirrostig/vim-schlepp' -- Drag visual block and visual line
  use 'mbbill/undotree' -- Undo history
  use 'danro/rename.vim' -- Rename current buffer
  use 'moll/vim-bbye' -- Delete buffers and close files
  use 'nelstrom/vim-visual-star-search' -- Search by visual block
  use 'machakann/vim-sandwich' -- Change surrounding parentheses
  use 'vim-scripts/visualrepeat' -- Repeat . for visual mode
  use 'tpope/vim-repeat' -- Improved '.'
  use 'tpope/vim-abolish' -- iabbrev, %S, snake_case => camelCase
  use 'tpope/vim-fugitive' -- Git essentials
  use 'romainl/vim-cool' -- Turn off hlsearch
  use 'tmsvg/pear-tree' -- Auto-pairs but better
  use 'bkad/camelcasemotion' -- camelCaseMotion and snake_case_motion
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        mappings = false
      })
    end
  }
  use {
    "catppuccin/nvim",
    as = "catppuccin",
  }
  use 'github/copilot.vim' -- AI Overlords
  use 'itchyny/lightline.vim'
  use 'andymass/vim-matchup' -- Better matching
  use 'lervag/vimtex'
  use 'ron89/thesaurus_query.vim'
  -- use 'SirVer/ultisnips'
  -- use 'honza/vim-snippets'

  use 'andrewradev/sideways.vim' -- Move arguments sideways
  use 'rktjmp/highlight-current-n.nvim'

  -- [Filetype specific]
  use { ft = { 'markdown' }, 'plasticboy/vim-markdown' }
  use { ft = { 'markdown', 'tex', 'latex' }, 'junegunn/limelight.vim' } -- Fade adjacent paragraphs
  use { ft = { 'markdown', 'tex', 'latex' }, 'junegunn/goyo.vim' } -- Distraction-less mode
  use { ft = { 'markdown', 'tex', 'latex' }, 'dhruvasagar/vim-table-mode' } -- Draw tables
  use { ft = { 'markdown', 'tex', 'latex' }, 'rrethy/vim-illuminate' } -- Highlight word under cursor
  -- use { ft = { 'rust' }, 'xiyaowong/nvim-cursorword' }
  use { ft = { 'menhir' }, 'elliottcable/vim-menhir' }
  use { ft = { 'rust' }, 'rust-lang/rust.vim' }
  use { ft = { 'json' }, 'elzr/vim-json' }
  use { ft = { 'toml' }, 'cespare/vim-toml' }
  use { ft = { 'llvm' }, 'tie/llvm.vim' }
  use { ft = { 'ocaml' }, 'ocaml/merlin' }
  use { ft = { 'zsh' }, 'chrisbra/vim-zsh' }
  -- use { 'neoclide/coc.nvim', branch = 'release' }
  use { ft = { 'rust' }, 'foosoft/vim-argwrap' } -- Wrap/unwrap arguments
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        source = cmp.config.sources({
          { name = 'path' },
          { name = 'nvim_lsp', keyword_length = 3 },
          { name = 'buffer', keyword_length = 3 },
          { name = 'vsnip', keyword_length = 2 },
        }),
        formatting = {
          fields = { 'menu', 'abbr', 'kind' },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
            }

            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
      })
      -- cmp.setup.cmdline('/', {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = {
      --     { name = 'buffer' }
      --   }
      -- })
      -- cmp.setup.cmdline(':', {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = cmp.config.sources({
      --     { name = 'path' }
      --   }, {
      --     { name = 'cmdline' }
      --   })
      -- })
    end
  }

  use 'simrat39/rust-tools.nvim'

  -- use { 'ms-jpq/coq_nvim', run = 'python3 -m coq deps' }
  -- use 'ms-jpq/coq.artifacts'
  -- use 'ms-jpq/coq.thirdparty'
  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  }
  use {
    'williamboman/mason-lspconfig.nvim',
    after = 'mason.nvim',
    config = function()

      require('mason-lspconfig').setup({
        ensure_installed = { 'sumneko_lua', 'rust_analyzer@nightly', 'ocamllsp' }
      })
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local float_opts = { header = false }
      require('mason-lspconfig').setup_handlers({
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = function(client_name, bufnr)
              local bufopts = { noremap = true, silent = true, buffer = bufnr }
              vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
              vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
              vim.keymap.set('n', 'c<C-k>', vim.lsp.buf.signature_help, bufopts)
              vim.keymap.set('n', 'cwl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
              end, bufopts)
              vim.keymap.set('n', 'Θ', vim.lsp.buf.type_definition, bufopts)
              vim.keymap.set('n', '√', vim.lsp.buf.rename, bufopts)
              vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, bufopts)
              vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
              vim.keymap.set('n', '+', function() vim.lsp.buf.format { async = true } end, bufopts)
              vim.keymap.set('n', '<C-k>', function() vim.diagnostic.goto_prev({ float = float_opts }) end, bufopts)
              vim.keymap.set('n', '<C-j>', function() vim.diagnostic.goto_next({ float = float_opts }) end, bufopts)
              vim.keymap.set('n', 'cq', vim.diagnostic.setloclist, bufopts)
              vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                {
                  underline = true,
                  update_in_insert = false,
                }
              )
              if server_name == 'rust_analyzer' then
                require("rust-tools").setup {}
              end
              if server_name == 'sumneko_lua' then
                require('lspconfig')['sumneko_lua'].setup { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } }
              end

              hl('LspReferenceRead', { link = 'Error' })
              hl('LspReferenceText', { link = 'Error' })
              hl('LspReferenceWrite', { link = 'Error' })
              hl('LspDiagnosticsUnderlineInformation', { link = 'Error' })
              hl('LspDiagnosticsUnderlineWarning', { link = 'Error' })
              hl('LspDiagnosticsUnderlineError', { link = 'Error' })
              hl('LspDiagnosticsUnderlineHint', { link = 'Error' })
              hl('DiagnosticFloatingError', { link = 'Error' })
              hl('DiagnosticFloatingWarn', { link = 'Error' })
              hl('DiagnosticFloatingHint', { link = 'Error' })
              hl('DiagnosticFloatingInfo', { link = 'Error' })
              hl('DiagnosticUnderlineError', { link = 'Error' })
              hl('DiagnosticUnderlineWarn', { link = 'Error' })
              hl('DiagnosticUnderlineHint', { link = 'Error' })
              hl('DiagnosticUnderlineInfo', { link = 'Error' })
              hl('DiagnosticError', { link = 'Error' })
              hl('DiagnosticWarn', { link = 'Error' })
              hl('DiagnosticHint', { link = 'Error' })
              hl('DiagnosticInfo', { link = 'Error' })
            end,
          }
        end,
      })
    end
  }
  use 'neovim/nvim-lspconfig'

  -- [Teaching]
  -- use 'hyhugh/coc-erlang_ls', {'do': 'yarn install --frozen-lockfile'}
end)
