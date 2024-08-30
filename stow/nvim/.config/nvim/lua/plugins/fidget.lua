return {
	"j-hui/fidget.nvim",
	opts = {
		progress = {
			ignore = { "null-ls" },
		},
		integration = {
			["nvim-tree"] = {
				enable = false,
			},
		},
	},
}
