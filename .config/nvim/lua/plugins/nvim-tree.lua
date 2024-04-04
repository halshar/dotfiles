return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")
		nvimtree.setup({
			view = {
				width = 40,
			},
			git = {
				ignore = false,
			},
		})
	end,
	keys = {
		{ "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>" },
	},
}
