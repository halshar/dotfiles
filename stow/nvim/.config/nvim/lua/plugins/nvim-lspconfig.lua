return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", cmd = { "Mason" }, config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lsp_servers = {
			ansiblels = {},
			bashls = {},
			cssls = {},
			docker_compose_language_service = {},
			dockerls = {},
			gitlab_ci_ls = {},
			gopls = { settings = { gopls = { analyses = { unusedparams = true } } } },
			helm_ls = { settings = { ["helm-ls"] = { yamlls = { path = "yaml-language-server" } } } },
			html = {},
			jsonls = {},
			lua_ls = {},
			powershell_es = {
				bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/",
				filetypes = { "ps1", "psm1", "psd1" },
				init_options = { enableProfileLoading = false },
				settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
			},
			ruff = {},
			rust_analyzer = { cmd = { "rustup", "run", "stable", "rust-analyzer" } },
			tailwindcss = {},
			taplo = {},
			terraformls = {},
			ts_ls = {},
			yamlls = {},
		}

		local non_lsp = {
			"ansible-lint",
			"checkmake",
			"debugpy",
			"delve",
			"eslint_d",
			"gofumpt",
			"goimports",
			"golangci-lint",
			"hadolint",
			"jq",
			"prettier",
			"ruff",
			"rustywind",
			"shellcheck",
			"shfmt",
			"stylelint",
			"stylua",
			"xmlformatter",
			"yamlfmt",
			"yamllint",
		}

		-- this function gets run when an LSP connects to a particular buffer.
		local on_attach = function(client, bufnr)
			local nmap = function(mode, keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("n", "gR", vim.lsp.buf.rename, "Rename")
			nmap("n", "ga", vim.lsp.buf.code_action, "Code Action")
			nmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
			nmap("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
			nmap("n", "<leader>df", vim.diagnostic.open_float, "Open Diagnostic Float")

			-- set up inlay hints if supported by the LSP server
			if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
				nmap("n", "<leader>ti", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
				end, "Toggle inlay hints")
			end
		end

		-- add borders to diagnostics
		vim.diagnostic.config({
			float = {
				border = "rounded",
			},
		})

		vim.diagnostic.config({ virtual_text = true })

		-- capabilities for auto-completion
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool = require("mason-tool-installer")

		-- ensure the lsp servers are installed
		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(lsp_servers),
			automatic_installation = false,
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
				if server_name == "" then
					return
				end

				local server = lsp_servers[server_name] or {}
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				server.on_attach = on_attach
				require("lspconfig")[server_name].setup(server)
			end,
		})
	end,
}
