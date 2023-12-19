return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local code_actions = null_ls.builtins.code_actions
		local diagnostics = null_ls.builtins.diagnostics
		local formatting = null_ls.builtins.formatting

		local sources = {
			formatting.black,
			code_actions.eslint_d,
			code_actions.gitsigns,
			formatting.prettierd,
			formatting.stylua,
			formatting.gofumpt,
			formatting.goimports_reviser,
			formatting.golines,
			formatting.rustfmt,
			formatting.rustywind,
			diagnostics.golangci_lint,
			diagnostics.hadolint,
			diagnostics.eslint_d,
			diagnostics.mypy,
			diagnostics.ruff,
			diagnostics.shellcheck,
			diagnostics.yamllint,
		}

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = sources,
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
