return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"j-hui/fidget.nvim",
		"saghen/blink.cmp",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local servers = {
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
			taplo = {},
			terraformls = { filetypes = { "hcl", "terraform", "terraform-vars" } },
			ts_ls = {},
			yamlls = { settings = { yaml = { customTags = { "!reference sequence" } } } },
		}

		local non_servers = {
			"ansible-lint",
			"checkmake",
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

		-- diagnostic config
		vim.diagnostic.config({
			severity_sort = true,
			underline = false,
			float = { border = "rounded", source = true },
			virtual_text = { spacing = 2, source = true },
		})

		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool = require("mason-tool-installer")

		-- ensure all tools are installed
		local ensure_installed = vim.tbl_keys(servers)
		vim.list_extend(ensure_installed, non_servers)
		mason_tool.setup({
			ensure_installed = ensure_installed,
			auto_update = false,
			run_on_start = false,
			integrations = {
				["mason-lspconfig"] = true,
				["mason-null-ls"] = false,
				["mason-nvim-dap"] = false,
			},
		})

		-- overwrite language server configuration
		for server, config in pairs(servers) do
			if not vim.tbl_isempty(config) then
				vim.lsp.config(server, config)
			end
		end

		mason_lspconfig.setup({
			ensure_installed = {},
			automatic_enable = true,
		})
	end,
}
