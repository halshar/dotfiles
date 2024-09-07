return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = { height = 0.95, width = 0.95 },
				mappings = {
					n = {
						["<C-s>"] = "select_vertical",
					},
					i = {
						["<C-s>"] = "select_vertical",
						["<C-u>"] = false,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				live_grep = {
					additional_args = function()
						return { "--hidden", "--glob", "!**/.git/*" }
					end,
				},
				grep_string = {
					additional_args = function()
						return { "--hidden", "--glob", "!**/.git/*" }
					end,
				},
			},
			extensions = {
				"fzf",
			},
		})
		require("telescope").load_extension("fzf")
	end,
	keys = {
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", mode = "n", desc = "Find Buffers" },
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", mode = "n", desc = "Find Files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", mode = "n", desc = "Live Grep" },
		{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", mode = "n", desc = "LSP Document Symbols" },
		{ "<leader>fd", "<cmd>Telescope diagnostics<CR>", mode = "n", desc = "Diagnostics" },
		{ "<leader>fc", "<cmd>Telescope git_commits<CR>", mode = "n", desc = "Git Commits" },
		{ "<leader>fm", "<cmd>Telescope spell_suggest<CR>", mode = "n", desc = "Spell Suggest" },
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>", mode = "n", desc = "Keymaps" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", mode = "n", desc = "Help Tags" },
	},
}
