let mapleader = " "
set nocompatible
filetype plugin indent on
syntax on " syntax highlighting

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'Yggdroot/indentLine'
Plugin 'suan/vim-instant-markdown'

call vundle#end()

" Some basics:
    set encoding=utf-8
    set clipboard=unnamed
    set ruler
    set hidden
    set nobackup
    set cursorline
    set wildmenu
    set lazyredraw
    set number relativenumber

" Edit setting:
    set tabstop=4 " number of visual spcaes per TAB
    set softtabstop=4 "number of spaces in the TAB when editing
    set expandtab " tabs are spaces

" Search settings:
    set showmatch " highlight matching [{()}]
    set incsearch " search as characters are entered

" Useful settings:
    set history=700
    set undolevels=700

" Enable folding:
    set foldmethod=indent
    set foldlevel=99

" Enable autocompletion:
    set wildmode=longest,list,full

" Disable automatic commenting on newline:
    autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>s:
    map <leader>s :setlocal spell! spelllang=en_us<CR>

" LaTeX live preview with leader + l:
    map <leader>l :LLPStartPreview<CR>

" Switch between last two open buffers with leader + leader:
    nnoremap <leader><leader> <c-^>

" Save with leader + w:
    nnoremap <leader>w :w<CR>

" Switch buffers forward with leader + n:
    nnoremap <leader>n :bn<CR>

" Switch buffers backward with leader + p:
    nnoremap <leader>p :bp<CR>

" Toggle fold with shift+tab:
    nnoremap <s-tab> za

" Toggle indent lines with leader + i:
    nnoremap <leader>i :IndentLinesToggle<CR>

" Clear the terminal with leader + c:
    nnoremap <leader>c :!clear<CR>

" Run python with leader + r:
    nnoremap <leader>r :! python

" Copy and Paste from vim to another program:
    vnoremap <C-c> "*y :let @+=@*<CR>
    map <C-p> "+P

" Splits open at the bottom and right:
    set splitbelow splitright

" Shortcutting spell navigation:
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" NERDTREE key mapping:
    :map <C-n> :NERDTree<CR>

" Mouse support:
    set mouse=a

" Easier moving of code blocks:
    vnoremap < <gv
    vnoremap > >gv

" Gruvbox :
    colorscheme gruvbox
    set background=dark

" Vim-airline:
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_alt_sep = '|'

" Vim instant markdown:
    let g:instant_markdown_autostart=0
    map <leader>m :InstantMarkdownPreview<CR>

" YouCompleteMe :
    let g:ycm_autoclose_preview_window_after_completion=1

" VimLScript :
    let g:SimpylFold_docstring_preview=1

" LaTeX live preview:
    let g:livepreview_previewer = 'zathura'
    let g:livepreview_cursorhold_recompile = 0

" Indent line:
    set list lcs=tab:\┊\ 
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']
    highlight SpecialKey ctermfg=8

