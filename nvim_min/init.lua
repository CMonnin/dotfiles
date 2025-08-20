local map = vim.keymap.set

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "project view" })
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("i", "jj", "<esc>")

-- navigate buffers
vim.keymap.set("n", "<leader>h", vim.cmd.bp, { desc = "buffer, previous" })
vim.keymap.set("n", "<leader>l", vim.cmd.bn, { desc = "buffer, next" })

-- map "replace all"
vim.keymap.set("n", "<leader>s", ":%s/g<Left>", { desc = "replace all" })

vim.pack.add({

	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/mason-org/mason.nvim" },
})

vim.lsp.enable({
	"lua_ls",
	"bashls",
	"svelte",
	"pyright",
	"eslint",
	"rust_analyzer",
	"dockerls",
	"ruff",
	"ts_ls",
	"html",
	"cssls",
	"tailwindcss",
	"lua_ls",
	"graphql",
	"groovyls",
	"nexflow_ls",
})
vim.cmd("colorcheme gruvbox")

-- set leader to space
vim.g.mapleader = " "
-- set relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true
-- keeps cursor in the middle of the screen when scrolling
vim.opt.scrolloff = 999

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
