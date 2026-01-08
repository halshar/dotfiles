return {
	"folke/trouble.nvim",
	opts = {},
	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle focus=true filter.buf=0<CR>",
			mode = "n",
			desc = "Toggle Trouble Diagnostics for Current Buffer",
		},
		{
			"<leader>tw",
			"<cmd>Trouble diagnostics toggle focus=true<CR>",
			mode = "n",
			desc = "Toggle Trouble Diagnostics",
		},
		{
			"<leader>tl",
			"<cmd>Trouble loclist toggle focus=true<CR>",
			mode = "n",
			desc = "Toggle Trouble Loclist",
		},
		{
			"<leader>tq",
			"<cmd>Trouble qflist toggle focus=true<CR>",
			mode = "n",
			desc = "Toggle Trouble Quickfix List",
		},
		{
			"gr",
			"<cmd>Trouble lsp_references focus=true win.position=bottom<CR>",
			mode = "n",
			desc = "Show LSP References in Trouble",
		},
		{
			"gd",
			"<cmd>Trouble lsp_definitions focus=true win.position=bottom<CR>",
			mode = "n",
			desc = "Show LSP Definitions in Trouble",
		},
	},
}
