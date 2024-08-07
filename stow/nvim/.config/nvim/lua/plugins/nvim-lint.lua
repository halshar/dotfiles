return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			css = { "stylelint" },
			make = { "checkmake" },
			python = { "ruff" },
			yaml = { "yamllint" },
			["yaml.ansible"] = { "ansible_lint", "yamllint" },
			go = { "golangcilint" },
			dockerfile = { "hadolint" },
			sh = { "shellcheck" },
			bash = { "shellcheck" },
			terraform = { "tflint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
