" =========================
" Configuração básica
" =========================
set nocompatible
filetype off
syntax on
set number
set ruler
set title
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set clipboard=unnamedplus
set splitright
set background=dark
set cursorcolumn
set ignorecase
set hlsearch
set incsearch
if exists('+colorcolumn')
    set colorcolumn=80
endif

highlight CursorColumn ctermbg=DarkGray
highlight ColorColumn ctermbg=DarkGray

set encoding=utf-8
set fileencoding=utf-8

" Desabilita backup
set nobackup
set noswapfile
set nowritebackup

" Shortcuts
map 0 ^

map <Tab> :tabnext<cr>
map <S-Tab> :tabprevious<cr>


" =========================
" Gerenciador de plugins (vim-plug)
" =========================
call plug#begin('~/.vim/plugged')

" Explorador de arquivos
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Integração com tmux
Plug 'christoomey/vim-tmux-navigator'

" Suporte a sintaxe e LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugins para linguagens
Plug 'sheerun/vim-polyglot'        " Suporte para várias linguagens
Plug 'fatih/vim-go'               " Go
Plug 'rust-lang/rust.vim'         " Rust
Plug 'hashivim/vim-terraform'     " HCL/Terraform
Plug 'ekalinin/dockerfile.vim'    " Dockerfile

" =========================
" Tema - Catppuccin
" =========================
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" =========================
call plug#end()

colorscheme catppuccin-mocha

" =========================
" Configurações do NERDTree
" =========================
map <C-n> :NERDTreeToggle<CR>

" =========================
" Configurações do coc.nvim
" =========================
" Ativar autocomplete e linting
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-html',
    \ 'coc-tsserver',
    \ 'coc-pyright',
    \ 'coc-go',
    \ 'coc-rust-analyzer',
    \ 'coc-sh'
\ ]

" =========================
" Navegação com tmux
" =========================
" Usa Ctrl-h/j/k/l para navegar entre splits e painéis do tmux
" Leia https://martinlwx.github.io/en/config-neovim-from-scratch/
" https://gist.github.com/lovung/e9c3f626a1734c1ce0b75106d70b1278
