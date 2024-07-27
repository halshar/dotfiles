return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 1000, lsp_format = "fallback" }
			end,
			formatters_by_ft = {
				go = { "goimports-reviser", "golines", "gofumpt" },
				javascript = { "prettier", "rustywind" },
				typescript = { "prettier", "rustywind" },
				javascriptreact = { "prettier", "rustywind" },
				typescriptreact = { "prettier", "rustywind" },
				html = { "prettier", "rustywind" },
				css = { "prettier" },
				json = { "jq" },
				markdown = { "prettier" },
				python = { "isort", "black" },
				lua = { "stylua" },
				ruby = { "rubyfmt" },
				rust = { "rustfmt" },
				bash = { "shellcheck", "shfmt" },
				sh = { "shellcheck", "shfmt" },
				toml = { "taplo" },
				yaml = { "yamlfmt" },
				xml = { "xmlformat" },
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>mf", function()
			conform.format({
				async = false,
				lsp_format = "fallback",
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
