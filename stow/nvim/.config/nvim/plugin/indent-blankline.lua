vim.pack.add({
	"https://github.com/lukas-reineke/indent-blankline.nvim",
})

require("ibl").setup({
	indent = {
		char = { "│" },
		smart_indent_cap = false,
	},
	scope = {
		enabled = false,
	},
})
