-- set leader to space
vim.g.mapleader = " "
-- set relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true
-- keeps cursor in the middle of the screen when scrolling
vim.o.scrolloff = 999

-- sync clipboard between OS and nvim
vim.opt.clipboard = "unnamedplus"
