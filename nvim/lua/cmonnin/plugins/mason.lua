return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")
		-- enable mason
		mason.setup({})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
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
				--				"nextflow-language-server",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
			-- R server is enabled conditionally in lsp.lua
			automatic_enable = { exclude = { "r_language_server" } },
		})
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"eslint_d",
				"shellcheck", -- used by bashls for diagnostics
			},
		})
	end,
}
