let mapleader = " "

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'dikiaap/minimalist'
Plugin 'joshdick/onedark.vim'
"Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'powerline/powerline'
Plugin 'valloric/youcompleteme'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'ryanoasis/vim-devicons'
"Plugin 'raimondi/delimitmate'
Plugin 'nvie/vim-flake8'
Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'vim-scripts/indentpython.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'junegunn/goyo.vim'

call vundle#end()

" Some basics:
    set nocompatible
    filetype plugin indent on
    syntax on
    set encoding=utf-8
    set clipboard=unnamed
    set ruler
    set autoindent
    set showmatch
    set nobackup
    set cursorline
    set wildmenu
    set lazyredraw
    set number relativenumber

" Edit setting:
    set tabstop=4 " number of visual spcaes per TAB
    set softtabstop=4 "number of spaces in the TAB when editing
    set expandtab " tabs are spaces

" Search settings
    set showmatch " highlight matching [{()}]
    set incsearch " search as characters are entered

" Enable autocompletion:
    set wildmode=longest,list,full

" Disable automatic commenting on newline:
    autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
    map <leader>f : Goyo \| set linebreak<CR>

" Spell-check set to <leader>0:
    map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right:
    set splitbelow splitright

" Shortcutting spell navigation:
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" Copy selected text to system clipboard:
    vnoremap <C-c> "*Y :let @+=@*<CR>
    map <C-p> "+P

" Easier moving of code blocks
    vnoremap < <gv
    vnoremap > >gv

" Useful settings
    set history=700
    set undolevels=700

" Minimalist Color Scheme
"    set t_Co=256
"    syntax on
"    colorscheme minimalist
"    let g:airline_theme='minimalist'
"    let g:airline_powerline_fonts = 1
"    let g:airline#extensions#tabline#enabled = 1

" Onedark Color Scheme
    syntax on
    colorscheme onedark
    let g:onedark_hide_endofbuffer=1
    let g:onedark_termcolors=256
    let g:airline_theme='onedark'

" Vim-devicons
    let g:WebDevIconsUnicodeDecorateFolderNodes=1

" Vim-airline
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_alt_sep = '|'

" NERDTREE key mapping.
    :map <C-n> :NERDTree

" Better Whitespace
    let g:better_whitespace_enabled = 1
    "let g:strip_whitespace_on_save = 1

" Make your code look pretty.
    let python_highlight_all=1
