-- in normal mode, leader pv will go to Explore :Ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "project view" })
-- navigate buffers
vim.keymap.set("n", "<leader>h", vim.cmd.bp, { desc = "buffer, previous" })
vim.keymap.set("n", "<leader>l", vim.cmd.bn, { desc = "buffer, next" })
-- in insert mode jj Escapes to normal mode
vim.keymap.set("i", "jj", "<Esc>")
-- remap increment to C-b as C-a is for wezterm/tmux leader
vim.keymap.set("n", "<C-b>", "<C-a>")
-- not wokring i visual mode for some reason
vim.keymap.set("x", "<C-b>", "g<C-a>")

-- map "replace all"
vim.keymap.set("n", "<leader>s", ":%s/g<Left>", { desc = "replace all" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
