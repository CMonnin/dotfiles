require("cmonnin")
require("cmonnin.lazy")
require("cmonnin.lsp")

-- Filetype detection
vim.filetype.add({
	extension = {
		nf = 'nextflow',
	},
})

-- Use Groovy treesitter parser for Nextflow files
vim.treesitter.language.register('groovy', 'nextflow')

function Transparent_bg(color)
	color = color or "gruvbox"
	success, msg = pcall(vim.cmd, "colorscheme " .. color)
	if not success then
		print("Failed to load color scheme '" .. color .. "': " .. msg)
		return
	end

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Override nextflow_ls to use Mason-installed version
vim.lsp.config('nextflow_ls', {
	cmd = { vim.fn.stdpath('data') .. '/mason/bin/nextflow-language-server' },
})

Transparent_bg()
