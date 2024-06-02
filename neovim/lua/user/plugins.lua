local fn = vim.fn

-- Automatically install packer
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- Use a protected call so we don"t error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

local plugins = {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  "nvim-lua/popup.nvim",   -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- useful lua functions used ny lots of plugins
  "windwp/nvim-autopairs", -- Plugin for easier parenthesis, quotes, etc.
  "numToStr/Comment.nvim", -- Easily comment stuff
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",
  "moll/vim-bbye",
  { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
  "akinsho/toggleterm.nvim",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  "ahmedkhalf/project.nvim",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  "ThePrimeagen/harpoon",

  -- CMP plugins
  "hrsh7th/nvim-cmp",         -- The completion plugin
  "hrsh7th/cmp-buffer",       -- buffer completions
  "hrsh7th/cmp-path",         -- path completions
  "hrsh7th/cmp-cmdline",      -- cmdline completions
  "hrsh7th/cmp-nvim-lsp",     -- LSP completions
  "hrsh7th/cmp-nvim-lua",     -- Lua completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions

  -- Snippets
  "L3MON4D3/LuaSnip",             --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- LSP
  "neovim/nvim-lspconfig",             -- enable LSP
  "williamboman/mason.nvim",           -- simple to use language server installer
  "williamboman/mason-lspconfig.nvim", -- simple to use language server installer
  "nvimtools/none-ls.nvim",

  -- Telescope
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-media-files.nvim",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate,"
  },
  "HiPhish/nvim-ts-rainbow2",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- git
  "lewis6991/gitsigns.nvim",
}
local opts = {}

lazy.setup(plugins, opts)
