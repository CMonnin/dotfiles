require("cmonnin")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("cmonnin.plugins")

function Transparent_bg(color)
	color = color or "gruvbox"
	success, msg = pcall(vim.cmd, "colorscheme " .. color)
	if not success then
		print("Failed to load color scheme '" .. color .. "': " .. msg)
		return
	end

	vim.api.nvim_set_hl(0,"Normal", { bg = "none"})
	vim.api.nvim_set_hl(0,"NormalFloat", { bg = "none"})
end

Transparent_bg()
