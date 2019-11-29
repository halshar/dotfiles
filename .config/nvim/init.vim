let mapleader=" "
filetype plugin indent on
syntax on

call plug#begin('~/.config/nvim/plugged')

" Plug 'morhetz/gruvbox'
" Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'neomake/neomake'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
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

" Open terminal with leader + t:
    nnoremap <leader>t :terminal<CR>

" Run c/cpp program with leader + c:
    nnoremap <leader>c :terminal rp %<CR>

" Run python program with leader + r:
    nnoremap <leader>r :terminal python %<CR>

" Ctrl + s to exit terminal:
    tnoremap <C-s> <C-\><C-n>

" Switch between last two open buffers with leader + leader:
    nnoremap <leader><leader> <c-^>

" Switch buffers forward with leader + n:
    nnoremap <leader>n :bn<CR>

" Switch buffers backward with leader + p:
    nnoremap <leader>p :bp<CR>

" Markdown Preview :
    map <leader>m :MarkdownPreview<CR>

" Navigate auto-completion list with tab:
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" " Gruvbox:
"      colorscheme gruvbox
"      set background=dark

" " Onedark:
"     syntax on
"     colorscheme onedark

" Vim-airline:
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_alt_sep = '|'

" Vimwiki uses markdown syntax:
    let g:vimwiki_list = [{'path': '~/vimwiki/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]

" Markdown preview:
    let g:mkdp_auto_close = 0
    let g:mkdp_refresh_slow = 1

" Neomake when writing a buffer (no delay):
    call neomake#configure#automake('w')
    let g:neomake_open_list = 2

" Use deoplete:
    let g:deoplete#enable_at_startup = 1
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
