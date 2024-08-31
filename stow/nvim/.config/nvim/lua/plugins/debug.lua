return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.before["event_initialized"]["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before["event_terminated"]["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before["event_exited"]["dapui_config"] = function()
				dapui.close()
			end
		end,
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				mode = "n",
				desc = "Debug: Toggle debugger UI",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				mode = "n",
				desc = "Debug: Add/Remove breakpoint",
			},
			{
				"<leader>ds",
				function()
					require("dap").continue()
				end,
				mode = "n",
				desc = "Debug: Start/Continue debug",
			},
			{
				"<leader>dc",
				function()
					require("dap").clear_breakpoints()
				end,
				mode = "n",
				desc = "Debug: Clear all breakpoints",
			},
		},
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},
}
