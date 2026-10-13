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

-- r-languageserver execs R and crashes on every start without it, so only
-- enable it when R is on PATH (on work, after `module load r` via lmod)
if vim.fn.executable("R") == 1 then
	vim.lsp.enable("r_language_server")
end
