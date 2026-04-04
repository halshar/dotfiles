vim.api.nvim_create_autocmd("FileType", {
	pattern = "helm",
	callback = function()
		vim.pack.add({ "https://github.com/qvalentin/helm-ls.nvim" })
		require("helm-ls").setup({})
	end,
})
