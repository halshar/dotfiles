vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")
conform.setup({
	format_on_save = function(bufnr)
		-- disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { async = false, lsp_format = "fallback", timeout_ms = 2000 }
	end,
	formatters_by_ft = {
		bash = { "shellcheck", "shfmt" },
		css = { "prettier" },
		docker = { "dockerfmt" },
		go = { "goimports", "gofumpt" },
		helm = { "helmfmt" },
		html = { "prettier", "rustywind" },
		javascript = { "prettier", "rustywind" },
		json = { "jq" },
		just = { "just" },
		lua = { "stylua" },
		markdown = { "prettier" },
		python = { "ruff_format" },
		rust = { "rustfmt" },
		sh = { "shellcheck", "shfmt" },
		terraform = { "terraform_fmt" },
		toml = { "taplo" },
		typescript = { "prettier", "rustywind" },
		yaml = { "yamlfmt" },
	},
	formatters = {
		helmfmt = {
			command = "helmfmt",
			args = { "--files", "$FILENAME", "--stdout" },
			stdin = true,
		},
	},
})
