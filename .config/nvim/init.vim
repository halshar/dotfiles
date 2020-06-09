let mapleader=" "

call plug#begin()

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-commentary'
    Plug 'ap/vim-css-color'
    Plug 'vimwiki/vimwiki'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

call plug#end()

" Basic settings:
    set termguicolors
    set clipboard+=unnamedplus
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

" Shortcutting split navigation:
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" COC-nvim:
    inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

" Vim-airline:
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_alt_sep = '|'

" Vimwiki :
    let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
    let g:vimwiki_table_mappings = 0

" Markdown-preview.nvim:
    let g:mkdp_auto_close = 0
    let g:mkdp_refresh_slow = 1
