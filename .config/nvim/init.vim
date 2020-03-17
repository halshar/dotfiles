filetype plugin indent on
syntax on

call plug#begin()

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'

call plug#end()

" Basic settings:
    set termguicolors
    set clipboard=unnamedplus
    set hidden
    set cursorline
    set relativenumber
    set scrolloff=5

" Edit settings:
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab

" Splits open at the bottom and right:
    set splitbelow splitright

" Disable automatic commenting on newline:
    autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Use deoplete:
    let g:deoplete#enable_at_startup = 1

" Navigate auto-completion list with tab:
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Vim-airline:
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_alt_sep = '|'
