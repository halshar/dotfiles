-- highlight the yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- toggle formatter
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting for all buffers
		vim.g.disable_autoformat = true
	else
		vim.b.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

-- disable line numbers and relative numbers when entering a terminal buffer
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("TerminalSettings", { clear = true }),
	pattern = "*",
	command = "setlocal nonumber norelativenumber",
})

-- update filetype for gitlab-ci file to start gitlab language server
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "Set filetype to yaml.gitlab for gitlab-ci files",
	group = vim.api.nvim_create_augroup("gitlab-ci-filetype", { clear = true }),
	pattern = "*.gitlab-ci*.{yml,yaml}",
	callback = function()
		vim.bo.filetype = "yaml.gitlab"
	end,
})
