set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'stephpy/vim-yaml'
Plug 'honza/vim-snippets'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

