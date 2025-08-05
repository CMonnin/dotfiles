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
				"ruff",
				"gopls",
				"eslint",
				"rust_analyzer",
				"dockerls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"graphql",
				"groovy-language-server",
				"nextflow_ls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})
		mason_tool_installer.setup({
			ensure_installed = {
				"shellcheck",
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"eslint_d",
			},
		})
	end,
}
