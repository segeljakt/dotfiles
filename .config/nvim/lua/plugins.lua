vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

local opt = { noremap = true, silent = true }
-- local opt_buf = { noremap = true, silent = true, buffer = true }
local opt_plug = { noremap = false, silent = true, nowait = true }
-- local opt_expr = { noremap = true, silent = false, nowait = true, expr = true }
local opt_cmd = { noremap = true, silent = false, nowait = true }

vim.keymap.set('n', '<C-S-L>', '<Cmd>Lazy<CR>', opt)

return require('lazy').setup({
    {
      'goolord/alpha-nvim', -- Start screen
      lazy = false,
      priority = 1001,
      config = function()
        local startify = require('alpha.themes.startify')
        startify.section.header.val = {}
        startify.section.mru_cwd.val = { { type = "padding", val = 0 } } -- Disable MRU CWD
        startify.section.mru.items_number = 30
        startify.section.bottom_buttons.val = {}
        startify.nvim_web_devicons.enabled = false
        startify.section.mru.val[4].val = function()
          return { startify.mru(1, nil, 40) }
        end
        startify.mru_opts.ignore = function(path)
          return (string.find(path, "COMMIT_EDITMSG"))
              or (string.find(path, "/Users/klasseg/[.]"))
              or (string.find(path, "/Users/klasseg/Library"))
              or (string.find(path, "/Users/klasseg/Zotero"))
              or (string.find(path, "/opt/homebrew/Cellar/neovim"))
        end
        vim.api.nvim_create_autocmd('FileType', {
          pattern = 'alpha',
          command = 'set laststatus=0 showtabline=0'
        })
        require('alpha').setup(startify.config)
      end
    },
    {
      dir = '~/Workspace/nvim/papercolor-theme-slim/',
      lazy = false,
      priority = 1000,
      config = function()
        vim.opt.background = 'light'
        vim.opt.termguicolors = true
        vim.cmd('colorscheme PaperColorSlim')
      end
    }, -- Command-line utils
    {
      'notjedi/nvim-rooter.lua',
      event = 'VeryLazy',
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
    },
    {
      'lewis6991/gitsigns.nvim',
      event = 'VeryLazy',
      config = function()
        require('gitsigns').setup {
          signs = {
            add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
            change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
            delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
            topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
            changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
            untracked    = { hl = 'GitSignsAdd', text = '┆', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
          },
          signcolumn = true,
          numhl = false,
          linehl = false,
          word_diff = false,
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

        local gs = package.loaded.gitsigns

        -- Actions
        vim.keymap.set({ 'n', 'v' }, '˘', '<Cmd>Gitsigns stage_hunk<CR>', opt) -- <D-h>
        vim.keymap.set({ 'n', 'v' }, 'gj', '<Cmd>Gitsigns reset_hunk<CR>', opt)
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
    },
    {
      'nvim-telescope/telescope.nvim',
      keys = {
        '<C-p>', '<C-S-p>', 'ı', '<C-S-t>', '<C-u>',
        '<C-Space>', '<C-S-c>', '<C-S-b>', '<C-S-s>',
        'Fh', 'FH', 'Fi', 'Φ', 'U', '<C-g>'
      },
      cmd = { 'Telescope' },
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        -- local actions = require('telescope.actions')

        -- local open_in_popup = function(filepath)
        --   local bufnr = vim.fn.bufadd(filepath)
        --   vim.fn.bufload(bufnr)
        --   local winid = vim.api.nvim_open_win(bufnr, true, {
        --     relative = 'editor',
        --     width = math.floor(vim.o.columns * 0.7),
        --     height = math.floor(vim.o.lines * 0.7),
        --     row = math.floor(vim.o.lines * 0.15),
        --     col = math.floor(vim.o.columns * 0.15),
        --     style = 'minimal',
        --     border = 'rounded',
        --   })
        --   -- vim.api.nvim_win_set_option(winid, 'bufhidden', 'delete')
        -- end

        telescope.setup {
          defaults = {
            mappings = {
              i = {
                ['<C-k>'] = 'move_selection_previous',
                ['<C-j>'] = 'move_selection_next',
                ['ª'] = 'cycle_previewers_prev',       -- <C-S-k>
                ['<C-s-j>'] = 'cycle_previewers_next', -- <C-S-j>
                ['<C-c>'] = 'close',
                ['<C-g>'] = 'close',
                -- ["<CR>"] = function(prompt_bufnr)
                --   local selection = require('telescope.actions.state').get_selected_entry()
                --   actions.close(prompt_bufnr)
                --   open_in_popup(selection.value)
                -- end,
              },
            }
          },
          pickers = {
            git_files = {
              theme = 'dropdown',
              previewer = false,
              layout_config = {
                height = 0.5,
                width = 0.95,
                prompt_position = 'top',
                scroll_speed = 1
              },
            },
            oldfiles = {
              theme = 'dropdown',
              previewer = false,
              cwd = '/Users/klasseg/Workspace',
              layout_config = {
                height = 0.5,
                width = 0.95,
                prompt_position = 'top',
                scroll_speed = 1
              },
            },
            live_grep = {
              layout_strategy = 'vertical',
              layout_config = {
                height = 0.95,
                prompt_position = 'bottom',
                mirror = true,
                scroll_speed = 1
              },
            },
            diagnostics = {
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
        vim.keymap.set('n', '<C-p>', function()
          local root = vim.fn.fnamemodify(vim.fn.finddir(".git", ".;"), ":h")
          local toml_dirs = vim.fn.glob(root .. '/*/Cargo.toml', true, true)
          for i, fullpath in ipairs(toml_dirs) do
            toml_dirs[i] = vim.fn.fnamemodify(fullpath, ':h')
          end
          builtin.live_grep { cwd = root, search_dirs = toml_dirs, type_filter = 'rust' }
        end, opt)
        vim.keymap.set('n', '<C-S-p>', builtin.grep_string, opt)
        vim.keymap.set('n', 'ı', builtin.git_files, opt) -- <C-i>
        vim.keymap.set('n', '<C-S-t>', builtin.treesitter, opt)
        vim.keymap.set('n', '<C-u>', builtin.oldfiles, opt)
        vim.keymap.set('n', '<C-Space>', builtin.buffers, opt)
        vim.keymap.set('n', '<C-S-c>', builtin.git_commits, opt)
        vim.keymap.set('n', '<C-S-b>', builtin.git_branches, opt)
        vim.keymap.set('n', 'Fh', builtin.help_tags, opt)
        vim.keymap.set('n', 'FH', builtin.highlights, opt)
        vim.keymap.set('n', 'Fi', builtin.lsp_implementations, opt)
        vim.keymap.set('n', 'Φ', builtin.jumplist, opt)
        vim.keymap.set('n', '<C-g>', function() builtin.diagnostics { line_width = 1000 } end, opt)
      end,
    },
    {
      'itchyny/vim-highlighturl', -- Highlight URLs
      ft = { 'markdown', 'text', 'rust', 'python', 'lua', 'ocaml', 'mojo' },
    },
    {
      'flwyd/vim-conjoin', -- Join lines
      keys = { 'J' }
    },
    {
      'vim-utils/vim-troll-stopper', -- Highlight janky unicode characters
      event = 'VeryLazy'
    },
    {
      'farmergreg/vim-lastplace', -- Go to last cursor position when opening file
      event = 'BufReadPost'
    },
    {
      'rhysd/git-messenger.vim', -- Get commit message of current line
      config = function()
        vim.keymap.set('n', 'gm', '<Cmd>GitMessenger<CR>', opt)
      end,
      keys = { 'gm' }
    },
    {
      'ruanyl/vim-gh-line', -- Goto current line on GitHub
      config = function()
        vim.keymap.set('n', 'gl', '<Cmd>GH<CR>', opt)
        vim.g.gh_line_map_default = false
        vim.g.gh_line_blame_map_default = false
      end,
      keys = { 'gl' }
    },
    {
      'simonmclean/triptych.nvim',
      event = 'VeryLazy',
      dependencies = {
        'nvim-lua/plenary.nvim',       -- required
        'nvim-tree/nvim-web-devicons', -- optional
      },
      config = function()
        require('triptych').setup {}
      end
    },
    {
      'godlygeek/tabular', -- Align stuff
      config = function()
        vim.keymap.set('x', 'T', ':Tabularize/', opt_cmd)
      end,
      keys = { { 'T', mode = 'x' } }
    },
    {
      'zirrostig/vim-schlepp', -- Drag visual block and visual line
      config = function()
        vim.keymap.set('v', 'H', '<Plug>SchleppLeft', opt_plug)
        vim.keymap.set('v', 'J', '<Plug>SchleppDown', opt_plug)
        vim.keymap.set('v', 'K', '<Plug>SchleppUp', opt_plug)
        vim.keymap.set('v', 'L', '<Plug>SchleppRight', opt_plug)
        vim.keymap.set('v', 'D', '<Plug>SchleppDup', opt_plug)
        vim.api.nvim_set_var('Schlepp#reindent', 1)
      end,
      keys = {
        { 'H', mode = 'v' },
        { 'J', mode = 'v' },
        { 'K', mode = 'v' },
        { 'L', mode = 'v' },
        { 'D', mode = 'v' }
      }
    },
    {
      'danro/rename.vim', -- Rename current buffer
      cmd = 'Rename'
    },
    {
      'ojroques/nvim-bufdel', -- Delete buffers and close files
      config = function()
        require('bufdel').setup {}
        vim.keymap.set('n', 'Å', '<Cmd>BufDel!<CR>', opt)
      end,
      keys = { 'Å' }
    },
    {
      'nelstrom/vim-visual-star-search', -- Search by visual block
      keys = { { '*', mode = 'x' } }
    },
    {
      'machakann/vim-sandwich', -- Change surrounding parentheses
      event = 'VeryLazy',
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
              \   },
	            \   { 'buns': ['for {', '}'],  'nesting': 1, 'input': ['bf'] },
	            \   { 'buns': ['loop {', '}'],  'nesting': 1, 'input': ['bf'] },
	            \   { 'buns': ['while {', '}'],  'nesting': 1, 'input': ['bf'] },
	            \   { 'buns': ['if {', '}'],   'nesting': 1, 'input': ['bi'] },
	            \   { 'buns': ['else {', '}'], 'nesting': 1, 'input': ['be'] },
	            \   { 'buns': ['match {', '}'], 'nesting': 1, 'input': ['be'] },
              \ ]
        ]]
      end
    },
    {
      'vim-scripts/visualrepeat', -- Repeat . for visual mode
      dependencies = { 'vim-scripts/ingo-library' },
      keys = { { '.', mode = 'x' } }
    },
    {
      'tpope/vim-abolish', -- iabbrev, %S, snake_case => camelCase
      event = 'BufRead',
    },
    {
      'romainl/vim-cool', -- Turn off hlsearch
      config = function()
        vim.keymap.set('n', 'n', 'nzzzv', opt)
        vim.keymap.set('n', 'N', 'Nzzzv', opt)
        vim.keymap.set('n', '*', '*N', opt)
        vim.keymap.set('n', '#', '*N', opt)
      end,
      keys = { 'j', 'k', 'n', 'N', '*', '#', '/' }
    },
    {
      "princejoogie/chafa.nvim", -- View images and gifs
      ft = { "jpg", "jpeg", "png", "gif" },
      dependencies = { "nvim-lua/plenary.nvim", "m00qek/baleia.nvim" },
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
    },
    {
      'bkad/camelcasemotion', -- camelCaseMotion and snake_case_motion
      config = function()
        vim.keymap.set('', 'w', '<Plug>CamelCaseMotion_w', opt_plug)
        vim.keymap.set('', 'b', '<Plug>CamelCaseMotion_b', opt_plug)
        vim.keymap.set('', 'e', '<Plug>CamelCaseMotion_e', opt_plug)
      end,
      keys = {
        { 'w', mode = '' },
        { 'b', mode = '' },
        { 'e', mode = '' }
      }
    },
    {
      'numToStr/Comment.nvim', -- Commenting
      config = function()
        require('Comment').setup {
          mappings = false
        }
        vim.keymap.set('n', 'q', '<Plug>(comment_toggle_linewise_current)', opt_plug)
        vim.keymap.set('v', 'q', '<Plug>(comment_toggle_linewise_visual)', opt_plug)
      end,
      keys = {
        { 'q', mode = 'n' },
        { 'q', mode = 'v' }
      }
    },
    {
      'itchyny/lightline.vim',
      event = 'BufRead',
      config = function()
        vim.opt.laststatus = 3  -- Show global statusline
        vim.opt.showtabline = 2 -- Always show tabline
        vim.g.lightline = {
          colorscheme = 'PaperColor',
          active = {
            left = { { 'mode' }, { 'path' }, { 'readonly', 'modified' }, },
            right = { { 'diff', 'lineinfo' }, { 'filetype', 'percent' }, },
          },
          tabline = {
            left = { { 'tabs' } },
            right = {},
          },
          tab = {
            active = { 'filename', 'modified' },
            inactive = { 'filename', 'modified' }
          },
          separator = { left = '', right = '' },
          subseparator = { left = '', right = '' },
          tabline_separator = { left = '', right = '' },
          tabline_subseparator = { left = '', right = '' },
          component = {
            path = '%{expand("%:p")}',
            filename = '%t',
            modified = '%M',
            readonly = '%{&readonly?"":""}',
            filetype = '%{&ft==""?"N/A":&ft}',
            percent = '%3p%%',
            lineinfo = '%{printf("%3d:%-2d",line("."),col("."))}',
          },
          component_function = {
            mode = 'LightlineMode',
          },
          component_visible_condition = {
            modified = '&modified||!&modifiable',
            readonly = '&readonly',
            paste = '&paste',
            spell = '&spell',
          },
          -- component_function_visible_condition = {},
          component_expand = {
            tabs = 'lightline#tabs'
          },
          component_type = {
            tabs = 'tabsel',
            close = 'raw'
          },
          -- component_raw = {},
          -- tab_component = {},
          tab_component_function = {
            filename = 'lightline#tab#filename',
            modified = 'lightline#tab#modified',
            readonly = 'lightline#tab#readonly',
          },
          mode_map = {
            n = 'NORMAL',
            i = 'INSERT',
            R = 'REPLACE',
            v = 'VISUAL',
            V = 'V-LINE',
            ["\22"] = 'V-BLOCK',
            c = 'COMMAND',
            s = 'SELECT',
            S = 'S-LINE',
            ["\19"] = 'S-BLOCK',
            t = 'TERMINAL',
          },
        }
        vim.cmd [[
        fun! LightlineMode()
          let cmdtype = getcmdtype()
          return  cmdtype == ':' ? 'COMMAND' :
                \ cmdtype == '/' ? 'SEARCH' :
                \ cmdtype == '?' ? 'REV-SEARCH' :
                \                   lightline#mode()
        endfun
      ]]
      end
    },
    {
      'andymass/vim-matchup', -- Better matchings
      config = function()
        vim.g.matchup_matchparen_stopline = 100
        vim.g.matchup_matchparen_deferred = 0
        vim.g.matchup_matchparen_offscreen = {}
      end
    },
    {
      'ron89/thesaurus_query.vim',
      config = function()
        vim.keymap.set('n', 'gs', '<Cmd>ThesaurusQueryReplaceCurrentWord<CR>', opt)
      end,
      keys = { 'gs' }
    },
    {
      'plasticboy/vim-markdown', -- Markdown highlighting
      ft = 'markdown',
      config = function()
        vim.g.vim_markdown_folding_disabled = 1
        vim.g.vim_markdown_fenced_languages = { "rs=rust" }
        vim.g.vim_markdown_fenced_languages = { "aq=aqua" }
      end
    },
    {
      'antonk52/markdowny.nvim', -- Insert markdown links
      ft = 'markdown',
      config = function()
        vim.keymap.set('v', 'Λ', ":lua require('markdowny').link()<CR>") -- <D-l>
      end,
      keys = { 'Λ' }
    },
    {
      "iamcco/markdown-preview.nvim", -- Markdown preview
      ft = 'markdown',
      build = function()
        vim.fn["mkdp#util#install"]()
        vim.g.mkdp_preview_options = {
          disable_sync_scroll = 1,
          hide_yaml_meta = 1
        }
        vim.g.mkdp_page_title = '「${name}」'
        vim.keymap.set('n', 'md', '<Cmd>MarkdownPreview<CR>', opt)
      end,
      keys = { 'md' }
    },
    {
      'junegunn/limelight.vim', -- Fade adjacent paragraphs
      ft = { 'markdown', 'tex', 'latex' }
    },
    {
      'junegunn/goyo.vim', -- Distraction-less mode
      ft = { 'markdown', 'tex', 'latex' },
      config = function()
        vim.keymap.set('n', 'gy', '<Cmd>Goyo<CR>', opt)
      end,
      keys = { 'gy' },
      cmd = { 'Goyo' }
    },
    {
      'dhruvasagar/vim-table-mode', -- Draw tables
      ft = { 'markdown', 'tex', 'latex' },
      config = function()
        vim.g.table_mode_always_active = true
      end
    },
    {
      'rrethy/vim-illuminate', -- Highlight word under cursor
      ft = { 'markdown', 'tex', 'latex' },
      config = function()
        vim.g.Illuminate_ftblacklist = '["startify"]'
        vim.g.Illuminate_highlightUnderCursor = 1
        vim.api.nvim_set_hl(0, 'illuminatedWord', { underline = true })
      end
    },
    {
      'elzr/vim-json',
      ft = 'json'
    },
    {
      'cespare/vim-toml',
      ft = 'toml'
    },
    {
      'chrisbra/vim-zsh',
      ft = 'zsh'
    },
    {
      'foosoft/vim-argwrap',
      event = 'InsertEnter',
      ft = 'rust',
      config = function() -- Wrap/unwrap arguments
        vim.keymap.set('n', 'ga', '<Cmd>ArgWrap<CR>', opt)
      end,
      keys = { 'ga' }
    },

    {
      'akinsho/toggleterm.nvim',
      config = function()
        require("toggleterm").setup {
          direction = 'float',
        }
        vim.keymap.set({ 'n', 't' }, '<C-ö>', '<Cmd>ToggleTerm<CR>', opt)
      end,
      keys = { '<C-ö>' }
    },
    {
      'shortcuts/no-neck-pain.nvim',
      cmd = 'NoNeckPain',
      config = function()
        require('no-neck-pain').setup {
          width = 120,
        }
      end
    },
    {
      'mbbill/undotree',
      cmd = 'UndotreeToggle',
    },
    {
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/playground',
        'nvim-treesitter/nvim-treesitter-refactor'
      },
      config = function()
        require('nvim-treesitter.configs').setup {
          ensure_installed = {
            'lua',
            'rust',
            'toml',
            'dockerfile',
            'proto',
            'cmake',
            'ocaml',
            'c',
            'bash',
            'gitignore',
            'gitattributes',
            'go',
            'mlir',
            'zig',
            -- 'cpp',
            'javascript',
            'typescript',
            'json',
            'markdown',
            'markdown_inline',
            'python',
            'regex',
            'yaml',
          },
          auto_install = true,
          highlight = {
            disable = true,
          },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "gnn",
              node_incremental = "grn",
              scope_incremental = "grc",
              node_decremental = "grm",
            },
          },
          ident = { enable = true },
          rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
          },
          query_linter = {
            enable = true,
            use_virtual_text = true,
            lint_events = { "BufWrite", "CursorHold" },
          },
          playground = {
            enable = true,
            disable = {},
            updatetime = 25,
            persist_queries = false,
            keybindings = {
              toggle_query_editor = 'o',
              toggle_hl_groups = 'i',
              toggle_injected_languages = 't',
              toggle_anonymous_nodes = 'a',
              toggle_language_display = 'I',
              focus_language = 'f',
              unfocus_language = 'F',
              update = 'R',
              goto_node = '<cr>',
              show_help = '?',
            },
          },
          textobjects = {
            swap = {
              enable = true,
              swap_next = {
                ["<C-l>"] = "@swappable",
              },
              swap_previous = {
                ["<C-h>"] = "@swappable",
              },
            },
            select = {
              enable = true,
              lookahead = true,
              keymaps = {
                ["f"] = "@function.outer",
                ["if"] = "@function.inner",
              },
              selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V',  -- linewise
              },
              include_surrounding_whitespace = true,
            },
            lsp_interop = {
              enable = true,
              border = 'none',
              floating_preview_opts = {},
              peek_definition_code = {
                ["<leader>df"] = "@function.outer",
                ["<leader>dF"] = "@class.outer",
              },
            },
          },
          refactor = {
            highlight_definitions = {
              enable = true,
              clear_on_cursor_move = true
            },
            highlight_current_scope = {
              enable = true
            },
          },
        }
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.aqua = {
          install_info = {
            url = '/Users/klasseg/Workspace/rust/aqua/crates/tree-sitter-aqua',
            files = { "src/parser.c", },
            generate_requires_npm = false,
            requires_generate_from_grammar = true,
          },
          filetype = "aqua"
        }
        vim.filetype.add { extension = { arc = 'aqua' } }
        vim.opt.rtp:append('/Users/klasseg/Workspace/rust/aqua/crates/tree-sitter-aqua')
        vim.keymap.set('n', 'gi', '<Cmd>TSHighlightCapturesUnderCursor<CR>', opt)
        vim.keymap.set('n', 'gI', '<Cmd>TSPlaygroundToggle<CR>', opt)
        vim.api.nvim_create_autocmd('FileType', {
          pattern = 'rust,lua,aqua,mlir,tablegen,toml,cpp,lalrpop',
          callback = function(arg)
            if vim.api.nvim_buf_line_count(arg.buf) < 2000 then
              -- vim.cmd [[syntax off]]
              vim.treesitter.start()
            end
          end
        })
      end
    },
    -- {
    --   'HiPhish/rainbow-delimiters.nvim',
    --   config = function()
    --     require('rainbow-delimiters.setup').setup { }
    --   end
    -- },
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require("nvim-autopairs").setup {
          disable_in_macro = false,
          disable_in_visualblock = false,
          disable_in_replace_mode = false
        }
      end
    },
    {
      "epwalsh/obsidian.nvim", -- Note-taking
      version = "*",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
        "nvim-treesitter",
      },
      config = function()
        vim.keymap.set('n', 'go', '<Cmd>ObsidianQuickSwitch<CR>', opt)
        vim.keymap.set('n', 'gn', '<Cmd>ObsidianToday<CR>', opt)
        require("obsidian").setup {
          workspaces = {
            {
              name = "work",
              path = "~/vaults/work",
            },
          },
          ui = {
            enable = false,
          },
          notes_subdir = "notes",
          daily_notes = {
            folder = "notes/dailies",
            date_format = "%Y-%m-%d",
            alias_format = "%B %-d, %Y",
            template = nil
          },
          completion = {
            nvim_cmp = true,
            min_chars = 2,
          },
          new_notes_location = "notes_subdir",
        }
      end
    },
    {
      'phaazon/mind.nvim', -- Note-taking
      cmd = 'MindOpenMain',
      branch = 'v2.2',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        vim.api.nvim_create_autocmd('FileType', {
          pattern = 'mind',
          command = 'set laststatus=0 nowrap'
        })
        require('mind').setup {
          ui = {
            width = 15
          }
        }
      end
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require('todo-comments').setup()
      end
    },
    {
      'ms-jpq/chadtree',
      cmd = { "CHADopen" },
      keys = { 'gr' },
      config = function()
        vim.keymap.set('n', 'gr', '<Cmd>CHADopen<CR>', opt)
        -- vim.api.nvim_create_autocmd('VimEnter', { pattern = '*', command = 'CHADopen --nofocus' })
      end
    },
    -- LSP
    {
      'github/copilot.vim', -- Autocomplete with Copilot
      event = 'InsertEnter',
      config = function()
        vim.keymap.set('i', '¥', function()
          local key = vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
          vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](key), 'n', true)
        end, opt)
        -- vim.keymap.set('i', '¬', '<Plug>(copilot-next)', opt_plug) -- <D-j>
        vim.keymap.set('i', 'º', '<Plug>(copilot-previous)', opt_plug) -- <D-k>
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true
        vim.g.copilot_tab_fallback = ""
      end
    },
    {
      'saecki/crates.nvim',
      ft = 'toml',
      tag = 'v0.3.0',
      dependencies = { 'nvim-lua/plenary.nvim' },
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
    },
    {
      'williamboman/mason.nvim',
      cmd = { 'Mason' },
      dependencies = {
        {
          'williamboman/mason-lspconfig.nvim',
          cmd = { 'Mason' },
          config = function()
            require('mason-lspconfig').setup {
              -- ensure_installed = {
              --   'lua_ls',
              --   'ocamllsp'
              -- }
            }
          end,
        },
      },
      config = function()
        require('mason').setup {
          providers = {
            'mason.providers.client',
            'mason.providers.registry-api'
          }
        }
      end,
    },
    {
      'weilbith/nvim-code-action-menu',
      keys = {
        { 'ca', mode = 'n' },
        { '◊', mode = 'v' }
      },
      config = function()
        vim.g.code_action_menu_show_details = false
        vim.g.code_action_menu_window_border = 'rounded'
        vim.g.code_action_menu_show_diff = false
        vim.keymap.set('n', 'ca', ":CodeActionMenu<CR>:w<CR>", opt)
        vim.keymap.set('v', '◊', ":CodeActionMenu<CR>", opt)
      end
    },
    {
      'glepnir/lspsaga.nvim',
      dependencies = { 'neovim/nvim-lspconfig' },
      branch = 'main',
      config = function()
        require('lspsaga').setup {
          border_style = 'rounded',
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
          rename = {
            whole_project = false,
          },
          diagnostic = {
            extend_relatedInformation = true, -- When have relatedInformation, diagnostic message is extended to show it
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

        vim.keymap.set('n', 'É', '<Cmd>Lspsaga finder<CR>', opt) -- <C-e>
        vim.keymap.set('n', '√', '<Cmd>Lspsaga rename<CR>', opt) -- <C-r>
        vim.keymap.set('n', 'T', '<Cmd>Lspsaga peek_definition<CR>', opt)
        vim.keymap.set('n', 'Δ', '<Cmd>Lspsaga outline<CR>', opt) -- <C-d>
        vim.keymap.set('n', 'Ω', '<Cmd>Lspsaga term_toggle<CR>', opt) -- <C-d>
      end,
    },
    -- {
    --   'scalameta/nvim-metals',
    --   dependencies = { "nvim-lua/plenary.nvim" },
    --   config = function()
    --     require('metals').bare_config()
    --   end
    -- },
    -- {
    --   'mfussenegger/nvim-jdtls',
    --   ft = 'java',
    --   config = function()
    --     vim.api.nvim_create_autocmd('FileType', { pattern = 'java',
    --       callback = function()
    --         require('jdtls').start_or_attach({
    --           cmd = { 'jdtls' },
    --           root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    --         })
    --       end
    --     })
    --   end
    -- },
    {
      'neovim/nvim-lspconfig',
      ft = {
        'lua',
        'rust',
        'toml',
        'python',
        'mojo',
        'ocaml',
        'erlang'
      },
      dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
      },
      config = function()
        local nvim_lsp = require('lspconfig')
        local configs = require 'lspconfig.configs'
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- capabilities.offsetEncoding = { "utf-16" }
        capabilities.positionEncoding = { "utf-16" }

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
        --vim.keymap.set('n', 'K', vim.lsp.buf.hover, opt)
        vim.keymap.set('n', 't', vim.lsp.buf.definition, opt)
        vim.keymap.set('n', 'Θ', vim.lsp.buf.declaration, opt) -- <D-u>
        vim.keymap.set('n', 'Ü', vim.lsp.buf.type_definition, opt) -- <D-u>
        vim.keymap.set('n', 'ˆ', vim.lsp.buf.implementation, opt) -- <D-i>
        vim.keymap.set('n', '+', function() vim.lsp.buf.format { async = true } end, opt)
        vim.keymap.set('n', 'cl', vim.lsp.codelens.refresh, opt)

        local float = { header = false, border = "rounded", prefix = "" }
        vim.keymap.set('n', '<C-k>', function()
          vim.diagnostic.goto_prev { float = float, wrap = true, }
        end, opt)
        vim.keymap.set('n', '<C-j>', function()
          vim.diagnostic.goto_next { float = float, wrap = true, }
        end, opt)

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

        configs['coq-lsp'] = {
          default_config = {
            cmd = { 'coq-lsp' },
            filetypes = { 'coq' },
            root_dir = nvim_lsp.util.root_pattern('.git', 'coq-proj'),
            settings = {},
          },
        }
        -- nvim_lsp['jdtls'].setup {
        --   cmd = { 'jdtls' },
        --   filetypes = { 'java' },
        --   capabilities = capabilities,
        --   on_attach = on_attach,
        --   root_dir = nvim_lsp.util.root_pattern('.git', 'gradlew', 'mvnw'),
        -- }
        nvim_lsp['erlangls'].setup {
          capabilities = capabilities,
          on_attach = on_attach,
        }
        nvim_lsp['lua_ls'].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
        }
        nvim_lsp['ocamllsp'].setup {
          cmd = { 'ocamllsp' },
          filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
          capabilities = capabilities,
          on_attach = on_attach,
        }
        nvim_lsp['mojo'].setup {
          cmd = { 'mojo-lsp-server' },
          filetypes = { "mojo" },
          capabilities = capabilities,
          on_attach = on_attach,
        }
        nvim_lsp['zls'].setup {
          cmd = { '/Users/klasseg/Workspace/zig/zls/zig-out/bin/zls' },
          filetypes = { 'zig' },
          capabilities = capabilities,
          on_attach = on_attach,
        }
        nvim_lsp['rust_analyzer'].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            ["rust-analyzer"] = {
              imports = {
                granularity = {
                  group = "item",
                },
              },
              cargo = {
                allFeatures = true,
              },
              diagnostics = {
                disabled = {
                  "unresolved-proc-macro",
                  "inactive-code"
                }
              },
              -- checkOnSave = {
              --   command = "clippy"
              -- },
              check = {
                extraArgs = { "--target-dir", "/tmp/rust-analyzer" },
              },
              completion = {
                privateEditable = {
                  enable = false
                }
              },
              hover = {
                actions = {
                  references = {
                    enable = true,
                  }
                }
              },
              typing = {
                autoClosingAngleBrackets = {
                  enable = true
                }
              }
            }
          }
        }
        nvim_lsp['pylsp'].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            ["pylsp"] = {
              ["serverSettings"] = {
                ["pylsp.plugins.pycodestyle.enabled"] = false,
                ["pylsp.plugins.pydocstyle.enabled"] = false,
                ["pylsp.plugins.pyflakes.enabled"] = false,
                ["pylsp.plugins.pylint.enabled"] = false,
                ["pylsp.plugins.mccabe.enabled"] = false,
              }
            }
          }
        }
      end
    },
    {
      "czheo/mojo.vim",
      ft = { "mojo" },
      init = function()
        vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
          pattern = { "*.🔥" },
          callback = function()
            if vim.bo.filetype ~= "mojo" then
              vim.bo.filetype = "mojo"
            end
          end,
        })

        vim.api.nvim_create_autocmd("FileType", {
          pattern = "mojo",
          callback = function()
            local modular = vim.env.MODULAR_HOME
            local lsp_cmd = modular .. "/pkg/packages.modular.com_mojo/bin/mojo-lsp-server"

            vim.bo.expandtab = true
            vim.bo.shiftwidth = 4
            vim.bo.softtabstop = 4

            vim.lsp.start({
              name = "mojo",
              cmd = { lsp_cmd },
            })
          end,
        })
      end,
    },
    {
      'gelguy/wilder.nvim',
      config = function()
        local wilder = require('wilder')
        wilder.setup {
          modes = { ':', '/', '?' },
          -- accept_key = vim.api.nvim_replace_termcodes('<CR>', true, true, true),
        }
        wilder.set_option('renderer', wilder.popupmenu_renderer {
          highlights = { border = 'Normal' },
          border = 'rounded',
        })
        wilder.set_option('pipeline', {
          wilder.check(function(_, x)
            return vim.fn.strcharlen(x) > 1
          end),
          wilder.branch(
            wilder.cmdline_pipeline(),
            wilder.python_search_pipeline()
          )
        })
      end,
    },
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
      },
      config = function()
        local cmp = require('cmp')
        local types = require('cmp.types')

        local is_inside = function(groups)
          local context = require("cmp.config.context")
          for _, v in ipairs(groups) do
            if context.in_treesitter_capture(v) then
              return true
            end
          end
          return false
        end

        local filter = function(entry)
          return (not is_inside { "string", "String" })
              and (not entry:get_word():match("^[0-9]"))
        end

        cmp.setup {
          enabled = function()
            return not (is_inside { "comment", "Comment" } or vim.bo.buftype == 'prompt')
          end,
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end
          },
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          formatting = {
            format = function(_, vim_item)
              vim_item.menu = nil
              return vim_item
            end
          },
          sources = cmp.config.sources({
            { name = 'path' },
            {
              name = 'nvim_lsp',
              entry_filter = filter,
            },
            {
              name = 'nvim_lsp_signature_help',
              entry_filter = filter,
            },
            {
              name = 'nvim_lua',
              entry_filter = filter,
            },
            {
              name = 'vsnip',
              max_item_count = 3,
              entry_filter = filter,
            },
            { name = "crates" },
          }
          -- , {
          --   {
          --     name = 'buffer',
          --     max_item_count = 3,
          --     keyword_length = 3,
          --     entry_filter = function(entry)
          --       return not is_inside { "string", "String" }
          --           and (not entry:get_word():match("^[0-9]"))
          --     end
          --   },
          -- }
          ),
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
          },
          preselect = cmp.PreselectMode.Item,
        }
        -- cmp.setup.cmdline(':', {
        --   mapping = cmp.mapping.preset.cmdline {
        --     ['<Tab>'] = {
        --       c = function()
        --         if cmp.visible() then
        --           cmp.select_next_item()
        --         else
        --           cmp.complete()
        --           -- local key = vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
        --           -- vim.api.nvim_feedkeys(key, 'n', true)
        --         end
        --       end
        --     }
        --   },
        --   formatting = {
        --     format = function(_, vim_item)
        --       vim_item.kind = ''
        --       return vim_item
        --     end
        --   },
        --   sources = cmp.config.sources(
        --     { { name = 'path' } },
        --     { { name = 'cmdline', keyword_length = 3 } }
        --   )
        -- })

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end
    },
  },
  {
    ui = {
      border = "single"
    }
  }
)
