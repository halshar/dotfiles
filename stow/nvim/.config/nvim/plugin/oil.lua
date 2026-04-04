vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
})

require("oil").setup({
	default_file_explorer = true,
	columns = {},
	view_options = {
		show_hidden = true,
	},
	float = {
		padding = 0,
		win_options = {
			winblend = 0,
		},
	},
	keymaps = {
		["<C-h>"] = false,
		["<C-l>"] = false,
		["<C-x>"] = {
			"actions.select",
			opts = { horizontal = true },
			desc = "Open the entry in a horizontal split",
		},
	},
})
