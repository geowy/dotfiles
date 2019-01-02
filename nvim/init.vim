" important
set nocompatible
set t_Co=256
filetype plugin indent on
let mapleader = ","

" plugin management
call plug#begin('~/.config/nvim/plugged')
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/matchit.zip'
Plug 'yggdroot/leaderf', { 'do': './install.sh' }
call plug#end()

" plugin config
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:ackprg = 'ag --vimgrep'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" windows
set splitbelow
set splitright

" displaying text
set nowrap
set number

" moving around, searching and patterns
set path+=**
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" syntax, hightlighting and spelling
" colorscheme desert
set hlsearch
syntax on

" using the mouse
set mouse=a
set mousefocus

" messages and info
set showcmd
set ruler
set confirm

" selecting text
set clipboard=unnamed,unnamedplus
packadd! matchit

" editing text
map Y y$
set backspace=indent,eol,start

" tabs and indenting
set tabstop=8
set shiftwidth=2
set smarttab
set softtabstop=2
set expandtab
set autoindent
set smartindent

" reading and writing files
set autoread

" the swap file
set directory-=.

" command line editing
set history=1000
set wildignorecase
set wildmenu

" multi-byte characters
set encoding=utf-8