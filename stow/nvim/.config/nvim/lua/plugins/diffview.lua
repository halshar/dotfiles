return {
	"sindrets/diffview.nvim",
	dependencies = { "tpope/vim-fugitive" },
	keys = {
		{
			"<leader>gh",
			"<cmd>DiffviewFileHistory<CR>",
			mode = "n",
			desc = "Open Diffview File History",
		},
		{
			"<leader>go",
			function()
				local lib = require("diffview.lib")
				local view = lib.get_current_view()
				if view then
					vim.cmd.DiffviewClose()
				else
					vim.cmd.DiffviewOpen()
				end
			end,
			mode = "n",
			desc = "Toggle Diffview",
		},
	},
}
