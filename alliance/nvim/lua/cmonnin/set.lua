-- set leader to space
vim.g.mapleader = " "
-- set relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true
-- keeps cursor in the middle of the screen when scrolling
vim.opt.scrolloff = 999

-- ...except in diff mode, where centering the cursor fights scrollbind and
-- the two panes drift out of alignment.
vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "diff",
	callback = function()
		vim.wo.scrolloff = vim.wo.diff and 0 or 999
	end,
})

-- sync clipboard between OS and nvim
vim.opt.clipboard = "unnamedplus"

-- Save undo history
vim.opt.undofile = true
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- set list for displaying whitepsace etc
vim.opt.list = true
vim.opt.listchars = {
	space = "·",
	tab = "→ ",
	trail = "·",
}

vim.filetype.add({ extension = { nf = "nextflow" } })

vim.opt.foldlevelstart = 99

-- Diff mode forces foldmethod=diff, which collapses unchanged regions.
-- Keep them open by treating 99 lines around each change as context.
vim.opt.diffopt:append("context:99")
