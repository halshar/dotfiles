vim.pack.add({
	"https://github.com/mfussenegger/nvim-lint",
})

local lint = require("lint")
lint.linters_by_ft = {
	ansible = { "ansible_lint" },
	bash = { "shellcheck" },
	css = { "stylelint" },
	dockerfile = { "hadolint", "trivy" },
	go = { "golangcilint" },
	javascript = { "eslint_d" },
	make = { "checkmake" },
	markdown = { "mado" },
	python = { "ruff" },
	sh = { "shellcheck" },
	terraform = { "tflint", "trivy" },
	typescript = { "eslint_d" },
	yaml = { "yamllint" },
}

local lint_augroup = vim.api.nvim_create_augroup("NvimLint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})
