--- Return the default Git branch name (either "main" or "master").
--- It checks if the "main" branch exists; if not, defaults to "master".
--- @return string
local function get_default_branch_name()
	local res = vim.system({ "git", "rev-parse", "--verify", "main" }, { capture_output = true }):wait()
	return res.code == 0 and "main" or "master"
end

return {
	"sindrets/diffview.nvim",
	keys = {
		{
			"<leader>gm",
			function()
				vim.cmd("DiffviewOpen " .. get_default_branch_name())
			end,
			mode = "n",
			desc = "Diff against local default branch",
		},
		{
			"<leader>gM",
			function()
				vim.cmd("DiffviewOpen HEAD..origin/" .. get_default_branch_name())
			end,
			mode = "n",
			desc = "Diff against remote default branch",
		},
		{
			"<leader>gc",
			"<cmd>DiffviewFileHistory %<CR>",
			mode = "n",
			desc = "History of current file",
		},
		{
			"<leader>gf",
			function()
				vim.cmd("DiffviewOpen " .. get_default_branch_name() .. " -- %")
			end,
			mode = "n",
			desc = "Current file diff against local default branch",
		},
		{
			"<leader>gF",
			function()
				vim.cmd("DiffviewOpen origin/" .. get_default_branch_name() .. " -- %")
			end,
			mode = "n",
			desc = "Current file diff against remote default branch",
		},
		{
			"<leader>gh",
			"<cmd>DiffviewFileHistory<CR>",
			mode = "n",
			desc = "Open Diffview File History",
		},
		{
			"<leader>go",
			function()
				local lib = require("diffview.lib")
				local view = lib.get_current_view()
				if view then
					vim.cmd("DiffviewClose")
				else
					vim.cmd("DiffviewOpen")
				end
			end,
			mode = "n",
			desc = "Toggle Diffview",
		},
	},
}
