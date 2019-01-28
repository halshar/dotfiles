set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set hidden
set clipboard=unnamed

"easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

"Useful settings
set history=700
set undolevels=700

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'dikiaap/minimalist'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'powerline/powerline'
Plugin 'valloric/youcompleteme'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'ryanoasis/vim-devicons'
Plugin 'raimondi/delimitmate'
Plugin 'nvie/vim-flake8'
Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()            " required
filetype plugin indent on    " required

"Minimalist Color Scheme
set t_Co=256
syntax on
colorscheme minimalist

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"NERDTREE key mapping.
:map <C-n> :NERDTree

"Better Whitespace
let g:better_whitespace_enabled = 1
"let g:strip_whitespace_on_save = 1

