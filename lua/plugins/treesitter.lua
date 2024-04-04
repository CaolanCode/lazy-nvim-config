return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},

	require("nvim-treesitter.configs").setup({
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		-- ensure these language parsers are installed
		ensure_installed = {
			"json",
			"javascript",
			"typescript",
			"html",
			"css",
			"bash",
			"lua",
			"c",
			"cpp",
			"rust",
		},
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
		-- auto install above language parsers
		auto_install = true,
	}),
}
