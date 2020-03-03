let mapleader=" "
filetype plugin indent on
syntax on

call plug#begin()

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'

call plug#end()

" Some basics:
    set termguicolors
    set hidden
    set cursorline
    set number relativenumber
    set scrolloff=5

" Edit settings:
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab

" Splits open at the bottom and right:
    set splitbelow splitright

" Easier moving of code blocks:
    vnoremap < <gv
    vnoremap > >gv

" Easier splits resizing:
    map <C-Up> <C-w>+
    map <C-Down> <C-w>-
    map <C-Left> <C-w><
    map <C-Right> <C-w>>

" Shortcutting split navigation:
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" Disable automatic commenting on newline:
    autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Switch between last two open buffers with leader + leader:
    nnoremap <leader><leader> <c-^>

" Switch buffers forward with leader + n:
    nnoremap <leader>n :bn<CR>

" Switch buffers backward with leader + p:
    nnoremap <leader>p :bp<CR>

" Run c/cpp program with leader + c:
    nnoremap <leader>c :terminal rp %<CR>

" Run python program with leader + r:
    nnoremap <leader>r :terminal python %<CR>

" Execute BASH script with leader + b:
    nnoremap <leader>b :terminal ./%<CR>

" Add executable permission with leader + e:
    nnoremap <leader>e :!chmod u+x %<CR>

" Use deoplete:
    let g:deoplete#enable_at_startup = 1

" Navigate auto-completion list with tab:
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Vim-airline:
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_alt_sep = '|'
