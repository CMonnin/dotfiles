return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = require("gitsigns")

			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end

			-- Diff in a split (HEAD on the left), then ]c / [c to navigate and do to revert a hunk
			map("n", "<leader>gd", function() gs.diffthis() end, "Git diff vs HEAD")
			map("n", "<leader>gD", function() gs.diffthis("~") end, "Git diff vs HEAD~")

			map("n", "<leader>gp", gs.preview_hunk, "Git preview hunk")
			map("n", "<leader>gl", function() gs.blame_line({ full = true }) end, "Git blame line")

			-- gb is nvim-dap run_to_cursor, so blame lives on gl
			map("n", "<leader>gr", gs.reset_hunk, "Git reset hunk")
			map("n", "<leader>gR", gs.reset_buffer, "Git reset buffer")

			map("n", "]h", function() gs.nav_hunk("next") end, "Next hunk")
			map("n", "[h", function() gs.nav_hunk("prev") end, "Previous hunk")
		end,
	},
}
