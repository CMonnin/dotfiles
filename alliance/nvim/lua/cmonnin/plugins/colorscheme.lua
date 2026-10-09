return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- transparent_mode lets the terminal background show through, and is
		-- reapplied when the background toggles
		require("gruvbox").setup({ transparent_mode = true })
		vim.o.background = "dark"
		vim.cmd.colorscheme("gruvbox")

		vim.api.nvim_create_user_command("ToggleBackground", function()
			vim.o.background = vim.o.background == "dark" and "light" or "dark"
		end, {})

		vim.keymap.set("n", "<leader>tb", "<cmd>ToggleBackground<CR>", { silent = true, desc = "Toggle light/dark mode" })
	end,
}
