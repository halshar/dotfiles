return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	opts = {
		cmdline = { enabled = false },
		completion = {
			accept = { auto_brackets = { enabled = false } },
			list = { selection = { preselect = false, auto_insert = false } },
			menu = { auto_show = false },
			documentation = { auto_show = true },
			ghost_text = { enabled = true },
		},
		signature = { enabled = true, window = { show_documentation = false } },
		keymap = {
			preset = "default",
			["<C-n>"] = { "show", "select_next", "fallback_to_mappings" },
			["<C-p>"] = { "show", "select_prev", "fallback_to_mappings" },
		},
		appearance = { nerd_font_variant = "mono" },
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
