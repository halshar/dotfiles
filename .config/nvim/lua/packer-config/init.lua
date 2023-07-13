return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'dracula/vim'
    use 'ojroques/nvim-hardline'
    use 'mbbill/undotree'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'mattn/emmet-vim'
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use 'sindrets/diffview.nvim'
    use 'NvChad/nvim-colorizer.lua'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use { 'echasnovski/mini.surround', branch = 'stable' }
    use { 'echasnovski/mini.comment', branch = 'stable' }
    use {'nvim-telescope/telescope.nvim', tag = '0.1.1',}
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use { 'iamcco/markdown-preview.nvim', run = function() vim.fn['mkdp#util#install']() end}
end)
