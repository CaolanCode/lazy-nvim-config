return {
	{
		"vonheikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			-- disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},

	-- autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "insertenter",
		dependencies = { "l3mon4d3/luasnip" },
		config = function()
			-- here is where you configure the autocompletion settings.
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			-- and you can configure cmp even more, if you want to.
			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()

			cmp.setup({
				formatting = lsp_zero.cmp_format({ details = true }),
				mapping = cmp.mapping.preset.insert({
					["<c-space>"] = cmp.mapping.complete(),
					["<c-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<c-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<c-u>"] = cmp.mapping.scroll_docs(-4),
					["<c-d>"] = cmp.mapping.scroll_docs(4),
					["<c-f>"] = cmp_action.luasnip_jump_forward(),
					["<c-b>"] = cmp_action.luasnip_jump_backward(),
					["<cr>"] = cmp.mapping.confirm({ select = false }),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
			})
		end,
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "bufreadpre", "bufnewfile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			-- this is where all the lsp shenanigans will live
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			--- if you want to know more about lsp-zero and mason.nvim
			--- read this: https://github.com/vonheikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"cssls",
					"html",
					"emmet_ls",
				},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						-- (optional) configure lua language server for neovim
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
					clangd = function()
						require("lspconfig").clangd.setup({
							cmd = {
								"clangd",
								"--background-index",
								"--clang-tidy",
								"--fallback-style=webkit",
							},
						})
					end,
				},
			})
		end,
	},
}
