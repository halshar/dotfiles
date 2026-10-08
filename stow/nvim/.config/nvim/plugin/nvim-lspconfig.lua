vim.pack.add({
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/b0o/schemastore.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

require("mason").setup({})

local schema_store = require("schemastore")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool = require("mason-tool-installer")
local blink = require("blink.cmp")

vim.diagnostic.config({
	severity_sort = true,
	underline = false,
	update_in_insert = false,
	float = { border = "rounded", source = true },
	virtual_text = { spacing = 2, source = true },
})

local servers = {
	ansiblels = {},
	bashls = { filetypes = { "bash", "sh", "zsh" } },
	cssls = {},
	docker_compose_language_service = {},
	dockerls = {},
	gitlab_ci_ls = {},
	gopls = {
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
					unusedwrite = true,
					shadow = true,
					nilness = true,
				},
				staticcheck = true,
				completeUnimported = true,
			},
		},
	},
	helm_ls = {},
	html = {},
	jsonls = {
		settings = { json = { schemas = schema_store.json.schemas(), validate = { enable = true } } },
	},
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
				telemetry = { enable = false },
			},
		},
	},
	powershell_es = {
		bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
		filetypes = { "ps1", "psm1", "psd1" },
		init_options = {
			enableProfileLoading = false,
		},
		settings = {
			powershell = {
				codeFormatting = {
					Preset = "OTBS",
					alignPropertyValuePairs = true,
					newLineAfterCloseBrace = true,
					newLineAfterOpenBrace = true,
					useCorrectCasing = true,
					whitespaceAfterSeparator = true,
					whitespaceAroundOperator = true,
					whitespaceBeforeOpenBrace = true,
					whitespaceBeforeOpenParen = true,
					whitespaceBetweenParameters = true,
					whitespaceInsideBrace = true,
				},
			},
		},
	},
	ruff = {},
	rust_analyzer = {},
	taplo = {},
	terraformls = { filetypes = { "hcl", "terraform", "terraform-vars" } },
	ts_ls = {},
	ty = {},
	yamlls = {
		settings = {
			yaml = {
				validate = true,
				hover = true,
				completion = true,
				schemaStore = { enable = false, url = "" },
				schemas = schema_store.yaml.schemas(),
				customTags = { "!reference sequence" },
			},
		},
	},
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
	"tflint",
	"trivy",
	"yamlfmt",
	"yamllint",
}

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

for server, config in pairs(servers) do
	config.capabilities = blink.get_lsp_capabilities(config.capabilities)
	vim.lsp.config(server, config)
end

mason_lspconfig.setup({
	ensure_installed = {},
	automatic_enable = true,
})
