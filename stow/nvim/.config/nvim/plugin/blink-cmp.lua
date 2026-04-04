vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
})

require("blink.cmp").setup({
	cmdline = { enabled = false },
	completion = {
		accept = { auto_brackets = { enabled = false } },
		list = { selection = { preselect = false, auto_insert = false } },
		menu = { auto_show = false },
		documentation = { auto_show = true, auto_show_delay_ms = 150 },
		ghost_text = { enabled = true },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	signature = { enabled = true, window = { show_documentation = false } },
	keymap = {
		preset = "default",
		["<C-n>"] = { "show", "select_next", "fallback_to_mappings" },
		["<C-p>"] = { "show", "select_prev", "fallback_to_mappings" },
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
	},
	appearance = { nerd_font_variant = "mono" },
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
