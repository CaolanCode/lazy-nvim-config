return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = true,
	filetypes = {
		"css",
		"javascript",
		html = { mode = "foreground" },
	},
}
