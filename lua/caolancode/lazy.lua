local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- color scheme
  { 
    "bluz71/vim-nightfly-colors", 
    name = "nightfly", 
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nightfly]])
    end,
  },

  -- telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- lsp
  {
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},

    -- mason package manager for lsp servers
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {
      'neovim/nvim-lspconfig',
      dependencies = {
        {'hrsh7th/cmp-nvim-lsp'},
      },
    },

    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        {'L3MON4D3/LuaSnip'},
      }
    }
  }

}, opts)
