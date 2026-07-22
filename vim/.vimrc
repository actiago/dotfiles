" General
set wildmenu
set viminfo=
set splitright

" Disable backup
set nobackup
set noswapfile
set nowritebackup

" Colors and theme
filetype on
filetype plugin off
syntax on
colorscheme desert
set background=dark

set number
set ruler
set title

" Space and Tabs
set expandtab
set nostartofline
set shiftwidth=4
set tabstop=4

" Cursos and column
" set cursorline
set cursorcolumn

" 'colorcolumn' unsuported by VIM7.2
if exists('+colorcolumn')
  set colorcolumn=80
endif

highlight CursorColumn ctermbg=DarkGray
highlight ColorColumn ctermbg=DarkGray

" Identation
" filetype plugin indent on
" set autoindent

" Search
set ignorecase
set hlsearch
set incsearch

" Set UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Shortcuts
map 0 ^

map <Tab> :tabnext<cr>
map <S-Tab> :tabprevious<cr>


" File syntax
au BufNewFile,BufRead composer.lock set filetype=json
au BufNewFile,BufRead docker-compose*.yml set filetype=yaml
au BufNewFile,BufRead Jenkinsfile set filetype=groovy
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au BufNewFile,BufRead *.textile set filetype=redminewiki
au BufNewFile,BufRead *.tfstate set filetype=json
