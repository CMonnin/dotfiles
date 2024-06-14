-- in normal mode, leader pv will go to Explore :Ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- navigate buffers
vim.keymap.set("n", "<leader>h", vim.cmd.bp)
vim.keymap.set("n", "<leader>l", vim.cmd.bn)
-- in insert mode jj Escapes to normal mode
vim.keymap.set("i", "jj", "<Esc>")

-- map "replace all"
vim.keymap.set("n", "<leader>s", ":%s/g<Left>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
