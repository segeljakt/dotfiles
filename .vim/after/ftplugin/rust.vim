
no <silent> ∃       :CocCommand rust-analyzer.moveItemDown<CR>
no <silent> °       :CocCommand rust-analyzer.moveItemUp<CR>
nno  <buffer>  <     a<><C-c>i|         " Generics
vmap <buffer>  »     sa<hiBox<C-c>|     " Box
nmap <buffer>  <C-a> <Plug>(coc-fix-current)
" set foldmethod=manual             " manual,indent,expr,marker,syntax,diff

let g:rustfmt_fail_silently = 1
let g:rust_fold = 1
let g:rust_clip_command = 'pbcopy'

set nowrap

" hi Function ctermfg=31 cterm=bold
" hi Function ctermfg=238 cterm=bold
