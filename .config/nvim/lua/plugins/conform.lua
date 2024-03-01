return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				go = { "goimports-reviser", "golines", "gofumpt" },
				javascript = { "prettierd", "rustywind" },
				typescript = { "prettierd", "rustywind" },
				javascriptreact = { "prettierd", "rustywind" },
				typescriptreact = { "prettierd", "rustywind" },
				html = { "prettierd", "rustywind" },
				css = { "prettierd" },
				json = { "prettierd" },
				markdown = { "prettierd" },
				python = { "isort", "black" },
				lua = { "stylua" },
				rust = { "rustfmt" },
				bash = { "shellcheck", "shfmt" },
				sh = { "shellcheck", "shfmt" },
				toml = { "taplo" },
				yaml = { "yamlfmt" },
			},
		})
	end,
}
