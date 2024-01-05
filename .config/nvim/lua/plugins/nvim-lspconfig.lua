return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"vigoux/notifier.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("notifier").setup({
			components = { "lsp" },
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ansiblels",
				"bashls",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"gopls",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"pyright",
				"tailwindcss",
				"terraformls",
				"taplo",
				"tsserver",
				"yamlls",
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"ansible-lint",
				"black",
				"debugpy",
				"delve",
				"eslint_d",
				"gofumpt",
				"goimports-reviser",
				"golangci-lint",
				"golines",
				"hadolint",
				"mypy",
				"prettierd",
				"ruff",
				"rustywind",
				"shellcheck",
				"stylua",
				"tfsec",
				"trivy",
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
		end

		-- add borders to diagnostics
		vim.diagnostic.config({
			float = {
				border = "rounded",
			},
		})

		-- add borders to lsp hover and signature help
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- ansible lsp
		require("lspconfig").ansiblels.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
		})

		-- bash lsp
		require("lspconfig").bashls.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
		})

		-- css lsp
		require("lspconfig").cssls.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
		})

		-- docker lsp
		require("lspconfig").dockerls.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
		})

		require("lspconfig").docker_compose_language_service.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
		})

		-- golang lsp
		require("lspconfig").gopls.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
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
			capabilities = capabilities,
		})

		-- json lsp
		require("lspconfig").jsonls.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
		})

		-- lua lsp
		require("lspconfig").lua_ls.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
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
			capabilities = capabilities,
		})

		-- python lsp
		require("lspconfig").pyright.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
		})

		-- rust lsp
		require("lspconfig").rust_analyzer.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
			cmd = {
				"rustup",
				"run",
				"stable",
				"rust-analyzer",
			},
		})

		-- tailwindcss lsp
		require("lspconfig").tailwindcss.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
		})

		-- terraform lsp
		require("lspconfig").terraformls.setup({
			filetypes = { "terraform", "tf", "hcl" },
			on_attach = custom_attach,
			capabilities = capabilities,
		})

		-- toml lsp
		require("lspconfig").taplo.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
		})

		-- typescript lsp
		require("lspconfig").tsserver.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
		})

		-- yaml lsp
		require("lspconfig").yamlls.setup({
			on_attach = custom_attach,
			capabilities = capabilities,
		})
	end,
}
