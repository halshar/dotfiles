return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'fatih/vim-go'
    use 'AndrewRadev/splitjoin.vim'
    use 'vimwiki/vimwiki'
    use 'tpope/vim-commentary'
    use 'Mofiqul/dracula.nvim'
    use {'ojroques/nvim-hardline'}
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use { 'iamcco/markdown-preview.nvim', run = function() vim.fn["mkdp#util#install"]() end,}
end)
