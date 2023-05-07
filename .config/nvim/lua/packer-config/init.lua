return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'vimwiki/vimwiki'
    use 'numToStr/Comment.nvim'
    use 'Mofiqul/dracula.nvim'
    use 'ojroques/nvim-hardline'
    use 'mbbill/undotree'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'mattn/emmet-vim'
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use 'NvChad/nvim-colorizer.lua'
    use {'nvim-telescope/telescope.nvim', tag = '0.1.1',}
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use { 'iamcco/markdown-preview.nvim', run = function() vim.fn["mkdp#util#install"]() end,}
end)
