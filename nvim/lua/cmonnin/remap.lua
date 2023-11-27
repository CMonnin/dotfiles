-- in normal mode, leader pv will go to Explore :Ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>h", vim.cmd.bp)
vim.keymap.set("n", "<leader>l", vim.cmd.bn)
-- in insert mode jj Escapes to normal mode
vim.keymap.set("i", "jj", "<Esc>")
