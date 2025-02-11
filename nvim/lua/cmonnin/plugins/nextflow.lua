return {
	"LukeGoodsell/nextflow-vim",
	lazy = true,
	ft = "nextflow",
	init = function()
		-- Filetype detection
		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = { "*.nf", "nextflow.config" },
			callback = function()
				vim.opt_local.filetype = "nextflow"
			end,
		})

		-- Set indentation for Nextflow files
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "nextflow",
			callback = function()
				vim.opt_local.expandtab = true
				vim.opt_local.shiftwidth = 4
				vim.opt_local.softtabstop = 4
			end,
		})
	end,
	config = function()
		-- Plugin configuration
		vim.g.nextflow_syntax_highlighting = 1
		-- Add any custom highlighting
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				-- Custom highlighting groups
				vim.api.nvim_set_hl(0, "NextflowProcess", { link = "Function" })
				vim.api.nvim_set_hl(0, "NextflowDirective", { link = "Keyword" })
			end,
		})
	end,
}
