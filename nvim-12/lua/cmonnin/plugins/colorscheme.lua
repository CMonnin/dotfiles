return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			vim.opt.background = "dark"
			vim.cmd.colorscheme("gruvbox")

			vim.api.nvim_create_user_command("ToggleBackground", function()
				if vim.o.background == "dark" then
					vim.o.background = "light"
				else
					vim.o.background = "dark"
				end
			end, {})

			vim.keymap.set(
				"n",
				"<leader>tb",
				":ToggleBackground<CR>",
				{ noremap = true, silent = true, desc = "Toggle light/dark mode" }
			)
		end,
	},
}
