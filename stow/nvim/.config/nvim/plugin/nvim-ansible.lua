vim.api.nvim_create_autocmd("FileType", {
	pattern = "yaml.ansible",
	callback = function()
		vim.pack.add({ "https://github.com/mfussenegger/nvim-ansible" })
	end,
})
