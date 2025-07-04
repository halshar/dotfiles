return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local actions = require("fzf-lua").actions
		require("fzf-lua").setup({
			"ivy",
			defaults = {
				git_icons = false,
				file_icons = false,
				color_icons = false,
			},
			actions = {
				files = {
					["enter"] = actions.file_edit,
					["ctrl-x"] = actions.file_split,
					["ctrl-s"] = actions.file_vsplit,
				},
			},
			fzf_opts = { ["--cycle"] = true },
			winopts = { preview = { hidden = true, title = false } },
			buffers = { show_unloaded = false, sort_lastused = false },
			keymap = { builtin = { ["<c-o>"] = "toggle-preview" }, fzf = { ["ctrl-q"] = "select-all+accept" } },
		})
	end,
	keys = {
		{ "<leader>fb", "<cmd>FzfLua buffers<CR>", mode = "n", desc = "Fzf: Open Buffers" },
		{ "<leader>ff", "<cmd>FzfLua files<CR>", mode = "n", desc = "Fzf: Find Files" },
		{ "<leader>fg", "<cmd>FzfLua live_grep<CR>", mode = "n", desc = "Fzf: Live Grep" },
		{ "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", mode = "n", desc = "Fzf: LSP Document Symbols" },
		{ "<leader>fc", "<cmd>FzfLua git_commits<CR>", mode = "n", desc = "Fzf: Git Commits" },
		{ "<leader>fm", "<cmd>FzfLua spell_suggest<CR>", mode = "n", desc = "Fzf: Spell Suggest" },
		{ "<leader>fk", "<cmd>FzfLua keymaps<CR>", mode = "n", desc = "Fzf: Keymaps" },
		{ "<leader>fh", "<cmd>FzfLua helptags<CR>", mode = "n", desc = "Fzf: Help Tags" },
	},
}
