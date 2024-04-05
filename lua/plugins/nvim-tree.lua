return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 30,
			},
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
		})

		-- set keymaps
		vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")
		vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>")
		vim.keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>")
	end,
}
