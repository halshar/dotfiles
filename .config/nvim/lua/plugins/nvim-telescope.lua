return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				undo = {
					use_delta = true,
					side_by_side = true,
					layout_strategy = "vertical",
					layout_config = {
						preview_height = 0.8,
					},
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
