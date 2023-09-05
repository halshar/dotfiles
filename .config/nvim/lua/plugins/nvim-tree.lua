return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	version = "*",
	config = true,
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<CR>" },
	},
}
