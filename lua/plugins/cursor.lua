return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		event = "InsertEnter",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		event = "InsertEnter",
		version = "*",
		config = true,
	},
	{
		"christoomey/vim-tmux-navigator",
	},
}
