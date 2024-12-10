return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		-- Function for additional args to exclude .git directory
		local function additional_args()
			return { "--hidden", "--glob", "!**/.git/*" }
		end

		local action_layout = require("telescope.actions.layout")

		require("telescope").setup({
			defaults = require("telescope.themes").get_ivy({
				preview = {
					hide_on_startup = true,
				},
				mappings = {
					n = {
						["<C-s>"] = "select_vertical",
						["<C-o>"] = action_layout.toggle_preview,
					},
					i = {
						["<C-u>"] = false,
						["<C-s>"] = "select_vertical",
						["<C-o>"] = action_layout.toggle_preview,
					},
				},
			}),
			pickers = {
				find_files = {
					hidden = true,
					find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
				},
				live_grep = {
					additional_args = additional_args,
				},
				grep_string = {
					additional_args = additional_args,
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
