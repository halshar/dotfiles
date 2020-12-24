let mapleader="\<Space>"

call plug#begin()

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mattn/emmet-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-commentary'
    Plug 'ap/vim-css-color'
    Plug 'vimwiki/vimwiki'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'junegunn/fzf.vim'
    Plug 'lambdalisue/fern.vim'

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

" Remove search highlight:
    nnoremap <silent> <leader>h :nohlsearch<CR>

" Fern.vim:
    nnoremap <silent> <leader>e :Fern %:h -drawer -toggle<CR>

" Fzf.vim:
    nnoremap <silent><leader>b :Buffers<CR>
    nnoremap <silent><leader>f :Files<CR>
    nnoremap <silent><leader>g :GFiles<CR>
    nnoremap <leader>r :Rg!
    let g:fzf_layout = { "down": "40%" }

" Vimwiki :
    let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
    let g:vimwiki_table_mappings = 0

" Markdown-preview.nvim:
    let g:mkdp_auto_close = 0
    let g:mkdp_refresh_slow = 1

" Dracula colorscheme:
    let g:dracula_colorterm = 0
    colorscheme dracula

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

    let g:coc_global_extensions = ['coc-json', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-jedi']

    command! -nargs=0 Prettier :CocCommand prettier.formatFile

    " Remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
        nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

        function! s:show_documentation()
          if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
          else
            call CocAction('doHover')
          endif
        endfunction
