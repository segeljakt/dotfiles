"* Plugged
let g:plug_window = 'enew'
"* pgsql-vim
let g:sql_type_default = 'pgsql'
"* floatLf-nvim
let g:floatLf_border = 1
let g:floatLf_topleft_border    = "╔"
let g:floatLf_topright_border   = "╗"
let g:floatLf_botleft_border    = "╚"
let g:floatLf_botright_border   = "╝"
let g:floatLf_vertical_border   = "║"
let g:floatLf_horizontal_border = "═"
let g:floatLf_autoclose = 1
let g:floatLf_lf_close  = 'q'
let g:floatLf_lf_open   = '<Enter>'
let g:floatLf_lf_split  = '<C-x>'
let g:floatLf_lf_vsplit = '<C-v>'
let g:floatLf_lf_tab    = '<C-t>'
"* PaperColor

"* Hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']
"* Clap
hi link ClapSpinner PmenuSel
"* vim-smoothie
let g:smoothie_use_default_mappings = v:false
"* vim-silicon
let g:silicon = {
      \ 'theme':                 'GitHub',
      \ 'background':           '#FFFFFF',
      \ 'line-pad':                     1,
      \ 'pad-horiz':                    0,
      \ 'pad-vert':                     0,
      \ 'line-number':            v:false,
      \ 'window-controls':        v:false,
      \ 'to-clipboard':           v:true,
      \ 'output': '~/Desktop/silicon_{time:%Y-%m-%d_%H-%M-%S}.png',
      \ }
"* vim-choosewin
let g:choosewin_return_on_single_win = 1
let g:choosewin_color_label = {
	    \ 'gui': ['ForestGreen', 'white', 'bold'],
	    \ 'cterm': [9, 16]
	    \ }
let g:choosewin_color_other = {
	    \ 'gui': ['gray20', 'black'],
	    \ 'cterm': [240, 0]
	    \ }
"* vim-stealth
let g:stealth#trigger_after = 1000
"* fzf.vim
hi NormalFloat guibg=None
if exists('g:fzf_colors.bg')
  call remove(g:fzf_colors, 'bg')
endif

if stridx($FZF_DEFAULT_OPTS, '--border') == -1
  let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'
en

function! FloatingFZF()
  let width = float2nr(&columns * 0.9)
  let height = float2nr(&lines * 0.6)
  let opts = { 'relative': 'cursor',
              \ 'row': (&lines - height) / 2,
              \ 'col': (&columns - width) / 2,
              \ 'width': width,
              \ 'height': height }
  let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
endfunction

