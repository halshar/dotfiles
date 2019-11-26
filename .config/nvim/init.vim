let mapleader=" "
filetype plugin indent on
syntax on

call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'neomake/neomake'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" Some basics:
    set encoding=utf-8
    set clipboard+=unnamedplus
    set termguicolors
    set ruler
    set hidden
    set nobackup
    set cursorline
    set wildmenu
    set number relativenumber
    set wrap
    set linebreak
    set scrolloff=5

" Edit settings:
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab

" Search settings:
    set showmatch
    set incsearch

" Splits open at the bottom and right:
    set splitbelow splitright

" Easier moving of code blocks:
    vnoremap < <gv
    vnoremap > >gv

" Shortcutting split navigation:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l        

" Open terminal with leader + t:
    nnoremap <leader>t :terminal<CR>

" Ctrl + s to exit terminal:
    tnoremap <C-s> <C-\><C-n>

" Switch between last two open buffers with leader + leader:
    nnoremap <leader><leader> <c-^>

" Switch buffers forward with leader + n:
    nnoremap <leader>n :bn<CR>

" Switch buffers backward with leader + p:
    nnoremap <leader>p :bp<CR>

" Navigate auto-completion list with tab:
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Gruvbox:
     colorscheme gruvbox
     set background=dark

" Vim-airline:
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_alt_sep = '|'

" Vimwiki uses markdown syntax:
    let g:vimwiki_list = [{'path': '~/vimwiki/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]

" Neomake when writing a buffer (no delay):
    call neomake#configure#automake('w')
    let g:neomake_open_list = 2

" Use deoplete:
    let g:deoplete#enable_at_startup = 1
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
