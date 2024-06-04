return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local servers = {
			bashls = {},
			html = {},
			cssls = {},
			tailwindcss = {},
			tsserver = {},
			ansiblels = {},
			yamlls = {},
			gitlab_ci_ls = {},
			jsonls = {},
			dockerls = {},
			docker_compose_language_service = {},
			taplo = {},
			pyright = {},
			powershell_es = {
				cmd = { "pwsh" },
			},
			lua_ls = {
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			gopls = {
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
					},
				},
			},
			rust_analyzer = {
				cmd = {
					"rustup",
					"run",
					"stable",
					"rust-analyzer",
				},
			},
		}

		local non_lsp = {
			"actionlint",
			"ansible-lint",
			"black",
			"checkmake",
			"debugpy",
			"delve",
			"eslint_d",
			"gofumpt",
			"goimports-reviser",
			"golangci-lint",
			"golines",
			"hadolint",
			"isort",
			"jq",
			"mypy",
			"prettier",
			"ruff",
			"rustywind",
			"shfmt",
			"shellcheck",
			"stylelint",
			"stylua",
			"yamlfmt",
			"yamllint",
			"xmlformatter",
		}

		-- this function gets run when an LSP connects to a particular buffer.
		local on_attach = function(_, bufnr)
			local nmap = function(mode, keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("n", "gr", vim.lsp.buf.rename, "Rename")
			nmap("n", "ga", vim.lsp.buf.code_action, "Code Action")
			nmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
			nmap("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
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

		-- capabilities for auto-completion
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool = require("mason-tool-installer")

		-- ensure the servers are installed
		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		-- ensure the linters and formatters are installed
		mason_tool.setup({
			ensure_installed = non_lsp,
			auto_update = false,
			run_on_start = false,
		})

		-- setup lsp handlers
		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
					filetypes = (servers[server_name] or {}).filetypes,
				})
			end,
		})
	end,
}
