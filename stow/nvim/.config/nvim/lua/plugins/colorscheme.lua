return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nightfox").setup({
			groups = {
				all = {
					MatchParen = { fg = "orange" },
				},
			},
		})
		vim.cmd("colorscheme carbonfox")
	end,
}
