vim.cmd('packadd packer.nvim')

return require('packer').startup(function(use)
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
        file_ignore_patterns = { "%.o" }
      }
    end
  }
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
      require('Comment').setup {
        mappings = false
      }
    end
  }
  use {
    "catppuccin/nvim",
    as = "catppuccin",
  }
  use 'github/copilot.vim'
  use 'itchyny/lightline.vim'
  use 'andymass/vim-matchup' -- Better matchings
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
  -- use { ft = { 'ocaml' }, 'ocaml/merlin' }
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
      cmp.setup {
        enabled = function()
          return (not (require("cmp.config.context").in_treesitter_capture("comment")))
              and (not (require("cmp.config.context").in_syntax_group("Comment")))
        end,
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = cmp.config.sources {
          { name = 'path' },
          { name = 'nvim_lsp', keyword_length = 3 },
          { name = 'buffer' },
          { name = 'vsnip', keyword_length = 2 },
        },
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
      }
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

      require('mason-lspconfig').setup {
        ensure_installed = {
          'sumneko_lua',
          'rust_analyzer@nightly',
          'ocamllsp'
        }
      }
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('mason-lspconfig').setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = function(_, bufnr)
              local opts = { noremap = true, silent = true, buffer = bufnr }
              vim.keymap.set('n', 't', vim.lsp.buf.definition, opts)
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
              vim.keymap.set('n', 'É', vim.lsp.buf.references, opts) -- <D-e>
              vim.keymap.set('n', 'Θ', vim.lsp.buf.declaration, opts) -- <D-u>
              vim.keymap.set('n', 'Ü', vim.lsp.buf.type_definition, opts) -- <D-u>
              vim.keymap.set('n', 'ˆ', vim.lsp.buf.implementation, opts) -- <D-i>
              vim.keymap.set('n', '˘', vim.lsp.buf.signature_help, opts) -- <D-h>
              vim.keymap.set('n', '◊', vim.lsp.buf.code_action, opts) -- <D-a>
              vim.keymap.set('n', '+', function() vim.lsp.buf.format { async = true } end, opts)
              vim.keymap.set('n', '<C-k>',
                function() vim.diagnostic.goto_prev { float = { header = false, border = "rounded" }, wrap = false } end
                , opts)
              vim.keymap.set('n', '<C-j>',
                function() vim.diagnostic.goto_next { float = { header = false, border = "rounded" }, wrap = false } end
                , opts)
              vim.keymap.set('n', 'Λ', function()
                for _, win in pairs(vim.fn.getwininfo()) do
                  if win['quickfix'] == 1 then
                    -- If quickfix is already open, close it
                    vim.cmd 'cclose'
                    return
                  end
                end
                -- Otherwise, open it
                vim.diagnostic.setqflist()
                vim.cmd('wincmd p')
              end, opts)
              local cmp = require('cmp')
              vim.keymap.set('i', '∧', function() cmp.scroll_docs(-4) end, opts)
              vim.keymap.set('i', '¬', function() cmp.scroll_docs(4) end, opts)
              -- vim.keymap.set('i', '<CR>', function() cmp.confirm { select = false } end, opts)
              vim.keymap.set('i', '<C-j>', function() cmp.select_next_item() end, opts)
              vim.keymap.set('i', '<C-k>', function() cmp.select_prev_item() end, opts)
              vim.keymap.set('i', '<C-e>', function() cmp.abort() end, opts)
              vim.keymap.set('i', '<CR>', function()
                if cmp.visible() then
                  cmp.confirm { select = true }
                else
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n")
                end
              end, opts)
              vim.keymap.set('i', '<Tab>', function()
                if cmp.visible() then
                  cmp.select_next_item()
                else
                  vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true))
                    , 'n', true)
                  -- fallback()
                  -- vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
                end
              end, opts)
              vim.keymap.set('i', '<S-Tab>', function()
                if cmp.visible() then
                  cmp.select_prev_item()
                else
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<BS>", true, true, true), "n")
                end
              end, opts)

              vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                { underline = true, update_in_insert = false, }
              )
              vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                vim.lsp.handlers.hover,
                { border = 'rounded' }
              )
              if server_name == 'rust_analyzer' then
                require('rust-tools').setup {}
              elseif server_name == 'sumneko_lua' then
                require('lspconfig')['sumneko_lua'].setup { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } }
              end

              --vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'LspReferenceText', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'LspDiagnosticsUnderlineInformation', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'LspDiagnosticsUnderlineWarning', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'LspDiagnosticsUnderlineError', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'LspDiagnosticsUnderlineHint', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'DiagnosticFloatingError', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'DiagnosticFloatingWarn', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'DiagnosticFloatingHint', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'DiagnosticFloatingInfo', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'DiagnosticError', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'DiagnosticWarn', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'DiagnosticHint', { link = 'Error' })
              --vim.api.nvim_set_hl(0, 'DiagnosticInfo', { link = 'Error' })
              vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Float' })
            end,
          }
        end,
      }
    end
  }
  use 'neovim/nvim-lspconfig'
end)
