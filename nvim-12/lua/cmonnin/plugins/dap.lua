return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mfussenegger/nvim-dap-python",
			--"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local python = require("dap-python")
			local dap = require("dap")
			local ui = require("dapui")

			require("dap-python").setup("python")
			require("dapui").setup()
			-- require("dap-go").setup()

			-- Handled by nvim-dap-go
			-- dap.adapters.go = {
			--   type = "server",
			--   port = "${port}",
			--   executable = {
			--     command = "dlv",
			--     args = { "dap", "-l", "127.0.0.1:${port}" },
			--   },
			-- }

			vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "dap: toggle_breakpoint" })
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "dap: run_to_cursor" })

			-- Eval var under cursor
			vim.keymap.set("n", "<space>?", function()
				require("dapui").eval(nil, { enter = true })
			end)

			vim.keymap.set("n", "<F1>", dap.continue, { desc = "dap: continue" })
			vim.keymap.set("n", "<F2>", dap.step_into, { desc = "dap: step_into" })
			vim.keymap.set("n", "<F3>", dap.step_over, { desc = "dap: step_over" })
			vim.keymap.set("n", "<F4>", dap.step_out, { desc = "dap: step_out" })
			vim.keymap.set("n", "<F5>", dap.step_back, { desc = "dap: step_back" })
			vim.keymap.set("n", "<F13>", dap.restart, { desc = "dap: restart" })

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
