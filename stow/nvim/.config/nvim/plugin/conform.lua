vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")
conform.setup({
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { async = false, lsp_format = "fallback", timeout_ms = 1000 }
	end,
	default_format_opts = { lsp_format = "fallback" },
	formatters_by_ft = {
		docker = { "dockerfmt" },
		go = { "goimports", "gofumpt" },
		javascript = { "prettier", "rustywind" },
		typescript = { "prettier", "rustywind" },
		html = { "prettier", "rustywind" },
		css = { "prettier" },
		json = { "jq" },
		just = { "just" },
		markdown = { "prettier" },
		python = { "ruff_format" },
		lua = { "stylua" },
		rust = { "rustfmt" },
		bash = { "shellcheck", "shfmt" },
		sh = { "shellcheck", "shfmt" },
		toml = { "taplo" },
		terraform = { "terraform_fmt" },
		yaml = { "yamlfmt" },
	},
})
