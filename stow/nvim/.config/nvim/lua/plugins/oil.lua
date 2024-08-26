return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		view_options = {
			show_hidden = true,
		},
		float = {
			padding = 0,
			win_options = {
				winblend = 0,
			},
		},
	},
	keys = {
		{
			"<leader>fo",
			function()
				vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil")
			end,
			desc = "Toggle Oil or close Oil buffer",
			mode = "n",
		},
	},
}
