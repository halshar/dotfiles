return {
	{
		"ramilito/kubectl.nvim",
		opts = {},
		keys = {
			{
				"<leader>bk",
				function()
					require("kubectl").toggle()
				end,
				desc = "Toggle kubectl",
				mode = "n",
			},
		},
	},
}
