return {
	"olexsmir/gopher.nvim",
	ft = "go",
	config = true,
	build = function()
		vim.cmd([[silent! GoInstallDeps]])
	end,
}
