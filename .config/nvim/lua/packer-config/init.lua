return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'Mofiqul/dracula.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    use 'fatih/vim-go'
    use 'AndrewRadev/splitjoin.vim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lualine/lualine.nvim'
    use 'vimwiki/vimwiki'
    use 'tpope/vim-commentary'
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
end)