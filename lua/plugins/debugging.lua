return {
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local dap_python = require("dap-python")
			vim.keymap.set("n", "<Leader>dr", function()
				dap_python.test_method()
			end)

			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			dap_python.setup(path)
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = false,
		config = function()
			require("mason-nvim-dap").setup({
				handlers = {},
			})
		end,
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup()

			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>")
			-- vim.keymap.set("n", "<Leader>dbc", ":DapClearBreakpoints<CR>")
			vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
			vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
			vim.keymap.set("n", "<Leader>ds", ":DapStepOver<CR>")
			vim.keymap.set("n", "<Leader>di", ":DapStepInto<CR>")
		end,
	},
}
