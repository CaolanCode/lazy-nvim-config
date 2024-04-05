return {
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>sm", ":MaximizerToggle<CR>" },
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
		filetypes = {
			"css",
			"javascript",
			html = { mode = "foreground" },
		},
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
}
