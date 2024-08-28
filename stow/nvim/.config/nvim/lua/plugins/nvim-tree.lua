return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		view = {
			width = 50,
		},
		filters = {
			dotfiles = false,
		},
		git = {
			ignore = false,
		},
	},
	keys = {
		{
			"<leader>e",
			"<cmd>NvimTreeFindFileToggle<CR>",
			desc = "Toggle NvimTree",
			mode = "n",
		},
	},
}
