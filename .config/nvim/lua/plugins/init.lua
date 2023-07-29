return {
	"mattn/emmet-vim",
	"tpope/vim-fugitive",
	"mbbill/undotree",
	"jose-elias-alvarez/null-ls.nvim",
	"sindrets/diffview.nvim",

	{
		"ojroques/nvim-hardline",
		opts = {},
	},

	{
		"NvChad/nvim-colorizer.lua",
		ft = { "css" },
		opts = {},
	},

	{
		"echasnovski/mini.surround",
		version = "*",
		opts = {},
	},

	{
		"echasnovski/mini.comment",
		version = "*",
		opts = {},
	},

	{
		"dracula/vim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("dracula")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			char = "│",
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
}
