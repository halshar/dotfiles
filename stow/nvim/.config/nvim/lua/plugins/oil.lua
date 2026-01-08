return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
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
	},
	keys = {
		{
			"<leader>fo",
			function()
				local oil = require("oil")
				if vim.bo.filetype == "oil" then
					oil.close()
				else
					oil.toggle_float()
				end
			end,
			mode = "n",
			desc = "Toggle Oil buffer",
		},
	},
}
