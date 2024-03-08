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
colorscheme elflord
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

" {{{ Plugins
call plug#begin('~/.config/nvim/plugged')
    "{{{ essentials
	Plug 'tveskag/nvim-blame-line'		" Git info
	Plug 'neomake/neomake'				" ShellCheck
	Plug 'junegunn/fzf.vim'				" fuzzy finder for lines, files, commits, etc.
	Plug 'godlygeek/tabular' 			" Vim script for text filtering and alignment
	Plug 'thaerkh/vim-indentguides'		" Identacoes
    Plug 'SirVer/ultisnips'
    Plug 'stephpy/vim-yaml'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'honza/vim-snippets'
    Plug 'preservim/nerdtree'
    Plug 'rust-lang/rust.vim'

	" Wilder Menu
	if has('nvim')
	  Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
	else
	  Plug 'gelguy/wilder.nvim'

	  " To use Python remote plugin features in Vim, can be skipped
	  Plug 'roxma/nvim-yarp'
	  Plug 'roxma/vim-hug-neovim-rpc'
	endif

	"}}}
	" {{{ the nerd (file) tree
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	let g:NERDTreeDirArrowExpandable = '+'
	let g:NERDTreeDirArrowCollapsible = '-'
	let g:NERDTreeMinimalUI = 1
	let NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '^.terragrunt-cache$', '^.terraform$']
	" }}}
" {{{ themes and additional highlighting
	Plug 'ryanoasis/vim-devicons' 			" Icons
	Plug 'morhetz/gruvbox' 					" Retro groove color scheme for Vim 
	Plug 'vim-airline/vim-airline' 			" Status Line
	Plug 'vim-airline/vim-airline-themes' 	" Status Line
	Plug 'keith/tmux.vim'               	" .tmux.conf syntax highlighting
	Plug 'hashivim/vim-terraform'          	" terraform related convenience
" }}}
call plug#end()
" }}}
" {{{ some Configs and functions
	colorscheme gruvbox
	" ShellCheck
	call neomake#configure#automake('nrwi', 500)
	" Default keys wilder
	call wilder#setup({
			\ 'modes': [':', '/', '?'],
			\ 'next_key': '<Tab>',
			\ 'previous_key': '<S-Tab>',
			\ 'accept_key': '<Down>',
			\ 'reject_key': '<Up>',
			\ })

	"{{{ IndentGuides
	let g:indentguides_spacechar = '▏'
	let g:indentguides_tabchar = '▏'
	"}}}
"}}}
