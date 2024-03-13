return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
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
					"tsx",
					"html",
					"css",
					"bash",
					"lua",
					"gitignore",
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				-- auto install above language parsers
				auto_install = true,
			})
		end,
	},
}
