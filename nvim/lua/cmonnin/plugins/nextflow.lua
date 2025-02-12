return {
	"nextflow-io/vim-language-nextflow",
	lazy = true,
	ft = { "nextflow", "nf" },
	init = function()
		vim.filetype.add({
			extension = {
				nf = "nextflow",
			},
			pattern = {
				["nextflow%.config"] = "nextflow",
			},
		})
	end,
}
