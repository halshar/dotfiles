let mapleader=" "
filetype plugin indent on
syntax on

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'neomake/neomake'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

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

" Useful settings:
    set history=100
    set undolevels=100

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

" Run c/cpp program with leader + c:
    nnoremap <leader>c :terminal rp %<CR>

" Run python program with leader + r:
    nnoremap <leader>r :terminal python %<CR>

" Close Neomake pop-up with leader + l:
    nnoremap <leader>l :lclose<CR>

" Switch between last two open buffers with leader + leader:
    nnoremap <leader><leader> <c-^>

" Switch buffers forward with leader + n:
    nnoremap <leader>n :bn<CR>

" Switch buffers backward with leader + p:
    nnoremap <leader>p :bp<CR>

" Load Xresources file with leader + x:
    nnoremap <leader>x :!xrdb ~/.Xresources<CR>

" Execute BASH script with leader + b:
    nnoremap <leader>b :terminal ./%<CR>

" Add executable permission with leader + e:
    nnoremap <leader>e :!chmod u+x %<CR>

" Markdown preview with leader + m :
    map <leader>m :MarkdownPreview<CR>

" Vim-airline:
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_alt_sep = '|'

" Vimwiki uses markdown syntax:
    let g:vimwiki_list = [{'path': '~/Documents/Notes/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]

" Markdown preview:
    let g:mkdp_auto_close = 0
    let g:mkdp_refresh_slow = 1

" Neomake when writing a buffer (no delay):
    call neomake#configure#automake('w')
    let g:neomake_open_list = 2
    let g:c_syntax_for_h=1
    let g:neomake_c_enabled_makers=['gcc']
    let g:neomake_cpp_enabled_makers=['gcc']
    let g:neomake_gcc_args=[
    \ '-fsyntax-only',
    \ '-std=gnu17',
    \ '-Wall',
    \ '-Wextra',
    \ '-fopenmp',
    \ '-I.'
    \ ]

function! InsertTabWrapper()
    let col = col(".") - 1
    if !col || getline(".")[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-p>
