vim.pack.add({
	"https://github.com/vague-theme/vague.nvim",
})

require("vague").setup({
	bold = true,
	italic = false,
	transparent = false,
})

vim.cmd("colorscheme vague")
