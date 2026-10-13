return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- In lightscreen mode, use light + opaque backgrounds for outdoor readability.
		-- Otherwise transparent_mode lets the terminal background show through.
		local lightscreen = os.getenv("LIGHTSCREEN") == "1"
		require("gruvbox").setup({ transparent_mode = not lightscreen })
		vim.o.background = lightscreen and "light" or "dark"
		vim.cmd.colorscheme("gruvbox")

		vim.api.nvim_create_user_command("ToggleBackground", function()
			vim.o.background = vim.o.background == "dark" and "light" or "dark"
		end, {})

		vim.keymap.set("n", "<leader>tb", "<cmd>ToggleBackground<CR>", { silent = true, desc = "Toggle light/dark mode" })
	end,
}
