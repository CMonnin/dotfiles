return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",

		config = function()
		local treesitter = require'nvim-treesitter.configs'
		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
		highlight = {
			enable = true,
		},
		-- enable indentation
		indent = { enable = true },
		-- ensure these language parsers are installed
		ensure_installed = {
			"json",
			"yaml",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"rust",
			"python"
		},
		-- auto install above language parsers
		auto_install = true,
		additional_vim_regex_highlighting = false,
		
	})
end,
  },
}




