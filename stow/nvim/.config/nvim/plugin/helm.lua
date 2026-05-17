vim.pack.add({
	"https://github.com/qvalentin/helm-ls.nvim",
})

require("helm-ls").setup({
	conceal_templates = {
		enabled = true,
	},
	indent_hints = {
		enabled = true,
		only_for_current_line = false,
	},
	action_highlight = {
		enabled = true,
	},
})
