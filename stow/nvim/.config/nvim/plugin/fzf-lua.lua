vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
})

local actions = require("fzf-lua").actions
require("fzf-lua").setup({
	"ivy",
	defaults = {
		git_icons = false,
		file_icons = false,
		color_icons = false,
		hidden = true,
	},
	actions = {
		files = {
			["enter"] = actions.file_edit,
			["ctrl-x"] = actions.file_split,
			["ctrl-s"] = actions.file_vsplit,
			["ctrl-q"] = { fn = actions.file_sel_to_qf, prefix = "select-all" },
		},
	},
	fzf_opts = { ["--cycle"] = true },
	winopts = { preview = { hidden = true, title = false } },
	buffers = { show_unloaded = false, sort_lastused = true, actions = false },
	keymap = { builtin = { ["<c-o>"] = "toggle-preview" } },
})
