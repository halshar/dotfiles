let mapleader = " "
set nocompatible
filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'nvie/vim-flake8'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'tpope/vim-commentary'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'powerline/powerline'
Plugin 'valloric/youcompleteme'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'suan/vim-instant-markdown'
Plugin 'junegunn/goyo.vim'

call vundle#end()

" Some basics:
    set encoding=utf-8
    set clipboard=unnamed
    set ruler
    set autoindent
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

" Replace the word under the cursor with leader + *:
    nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" Goyo plugin makes text more readable when writing prose:
    map <leader>g : Goyo \| set linebreak<CR>

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

" Close the current buffer with leader + q:
    nnoremap <leader>bq :bp <bar> bd! #<cr>

" Toggle fold with shift+tab:
    nnoremap <s-tab> za

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

" Mouse support:
    set mouse=a

" Easier moving of code blocks:
    vnoremap < <gv
    vnoremap > >gv

" Onedark color scheme:
    colorscheme onedark
    let g:onedark_hide_endofbuffer=1
    let g:onedark_termcolors=256
    let g:airline_theme='onedark'

" Vim-devicons:
    let g:WebDevIconsUnicodeDecorateFolderNodes=1

" Vim-airline:
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_alt_sep = '|'

" NERDTREE key mapping:
    :map <C-n> :NERDTree<CR>

" Better whitespace:
    let g:better_whitespace_enabled = 1
    let g:strip_whitespace_on_save = 1

" Make your code look pretty:
    let python_highlight_all=1

" Vim instant markdown:
    let g:instant_markdown_autostart=0
    map <leader>md :InstantMarkdownPreview<CR>

" YouCompleteMe :
    let g:ycm_autoclose_preview_window_after_completion=1

" VimLScript :
    let g:SimpylFold_docstring_preview=1

" LaTeX live preview:
    let g:livepreview_previewer = 'zathura'
    let g:livepreview_cursorhold_recompile = 0