let g:fzf_preview_window = []
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" let g:fzf_layout = { 'up': '~40%' }
com! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({ 'dir': systemlist('git rev-parse --show-toplevel')[0] }), <bang>0)
fun! RgFzf(query, fullscreen)
  let rg_fmt = 'rg'
        \ .' --fixed-strings'
        \ .' --trim'
        \ .' --column'
        \ .' --glob="*.rs"'
        \ .' --glob="Cargo.toml"'
        \ .' --glob="*.arc"'
        \ .' --glob="*.py"'
        \ .' --glob="*.ml"'
        \ .' --glob="*.cpp"'
        \ .' --glob="*.cpp"'
        \ .' --line-number'
        \ .' --no-heading'
        \ .' --color=always'
        \ .' --ignore-case'
        \ .' -- %s || true'
  let rg_init = printf(rg_fmt, shellescape(a:query))
  let rg_reload = printf(rg_fmt, '{q}')
  let git_dir = 'git'
        \ .' -C '.expand('%:p:h')
        \ .' rev-parse'
        \ .' --show-toplevel'
        \ .' 2> /dev/null'
  let spec = {
    \ 'options': [
    \     '--no-extended',
    \     '--no-mouse',
    \     '--prompt', 'Σ ',
    \     '--exact',
    \     '-i',
    \     '--phony',
    \     '--query', a:query,
    \     '--bind', 'change:reload:'.rg_reload,
    \     '--preview-window', 'hidden',
    \     '--preview', '''/Users/klasseg/.vim/plugged/fzf.vim/bin/preview.sh'' {}'
    \ ],
    \ 'dir': systemlist(git_dir)[0]
    \ }
  call fzf#vim#grep(rg_init, 1, spec, a:fullscreen)
endfun
com! -bang -nargs=* RG call RgFzf(<q-args>, <bang>0)

" com! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat {}']}, <bang>0)
com! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>,
      \ {'options': [
      \    '--layout=reverse',
      \    '--info=inline',
      \    '--preview', '~/.zsh/scripts/preview-file.zsh {}',
      \    '--preview-window=right:90%'
      \   ]
      \ }, <bang>0)
" com! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"* markdown-preview.nvim
let g:mkdp_preview_options = {
      \ 'disable_sync_scroll': 1,
      \ 'hide_yaml_meta': 1
      \ }
let g:mkdp_page_title = '「${name}」'
"* vim-surround
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
"* vim-multiple-cursors
let g:VM_leader = '’'
let g:VM_maps = {
      \   'Align Char':       '’',
      \   'Find Under':         '',
      \   'Find Subword Under': '',
      \   'Select l':           '<S-Right>',
      \   'Select h':           '<S-Left>',
      \ }
fun! VM_Start()
  nmap <buffer> <C-C> <Esc>
  imap <buffer> <C-C> <Esc>
endfun
fun! VM_Exit()
  nunmap <buffer> <C-C>
  iunmap <buffer> <C-C>
endfun
"* vim-gitgutter
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_diff_args =
  \  ' --no-color'
  \ .' --ignore-cr-at-eol'
  \ .' --ignore-space-at-eol'
  \ .' --ignore-space-change'
  \ .' --ignore-all-space'
  \ .' --ignore-blank-lines'
"* vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['arc-lang=arc']
"* NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\~$']
let NERDTreeRespectWildIgnore = 1
let NERDTreeWinSize = 13
let NERDTreeMinimalUI = 1
let NERDTreeStatusline = ''
"* vim-matchup
let g:matchup_matchparen_stopline = 100
let g:matchup_matchparen_deferred = 0
let g:matchup_matchparen_status_offscreen = 0
"* Vimtex
" let g:vimtex_view_method = 'zathura'
let g:vimtex_indent_bib_enabled = 0
let g:tex_conceal = 'abdmgs'
let g:vimtex_view_method = 'skim'
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
      \ 'build_dir': {-> system("git rev-parse --show-toplevel | tr -d '\\n'") . '/target'}
      \}
"* Thesaurus
" let g:tq_python_version = 2
" let g:vimtex_log_verbose = 0
" let g:vimtex_quickfix_enabled = 0
" let g:vimtex_quickfix_latexlog = {'default' : 0}
" let g:vimtex_quickfix_latexlog = {
"       \  'default'    : 1,
"       \  'general'    : 1,
"       \  'references' : 1,
"       \  'overfull'   : 1,
"       \  'underfull'  : 1,
"       \  'font'       : 1,
"       \  'packages'   : {
"       \    'default'  : 1,
"       \    'natbib'   : 1,
"       \    'biblatex' : 1,
"       \    'babel'    : 1,
"       \    'hyperref' : 1,
"       \    'scrreprt' : 1,
"       \    'fixltx2e' : 1,
"       \    'titlesec' : 1,
"       \  },
"       \ }
"* winresizer
let g:winresizer_start_key = '<C-w>,'
"* vim-illuminate
let g:Illuminate_ftblacklist = ['startify']
let g:Illuminate_highlightUnderCursor = 1
hi illuminatedWord guibg=bg gui=underline
"* TComment
let g:tcomment#mode_extra = '#'
let g:tcomment_maps = 0
let g:tcomment#options = {'col': 1}
"* ALE
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = ''
let g:ale_completion_enabled = 0
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
let g:ale_sign_info = '*'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_keep_list_window_open = 1
let g:ale_linters = {
      \  'c':        ['ccls'],
      \  'cpp':      ['ccls'],
      \  'zsh':      ['shell'],
      \  'sh':       ['shell'],
      \  'rust':     ['rls'],
      \  'python':   ['pylint'],
      \  'scala':    ['metals'],
      \  'markdown': [''],
      \  'pandoc':   [''],
      \  'tex':      [''],
      \  'bib':      [''],
      \  'haskell':  ['cabal_ghc']
      \ }
let g:ale_fixers = {
      \  'tex':    [''],
      \  'c':      ['remove_trailing_lines', 'trim_whitespace', 'clang-format', 'uncrustify'],
      \  'cpp':    ['remove_trailing_lines', 'trim_whitespace', 'clang-format', 'uncrustify'],
      \  'rust':   ['remove_trailing_lines', 'trim_whitespace', 'rustfmt'],
      \  'zsh':    ['remove_trailing_lines', 'trim_whitespace'],
      \  'sh':     ['remove_trailing_lines', 'trim_whitespace', 'shfmt'],
      \  'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']
      \ }
let g:ale_rust_rls_config = { 'rust': { 'clippy_preference': 'on' } }
" let g:ale_rust_rls_executable = 'ra_lsp_server'
let g:ale_rust_rls_toolchain = 'nightly' 
let g:ale_rust_cargo_use_clippy = 1
let g:ale_scala_sbtserver_address = '127.0.0.1:4273'
let g:ale_c_ccls_init_options = {
    \   'cacheDirectory': '/tmp/ccls',
    \   'cacheFormat': 'binary',
    \   'diagnostics': {
    \     'onOpen': 0,
    \     'opChange': 1000,
    \   },
    \ }
"* pear-tree
let g:pear_tree_pairs = {
      \   '(':   {'closer': ')'},
      \   '[':   {'closer': ']'},
      \   '{':   {'closer': '}'},
      \   "'":   {'closer': "'"},
      \   '"':   {'closer': '"'},
      \   '/\*': {'closer': '\*/'}
      \ }
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_map_special_keys = 0
"* Startify
let g:startify_session_dir = '~/.vim/session'
let g:startify_list_order = ['files', 'dir', 'bookmarks', 'sessions', 'commands']
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
let g:startify_files_number = 20
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = map(split(system('fortune -s | cowsay'), '\n'), '"   ". v:val')
let g:startify_enable_unsafe = 1
let g:startify_skiplist = [
      \   '\.vim/',
      \   '/usr/*',
      \   '\.todo',
      \ ]
let g:startify_lists = [
      \   { 'header': ['   MRU'], 'type': 'files' },
      \   { 'header': ['   Sessions'], 'type': 'sessions' },
      \ ]
"* Lightline
let g:lightline = {
      \   'colorscheme': 'PaperColor',
      \   'active': {
      \     'left':  [ [ 'mode', 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ],
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
call lightline#coc#register()
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
" fun! LightLineDiff()
"   let [a,m,r] = GitGutterGetHunkSummary()
"   return printf('+%d ~%d -%d', a, m, r)
" endfun
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors   = "\uf05e"
let g:lightline#ale#indicator_ok       = "\uf00c"
"* Schlepp
let g:Schlepp#reindent  = 1
let g:Schlepp#dupTrimWS = 1
"* DrawIt
let g:draw_it_is_active = v:false
fun! ToggleDrawIt()
  if g:draw_it_is_active
    DIstop
  el
    DIsngl
  en
  let g:draw_it_is_active = !g:draw_it_is_active
endfun
" merlin
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
" [::Github Copilot::]
let g:copilot_filetypes = {
  \ 'haskell': v:false,
  \ 'markdown': v:true,
  \ }
" [::Treesitter::]
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "maintained",
"   sync_install = false,
"   ignore_install = { },
"   highlight = {
"     enable = true,
"     disable = { },
"     additional_vim_regex_highlighting = true,
"   },
"   incremental_selection = {
"     enable = true,
"     keymaps = {
"       init_selection = "gnn",
"       node_incremental = "grn",
"       scope_incremental = "grc",
"       node_decremental = "grm",
"     },
"   },
"   indent = {
"     enable = true
"   }
" }
" EOF
" [::Dressing::]
" lua <<EOF
" require('dressing').setup({
"   input = {
"     -- Default prompt string
"     default_prompt = "➤ ",
"
"     -- These are passed to nvim_open_win
"     anchor = "SW",
"     relative = "cursor",
"     row = 0,
"     col = 0,
"     border = "rounded",
"
"     -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
"     prefer_width = 40,
"     max_width = nil,
"     min_width = 20,
"
"     -- see :help dressing_get_config
"     get_config = nil,
"   },
"   select = {
"     -- Priority list of preferred vim.select implementations
"     backend = { "telescope", "fzf", "builtin", "nui" },
"
"     -- Options for telescope selector
"     telescope = {
"       -- can be 'dropdown', 'cursor', or 'ivy'
"       theme = "dropdown",
"     },
"
"     -- Options for fzf selector
"     fzf = {
"       window = {
"         width = 0.5,
"         height = 0.4,
"       },
"     },
"
"     -- Options for nui Menu
"     nui = {
"       position = "50%",
"       size = nil,
"       relative = "editor",
"       border = {
"         style = "rounded",
"       },
"       max_width = 80,
"       max_height = 40,
"     },
"
"     -- Options for built-in selector
"     builtin = {
"       -- These are passed to nvim_open_win
"       anchor = "NW",
"       relative = "cursor",
"       row = 0,
"       col = 0,
"       border = "rounded",
"
"       -- Window options
"       winblend = 10,
"
"       -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
"       width = nil,
"       max_width = 0.8,
"       min_width = 40,
"       height = nil,
"       max_height = 0.9,
"       min_height = 10,
"     },
"
"     -- see :help dressing_get_config
"     get_config = nil,
"   },
" })
" EOF
