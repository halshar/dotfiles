return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"gopls",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"tsserver",
				"yamlls",
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"eslint_d",
				"gofumpt",
				"goimports-reviser",
				"golangci-lint",
				"golines",
				"hadolint",
				"prettierd",
				"shellcheck",
				"stylua",
				"yamllint",
			},
			auto_update = false,
			run_on_start = false,
		})

		-- function with all the mappings
		local custom_attach = function()
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
			vim.keymap.set("n", "gr", vim.lsp.buf.rename, { buffer = 0 })
			vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { buffer = 0 })
			vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { buffer = 0 })
			vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
			vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
			vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { buffer = 0 })
		end

		-- bash lsp
		require("lspconfig").bashls.setup({
			on_attach = custom_attach,
		})

		-- css lsp
		require("lspconfig").cssls.setup({
			on_attach = custom_attach,
		})

		-- docker lsp
		require("lspconfig").dockerls.setup({
			on_attach = custom_attach,
		})

		require("lspconfig").docker_compose_language_service.setup({
			on_attach = custom_attach,
		})

		-- golang lsp
		require("lspconfig").gopls.setup({
			on_attach = custom_attach,
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
				},
			},
		})

		-- html lsp
		require("lspconfig").html.setup({
			on_attach = custom_attach,
		})

		-- json lsp
		require("lspconfig").jsonls.setup({
			on_attach = custom_attach,
		})

		-- lua lsp
		require("lspconfig").lua_ls.setup({
			on_attach = custom_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- markdown lsp
		require("lspconfig").marksman.setup({
			on_attach = custom_attach,
		})

		-- typescript lsp
		require("lspconfig").tsserver.setup({
			on_attach = custom_attach,
		})

		-- yaml lsp
		require("lspconfig").yamlls.setup({
			on_attach = custom_attach,
		})
	end,
}
