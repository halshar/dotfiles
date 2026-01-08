-- highlight the yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
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

-- update filetype for gitlab-ci file to start gitlab language server
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "Set filetype to yaml.gitlab for gitlab-ci files",
	group = vim.api.nvim_create_augroup("gitlab-ci-filetype", { clear = true }),
	pattern = "*.gitlab-ci*.{yml,yaml}",
	callback = function()
		vim.bo.filetype = "yaml.gitlab"
	end,
})

-- language server mappings
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLSConfig", { clear = true }),
	callback = function(event)
		local nmap = function(mode, keys, func, desc)
			if desc then
				desc = "LS: " .. desc
			end

			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
		end

		nmap("n", "gR", vim.lsp.buf.rename, "Rename")
		nmap("n", "ga", vim.lsp.buf.code_action, "Code Action")
		nmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
		nmap("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
		nmap("n", "<leader>df", vim.diagnostic.open_float, "Open Diagnostic Float")

		local function client_supports_method(client, method, bufnr)
			return client:supports_method(method, bufnr)
		end

		-- set up inlay hints if supported by the language server
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			nmap("n", "<leader>ti", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "Toggle inlay hints")
		end
	end,
})

-- set colorcolumn to empty for markdown files
vim.api.nvim_create_autocmd("FileType", {
	desc = "Disable colorcolumn in markdown files",
	group = vim.api.nvim_create_augroup("markdown-no-colorcolumn", { clear = true }),
	pattern = "markdown",
	callback = function()
		vim.opt_local.colorcolumn = ""
	end,
})
