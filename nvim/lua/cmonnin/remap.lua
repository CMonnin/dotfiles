-- in normal mode, leader pv will go to Explore :Ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- in insert mode jj Escapes to normal mode
vim.keymap.set("i", "jj", "<Esc>")
