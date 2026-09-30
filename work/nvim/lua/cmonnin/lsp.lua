vim.lsp.enable({
	"lua_ls",
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
	"graphql",
	"groovyls",
	"nextflow_ls",
})

-- r-languageserver execs R, which comes from lmod; only enable it when `module load r` put R on PATH, or it crashes on every start
if vim.fn.executable("R") == 1 then
	vim.lsp.enable("r_language_server")
end
