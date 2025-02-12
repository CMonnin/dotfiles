return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local configs = require("lspconfig.configs")
		if not configs.nextflow_ls then
			configs.nextflow_ls = {
				default_config = {
					cmd = { "java", "-jar", "/home/cian/nextflow_ls/language-server-all.jar" },
					filetypes = { "nextflow" },
					root_dir = require("lspconfig.util").root_pattern("nextflow.config", ".git"),
					settings = {
						nextflow = {
							files = {
								exclude = { ".git", ".nf-test", "work" },
							},
						},
					},
				},
			}
		end

		lspconfig.nextflow_ls.setup({})
	end,
}
