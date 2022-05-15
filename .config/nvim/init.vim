let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
call plug#begin('~/.vim/plugged')
source ~/.vim/plugins.vim
call plug#end()
lua require('init')
source ~/.vim/vimrc
source ~/.vim/plugin-conf.vim
finish
