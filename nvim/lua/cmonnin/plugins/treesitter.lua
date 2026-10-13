return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- The main branch builds parsers with the tree-sitter CLI. Without it every
		-- start fails on each parser, so warn once and use the parsers bundled
		-- with nvim instead (pacman -S tree-sitter-cli, or a binary in ~/.local/bin).
		if vim.fn.executable("tree-sitter") == 1 then
			require("nvim-treesitter").install({
				"bash",
				"css",
				"dockerfile",
				"graphql",
				"groovy",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"r",
				"rust",
				"svelte",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			})
		else
			vim.notify("tree-sitter CLI not found; skipping parser install", vim.log.levels.WARN)
		end

		vim.treesitter.language.register("groovy", "nextflow")

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
				if lang and pcall(vim.treesitter.start, ev.buf, lang) then
					vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo[0][0].foldmethod = "expr"
					vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
