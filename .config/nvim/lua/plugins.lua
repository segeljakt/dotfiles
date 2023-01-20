vim.cmd('packadd packer.nvim')

local opt = { noremap = true, silent = true }
local opt_plug = { noremap = false, silent = true, nowait = true }
local opt_expr = { noremap = true, silent = false, nowait = true, expr = true }

return require('packer').startup({ function(use)
  use 'wbthomason/packer.nvim'
  use {
    'notjedi/nvim-rooter.lua',
    config = function()
      require('nvim-rooter').setup {
        update_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true
        },
        rooter_patterns = { '.git', '.hg', '.svn', 'Cargo.toml' },
        trigger_patterns = { '*' },
        manual = false,
      }
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs                        = {
          add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
          change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          untracked    = { hl = 'GitSignsAdd', text = '┆', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
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

      local gs = package.loaded.gitsigns

      -- Actions
      vim.keymap.set({ 'n', 'v' }, '<leader>hs', '<Cmd>Gitsigns stage_hunk<CR>', opt)
      vim.keymap.set({ 'n', 'v' }, '<leader>hr', '<Cmd>Gitsigns reset_hunk<CR>', opt)
      vim.keymap.set('n', 'gh', '<Cmd>Gitsigns show_hunk<CR>', opt)
      vim.keymap.set('n', 'gfs', gs.stage_buffer, opt)
      vim.keymap.set('n', 'gu', gs.undo_stage_hunk, opt)
      vim.keymap.set('n', '<leader>hR', gs.reset_buffer, opt)
      vim.keymap.set('n', 'gp', gs.preview_hunk, opt)
      vim.keymap.set('n', '¬', gs.next_hunk, opt) -- <D-j>
      vim.keymap.set('n', 'º', gs.prev_hunk, opt) -- <D-k>
      vim.keymap.set('n', 'Γ', gs.stage_hunk, opt) -- <D-k>
      vim.keymap.set('n', '»', gs.toggle_current_line_blame, opt) -- <D-b>
      vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end, opt)
      vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, opt)
      vim.keymap.set('n', '<leader>hd', gs.diffthis, opt)
      vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, opt)
      vim.keymap.set('n', '<leader>td', gs.toggle_deleted, opt)

      -- Text object
      vim.keymap.set({ 'o', 'x' }, 'ih', '<Cmd><C-U>Gitsigns select_hunk<CR>', opt)
    end
  }
  use 'andweeb/presence.nvim'
  -- use 'rcarriga/nvim-notify'
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')
      telescope.setup {
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
      vim.keymap.set('n', '<C-p>', builtin.live_grep, opt)
      vim.keymap.set('n', '<C-S-r>', builtin.grep_string, opt)
      vim.keymap.set('n', 'ı', builtin.git_files, opt) -- <C-i>
      vim.keymap.set('n', '<C-S-t>', builtin.treesitter, opt)
      vim.keymap.set('n', '<C-u>', builtin.oldfiles, opt)
      vim.keymap.set('n', '<C-Space>', builtin.buffers, opt)
      vim.keymap.set('n', '<C-S-c>', builtin.git_commits, opt)
      vim.keymap.set('n', '<C-S-b>', builtin.git_branches, opt)
      vim.keymap.set('n', '<C-S-s>', builtin.lsp_workspace_symbols, opt)
      vim.keymap.set('n', 'Fh', builtin.help_tags, opt)
      vim.keymap.set('n', 'FH', builtin.highlights, opt)
      vim.keymap.set('n', 'Fi', builtin.lsp_implementations, opt)
      vim.keymap.set('n', 'Φ', builtin.jumplist, opt)
    end
  }
  -- [Colorschemes]
  use {
    'nlknguyen/papercolor-theme',
    config = function()
      vim.opt.background = 'light'
      vim.opt.termguicolors = true
      vim.cmd('colorscheme PaperColor')
    end
  }
  -- [Libraries]
  use 'vim-scripts/ingo-library' -- Blockwise-repeat

  -- [My Plugins]
  use 'segeljakt/vim-isotope'
  use {
    'segeljakt/vim-silicon',
    config = function()
      vim.api.nvim_set_var("silicon", [[{
          \ 'theme': 'GitHub',
          \ 'background': '#FFFFFF',
          \ 'line-pad': 1,
          \ 'pad-horiz': 0,
          \ 'pad-vert': 0,
          \ 'line-number': v:false,
          \ 'window-controls': v:false,
          \ 'to-clipboard': v:true,
          \ 'output': '~/Desktop/silicon_{time:%Y-%m-%d_%H-%M-%S}.png',
          \ }
      ]])
    end
  }
  use '~/Workspace/vim-commando'
  use '~/Workspace/arc/arc-lang/editor/vim/'

  use 'kyazdani42/nvim-web-devicons'
  use {
    'goolord/alpha-nvim',
    config = function()
      local alpha = require('alpha')
      local startify = require('alpha.themes.startify')
      startify.section.header.val = {}
      alpha.setup(startify.config)
    end
  }

  -- [General-purpose]
  use 'itchyny/vim-highlighturl'
  use {
    'flwyd/vim-conjoin',
    config = function()
      vim.api.nvim_set_var('conjoin_map_J', '<Leader>z')
    end
  }
  use 'vim-utils/vim-troll-stopper'
  use 'ryanoasis/vim-devicons'
  use 'farmergreg/vim-lastplace'
  use {
    'simeji/winresizer', -- Window management
    config = function()
      vim.api.nvim_set_var('winresizer_start_key', '<C-w>,')
    end
  }
  use 'rhysd/git-messenger.vim'
  use 'ruanyl/vim-gh-line'
  use {
    'godlygeek/tabular', -- Align stuff
    config = function()
      vim.keymap.set('x', '?', "mode()=~'V' ? ':Tabularize' : '?'", opt_expr)
    end
  }
  use {
    'zirrostig/vim-schlepp',
    config = function()
      vim.keymap.set('v', 'H', '<Plug>SchleppLeft', opt_plug)
      vim.keymap.set('v', 'J', '<Plug>SchleppDown', opt_plug)
      vim.keymap.set('v', 'K', '<Plug>SchleppUp', opt_plug)
      vim.keymap.set('v', 'L', '<Plug>SchleppRight', opt_plug)
      vim.keymap.set('v', 'D', '<Plug>SchleppDup', opt_plug)
      vim.keymap.set('v', 'D', '<Plug>SchleppDup', opt_plug)
      vim.api.nvim_set_var('Schlepp#reindent', 1)
    end
  } -- Drag visual block and visual line
  use 'mbbill/undotree' -- Undo history
  use 'danro/rename.vim' -- Rename current buffer
  use {
    'moll/vim-bbye', -- Delete buffers and close files
    config = function()
      vim.keymap.set('n', 'Å', '<Cmd>Bdelete!<CR>', opt)
    end
  }
  use 'nelstrom/vim-visual-star-search' -- Search by visual block
  use {
    'machakann/vim-sandwich', -- Change surrounding parentheses
    config = function()
      vim.cmd [[
        let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
        let g:sandwich#recipes += [
              \   {
              \     'buns'        : ['{', '}'],
              \     'motionwise'  : ['line'],
              \     'kind'        : ['add'],
              \     'linewise'    : 1,
              \     'command'     : ["'[+1,']-1normal! >>"],
              \   },
              \   {
              \     'buns'        : ['{', '}'],
              \     'motionwise'  : ['line'],
              \     'kind'        : ['delete'],
              \     'linewise'    : 1,
              \     'command'     : ["'[,']normal! <<"],
              \   }
              \ ]
        ]]
    end
  }
  use 'vim-scripts/visualrepeat' -- Repeat . for visual mode
  use 'tpope/vim-repeat' -- Improved '.'
  use 'tpope/vim-abolish' -- iabbrev, %S, snake_case => camelCase
  use 'tpope/vim-fugitive' -- Git essentials
  use { -- Turn off hlsearch
    'asiryk/auto-hlsearch.nvim',
    config = function()
      require('auto-hlsearch').setup {
        remap_keys = { "/", "?", "*", "#", "n", "N" },
        create_commands = true,
      }
    end
  }
  use {
    "princejoogie/chafa.nvim", -- View images and gifs
    requires = {
      "nvim-lua/plenary.nvim",
      "m00qek/baleia.nvim"
    },
    config = function()
      require("chafa").setup {
        render = {
          min_padding = 5,
          show_label = true,
        },
        events = {
          update_on_nvim_resize = true,
        },
      }
    end
  }
  use {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup {}
      vim.keymap.set('n', 'cp', '<Cmd>ChatGPT<CR>', opt)
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }
  -- Motion
  use {
    'bkad/camelcasemotion', -- camelCaseMotion and snake_case_motion
    config = function()
      vim.keymap.set('', 'w', '<Plug>CamelCaseMotion_w', opt_plug)
      vim.keymap.set('', 'b', '<Plug>CamelCaseMotion_b', opt_plug)
      vim.keymap.set('', 'e', '<Plug>CamelCaseMotion_e', opt_plug)
    end
  }
  -- Commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        mappings = false
      }
      vim.keymap.set('n', 'q', '<Plug>(comment_toggle_linewise_current)', opt_plug)
      vim.keymap.set('v', 'q', '<Plug>(comment_toggle_linewise_visual)', opt_plug)
    end
  }
  -- Statusline
  -- use {
  --   'nvim-lualine/lualine.nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  --   config = function()
  --     require('lualine').setup {
  --       options = {
  --         icons_enabled = true,
  --         theme = 'PaperColor',
  --         component_separators = { left = '', right = '' },
  --         section_separators = { left = '', right = '' },
  --         disabled_filetypes = {
  --           statusline = {},
  --           winbar = {},
  --         },
  --         ignore_focus = {},
  --         always_divide_middle = true,
  --         globalstatus = false,
  --         refresh = {
  --           statusline = 1000,
  --           tabline = 1000,
  --           winbar = 1000,
  --         }
  --       },
  --       sections = {
  --         lualine_a = { 'mode' },
  --         lualine_b = { 'branch', 'diff', 'diagnostics' },
  --         lualine_c = { 'filename' },
  --         lualine_x = { 'encoding', 'fileformat', 'filetype' },
  --         lualine_y = { 'progress' },
  --         lualine_z = { 'location' }
  --       },
  --       inactive_sections = {
  --         lualine_a = {},
  --         lualine_b = {},
  --         lualine_c = { 'filename' },
  --         lualine_x = { 'location' },
  --         lualine_y = {},
  --         lualine_z = {}
  --       },
  --       tabline = {},
  --       winbar = {},
  --       inactive_winbar = {},
  --       extensions = {}
  --     }
  --   end
  -- }
  -- using packer.nvim
  -- use {
  --   'akinsho/bufferline.nvim',
  --   tag = "v3.*",
  --   requires = 'nvim-tree/nvim-web-devicons',
  --   after = 'papercolor-theme',
  --   config = function()
  --     require("bufferline").setup {}
  --   end
  -- }
  -- use {
  --   'kdheepak/tabline.nvim',
  --   config = function()
  --     require('tabline').setup {
  --       enable = true,
  --       options = {
  --         section_separators = { '', '' },
  --         component_separators = { '', '' },
  --         max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
  --         show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
  --         show_devicons = true, -- this shows devicons in buffer section
  --         show_bufnr = false, -- this appends [bufnr] to buffer section,
  --         show_filename_only = false, -- shows base filename only instead of relative path in filename
  --         modified_icon = "+ ", -- change the default modified icon
  --         modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
  --         show_tabs_only = true, -- this shows only tabs instead of tabs + buffers
  --       }
  --     }
  --   end,
  --   requires = { { 'hoob3rt/lualine.nvim', opt = true }, { 'kyazdani42/nvim-web-devicons', opt = true } }
  -- }
  use {
    'itchyny/lightline.vim',
    config = function()
      vim.cmd [[
        let g:lightline = {
              \   'colorscheme': 'PaperColor',
              \   'active': {
              \     'left':  [ [ 'mode' ],
              \                [ 'path' ],
              \                ['readonly', 'modified' ], ],
              \     'right': [ [ 'diff', 'lineinfo' ], [ 'filetype', 'percent' ], ],
              \   },
              \   'inactive': {
              \     'left':  [ [ 'path' ] ],
              \     'right': [ [ ], [ ], [ ] ],
              \   },
              \   'tabline': {
              \     'left':  [ [ 'tabs' ] ],
              \     'right': [ [ ] ],
              \   },
              \   'tab': {
              \     'active':   [ 'filename', 'modified' ],
              \     'inactive': [ 'filename', 'modified' ]
              \   },
              \   'separator':            { 'left': '', 'right': '' },
              \   'subseparator':         { 'left': '', 'right': '' },
              \   'tabline_separator':    { 'left': '', 'right': '' },
              \   'tabline_subseparator': { 'left': '', 'right': '' },
              \   'component': {
              \     'path':       '%{&ft!="nnn"?expand("%:p"):""}',
              \     'filename':   '%t',
              \     'modified':   '%M',
              \     'readonly':   '%{&readonly?"":""}',
              \     'filetype':   '%{&ft==""?"N/A":&ft=="nnn"?"":&ft}',
              \     'percent':    '%3p%%',
              \     'lineinfo':   '%{&ft!="nnn"?printf("%3d:%-2d",line("."),col(".")):""}',
              \     'time':       '%{strftime("%a %b %e %H:%M")}',
              \     'whitespace': '%{len(filter(getline(1,"$"), "v:val =~ ''\s$''")) > 0 ? "!" : ""}',
              \     'wordcount':  '%{mode()=="v"?wordcount().visual_words:wordcount().words}',
              \   },
              \   'component_function': {
              \     'branch': 'LightlineBranch',
              \     'mode':   'LightlineMode',
              \   },
              \   'component_visible_condition': {
              \     'modified':  '&modified||!&modifiable',
              \     'readonly':  '&readonly',
              \     'paste':     '&paste',
              \     'spell':     '&spell',
              \     'lineinfo':  '&ft != "nnn"',
              \   },
              \   'component_function_visible_condition': { },
              \   'component_expand': {
              \     'tabs': 'lightline#tabs'
              \   },
              \   'component_type': {
              \     'tabs':  'tabsel',
              \     'close': 'raw'
              \   },
              \   'component_raw': { },
              \   'tab_component':  { },
              \   'tab_component_function': {
              \     'filename': 'lightline#tab#filename',
              \     'modified': 'lightline#tab#modified',
              \     'readonly': 'lightline#tab#readonly',
              \   },
              \   'mode_map': {
              \     'n':      'NORMAL',
              \     'i':      'INSERT',
              \     'R':      'REPLACE',
              \     'v':      'VISUAL',
              \     'V':      'V-LINE',
              \     "\<C-v>": 'V-BLOCK',
              \     'c':      'COMMAND',
              \     's':      'SELECT',
              \     'S':      'S-LINE',
              \     "\<C-s>": 'S-BLOCK',
              \     't':      'TERMINAL',
              \   },
              \   'enable': {
              \     'statusline': 1,
              \     'tabline': 1
              \   },
              \ }
        fun! LightlineBranch()
          let branch = fugitive#head()
          return branch !=# '' ? ''.branch : ''
        endfun
        fun! LightlineMode()
          let cmdtype = getcmdtype()
          return  cmdtype == ':' ? 'COMMAND' :
                \ cmdtype == '/' ? 'SEARCH' :
                \ cmdtype == '?' ? 'REV-SEARCH' :
                \                   lightline#mode()
        endfun
        ]]
    end
  }
  use {
    'andymass/vim-matchup', -- Better matchings
    config = function()
      vim.api.nvim_set_var('matchup_matchparen_stopline', 100)
      vim.api.nvim_set_var('matchup_matchparen_deferred', 0)
      vim.api.nvim_set_var('matchup_matchparen_status_offscreen', 0)
    end
  }
  use 'ron89/thesaurus_query.vim'
  use {
    'andrewradev/sideways.vim', -- Move arguments sideways
    config = function()
      vim.keymap.set('n', '<C-H>', '<Cmd>SidewaysLeft<CR>', opt)
      vim.keymap.set('n', '<C-L>', '<Cmd>SidewaysRight<CR>', opt)
    end
  }
  use 'rktjmp/highlight-current-n.nvim'

  -- Filetype specific
  use {
    'plasticboy/vim-markdown',
    ft = { 'markdown' },
    config = function()
      vim.api.nvim_set_var('vim_markdown_folding_disabled', 1)
      vim.api.nvim_set_var('vim_markdown_fenced_languages', '["arc-lang=arc"]')
    end
  }
  use {
    "iamcco/markdown-preview.nvim",
    ft = { 'markdown' },
    run = function()
      vim.fn["mkdp#util#install"]()
      vim.api.nvim_set_var("mkdp_preview_options", [[{
        \ 'disable_sync_scroll': 1,
        \ 'hide_yaml_meta': 1
        \ }
      ]])
      vim.api.nvim_set_var("mkdp_page_title", '「${name}」')
    end,
  }
  use { 'junegunn/limelight.vim', ft = { 'markdown', 'tex', 'latex' } } -- Fade adjacent paragraphs
  use { 'junegunn/goyo.vim', ft = { 'markdown', 'tex', 'latex' } } -- Distraction-less mode
  use { 'dhruvasagar/vim-table-mode', ft = { 'markdown', 'tex', 'latex' } } -- Draw tables
  use {
    'rrethy/vim-illuminate',
    ft = { 'markdown', 'tex', 'latex' },
    config = function()
      vim.api.nvim_set_var('Illuminate_ftblacklist', '["startify"]')
      vim.api.nvim_set_var('Illuminate_highlightUnderCursor', 1)
      vim.api.nvim_set_hl(0, 'illuminatedWord', { underline = true })
    end
  } -- Highlight word under cursor
  use { 'elliottcable/vim-menhir', ft = { 'menhir' } }
  use { 'rust-lang/rust.vim', ft = { 'rust' } }
  use { 'miking-lang/miking-vim' }
  use { 'elzr/vim-json', ft = { 'json' } }
  use { 'cespare/vim-toml', ft = { 'toml' } }
  use { 'tie/llvm.vim', ft = { 'llvm' } }
  use { 'chrisbra/vim-zsh', ft = { 'zsh' } }
  use {
    'foosoft/vim-argwrap',
    ft = { 'rust' },
    config = function() -- Wrap/unwrap arguments
      vim.keymap.set('n', 'ª', '<Cmd>ArgWrap<CR>', opt)
    end
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup {
        direction = 'float',
      }
      vim.keymap.set({ 'n', 't' }, '<C-ö>', '<Cmd>ToggleTerm<CR>', opt)
    end
  }
  use 'shortcuts/no-neck-pain.nvim'

  -- Syntax
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   config = function()
  --     require('nvim-treesitter.configs').setup {
  --       ensure_installed = { "lua", "rust", "toml" },
  --       auto_install = true,
  --       highlight = {
  --         enable = false,
  --         additional_vim_regex_highlighting = false,
  --       },
  --       ident = { enable = true },
  --       rainbow = {
  --         enable = true,
  --         extended_mode = true,
  --         max_file_lines = nil,
  --       }
  --     }
  --   end
  -- }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {
        disable_in_macro = false,
        disable_in_visualblock = false,
        disable_in_replace_mode = false
      }
    end
  }

  -- Completions
  use {
    'github/copilot.vim',
    config = function()
      vim.keymap.set('i', '¥', function()
        local key = vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
        vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](key), 'n', true)
      end, opt)
      vim.keymap.set('i', '¬', '<Plug>(copilot-next)', opt_plug) -- <D-j>
      vim.keymap.set('i', 'º', '<Plug>(copilot-previous)', opt_plug) -- <D-k>
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      -- vim.g.copilot_filetypes = [[{ "*": v:true }]]
    end
  }
  use {
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    after = { 'hrsh7th/nvim-cmp' },
    requires = { 'hrsh7th/nvim-cmp' },
  }
  use {
    'phaazon/mind.nvim',
    branch = 'v2.2',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'mind'.setup()
    end
  }
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      local types = require('cmp.types')

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
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'vsnip' },
          { name = "crates" },
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['∧'] = cmp.mapping.scroll_docs(-4),
          ['¬'] = cmp.mapping.scroll_docs(4),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<Tab>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item()
            else
              local key = vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
              vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](key), 'n', true)
            end
          end),
          ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            else
              local key = vim.api.nvim_replace_termcodes("<BS>", true, true, true)
              vim.fn.feedkeys(key, "n")
            end
          end)
        },
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            function(entry1, entry2)
              local kind1 = entry1:get_kind()
              kind1 = kind1 == types.lsp.CompletionItemKind.Text and 100 or kind1
              local kind2 = entry2:get_kind()
              kind2 = kind2 == types.lsp.CompletionItemKind.Text and 100 or kind2
              if kind1 ~= kind2 then
                if kind1 == types.lsp.CompletionItemKind.Snippet then
                  return false
                end
                if kind2 == types.lsp.CompletionItemKind.Snippet then
                  return true
                end
                local diff = kind1 - kind2
                if diff < 0 then
                  return true
                elseif diff > 0 then
                  return false
                end
              end
            end,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        experimental = {
          ghost_text = true
        }
      }

      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    end
  }
  use {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      local crates = require('crates')
      crates.setup {
        popup = {
          autofocus = true
        }
      }
      vim.api.nvim_create_user_command('CargoUpdate', function() crates.upgrade_crate() end, {})
      vim.api.nvim_create_user_command('CargoUpdateAll', function() crates.upgrade_all_crates() end, {})
      vim.api.nvim_create_user_command('CargoHomepage', function() crates.open_homepage() end, {})
      vim.api.nvim_create_user_command('CargoRepo', function() crates.open_repository() end, {})
      vim.api.nvim_create_user_command('CargoDocs', function() crates.open_documentation() end, {})
      vim.api.nvim_create_user_command('CargoCrates', function() crates.open_crates_io() end, {})
      vim.api.nvim_create_user_command('CargoShow', function() crates.show_crate_popup() end, {})
      vim.api.nvim_create_user_command('CargoVersions', function() crates.show_versions_popup() end, {})
      vim.api.nvim_create_user_command('CargoFeatures', function() crates.show_features_popup() end, {})
      vim.api.nvim_create_user_command('CargoDependencies', function() crates.show_dependencies_popup() end, {})
    end,
  }
  -- use {
  --   'simrat39/rust-tools.nvim',
  --   config = function()
  --     local rt = require("rust-tools")
  --     vim.keymap.set('n', 'gk', '<Cmd>RustParentModule<CR>', opt)
  --     vim.keymap.set('n', 'gb', function() rt.expand_macro.expand_macro() end, opt)
  --     vim.keymap.set('n', 'gj', '<Cmd>RustJoinLines<CR>', opt)
  --     -- vim.keymap.set('n', 'gr', '<Cmd>RustReloadWorkspace<CR>', opt)
  --     vim.keymap.set('n', 'gs', '<Cmd>RustSSR<CR>', opt)
  --
  --     rt.setup {
  --       tools = {
  --         hover_actions = {
  --           auto_focus = true,
  --         },
  --         inlay_hints = {
  --           show_parameter_hints = true,
  --           parameter_hints_prefix = " : ",
  --           other_hints_prefix = " : ",
  --           highlight = "LspDiagnosticsDefaultInformation",
  --         },
  --       }
  --     }
  --   end
  -- }
  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup {
        providers = {
          "mason.providers.client",
          "mason.providers.registry-api"
        }
      }
    end
  }
  use {
    'williamboman/mason-lspconfig.nvim',
    after = 'mason.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'sumneko_lua',
          -- 'rust_analyzer@nightly',
          'ocamllsp'
        }
      }
    end
  }
  use {
    'weilbith/nvim-code-action-menu',
    config = function()
      vim.g.code_action_menu_show_details = false
      vim.g.code_action_menu_window_border = 'rounded'
      vim.g.code_action_menu_show_diff = false
      vim.keymap.set('n', 'ca', ":CodeActionMenu<CR>:wa<CR>", opt)
      vim.keymap.set('v', '◊', ":CodeActionMenu<CR>:wa<CR>", opt)
    end
  }
  use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup {
        border_style = "rounded",
        move_in_saga = {
          prev = '<C-k>',
          next = '<C-j>'
        },
        lightbulb = {
          sign = false,
          virtual_text = false,
        },
        symbol_in_winbar = {
          enable = false,
        },
        rename_action_quit = '<Esc>',
        -- ui = {
        --   title = false,
        --   colors = {
        --     --float window normal background color
        --     normal_bg = vim.g['terminal_color_15'],
        --     --title background color
        --     title_bg = vim.g['terminal_color_15'],
        --     red = vim.g['terminal_color_9'],
        --     magenta = vim.g['terminal_color_5'],
        --     orange = vim.g['terminal_color_13'],
        --     yellow = vim.g['terminal_color_11'],
        --     green = vim.g['terminal_color_10'],
        --     cyan = vim.g['terminal_color_6'],
        --     blue = vim.g['terminal_color_14'],
        --     purple = vim.g['terminal_color_11'],
        --     white = vim.g['terminal_color_15'],
        --     black = vim.g['terminal_color_0'],
        --   },
        -- }
      }

      vim.keymap.set("n", "É", "<Cmd>Lspsaga lsp_finder<CR>", opt)
      vim.keymap.set("n", "√", "<Cmd>Lspsaga rename<CR>", opt)
      vim.keymap.set('n', 'T', "<Cmd>Lspsaga peek_definition<CR>", opt)
      vim.keymap.set('n', 'Δ', "<Cmd>LSoutlineToggle<CR>", opt) -- <C-d>
    end,
  }
  use {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {}
    end
  }
  use {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        { underline = true, update_in_insert = false }
      )
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = 'rounded' }
      )
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = 'rounded' }
      )
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opt)
      vim.keymap.set('n', 't', vim.lsp.buf.definition, opt)
      vim.keymap.set('n', 'Θ', vim.lsp.buf.declaration, opt) -- <D-u>
      vim.keymap.set('n', 'Ü', vim.lsp.buf.type_definition, opt) -- <D-u>
      vim.keymap.set('n', 'ˆ', vim.lsp.buf.implementation, opt) -- <D-i>
      vim.keymap.set('n', '˘', vim.lsp.buf.signature_help, opt) -- <D-h>
      vim.keymap.set('n', '+', function() vim.lsp.buf.format { async = true } end, opt)
      vim.keymap.set('n', 'cl', vim.lsp.codelens.refresh, opt)

      local goto_opts = { float = { header = false, border = "rounded", prefix = "" }, wrap = true }
      vim.keymap.set('n', '<C-k>', function() vim.diagnostic.goto_prev(goto_opts) end, opt)
      vim.keymap.set('n', '<C-j>', function() vim.diagnostic.goto_next(goto_opts) end, opt)

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
      vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { link = 'DiagnosticError' })
      vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { link = 'DiagnosticWarn' })
      vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { link = 'DiagnosticInfo' })
      vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { link = 'DiagnosticHint' })

      vim.api.nvim_set_hl(0, 'DiagnosticError', { link = 'CocErrorHighlight' })
      vim.api.nvim_set_hl(0, 'DiagnosticWarn', { link = 'CocWarningHighlight' })
      vim.api.nvim_set_hl(0, 'DiagnosticInfo', { link = 'CocInfoHighlight' })
      vim.api.nvim_set_hl(0, 'DiagnosticHint', { link = 'CocHintHighlight' })

      vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Normal' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })

      local on_attach = function(client, buffer)

        if client.server_capabilities.codeLensProvider then
          local codelens = vim.api.nvim_create_augroup('LSPCodeLens', { clear = true })
          vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'CursorHold' }, {
            group = codelens,
            callback = function()
              vim.lsp.codelens.refresh()
            end,
            buffer = buffer,
          })
          vim.api.nvim_set_hl(0, 'LspCodeLens', { link = 'Comment' })
          vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', { link = 'Comment' })
        end
        client.server_capabilities.semanticTokensProvider = nil

      end

      require('lspconfig')['sumneko_lua'].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
      }
      require('lspconfig')['ocamllsp'].setup {
        cmd = { 'ocamllsp' },
        filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
        capabilities = capabilities,
        on_attach = on_attach,
      }
      require('lspconfig')['rust_analyzer'].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "item",
              },
            },
          }
        }
      }
      require('lspconfig')['idris2_lsp'].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }
      -- require('lspconfig')['clangd'].setup {
      --   capabilities = capabilities,
      --   on_init = function(new_client, _)
      --     new_client.offset_encoding = 'utf-32'
      --   end,
      -- }
    end
  }
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {
        fold_open = 'v',
        fold_closed = '>',
        icons = false
      }
      vim.keymap.set('n', '<C-g>', '<Cmd>TroubleToggle<CR>', opt)
    end
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    tag = 'nightly',
    config = function()
      require('nvim-tree').setup {
        sort_by = 'case_sensitive',
        view = {
          adaptive_size = true,
          mappings = {
            list = {
              { key = 'u', action = 'dir_up' },
            },
          },
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      }
      vim.keymap.set('n', 'ge', '<Cmd>NvimTreeToggle<CR>', opt)
    end
  }
  -- packer
  use {
    'antonk52/markdowny.nvim',
    config = function()
      vim.keymap.set('v', 'Λ', ":lua require('markdowny').link()<CR>") -- <D-l>
    end
  }

end,
  config = {
    display = {
      open_fn = require('packer.util').float,
      compact = true,
      autoremove = true,
    }
  }
})
