return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			dim_inactive = { enabled = false },
			transparent_background = false,
			show_end_of_buffer = true,
			term_colors = false,
			no_italic = true,
			no_bold = false,
			no_underline = false,
			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				miscs = {},
			},
			default_integrations = true,
			integrations = {
				diffview = true,
				fidget = true,
				lsp_trouble = true,
				mason = true,
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
