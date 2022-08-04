local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.startup(function(use)
  -- Package manager
  use("wbthomason/packer.nvim")

  -- Code Parsing
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- Colorscheme
  use("navarasu/onedark.nvim")
  use("kyazdani42/nvim-web-devicons")

  -- Statusline
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  -- Toggle relative and absolute numbers automatically
  use("jeffkreeftmeijer/vim-numbertoggle")

  -- Autosave
  use("Pocco81/AutoSave.nvim")

  -- File Explorer
  use({
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  })

  -- Comments
  use("b3nj5m1n/kommentary")

  -- Wiki
  use("vimwiki/vimwiki")

  -- List Search
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
  })

  -- Configurations for Nvim LSP
  use({
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  })

  -- Snippets
  use("L3MON4D3/LuaSnip")

  -- Autocomplete
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp")
  use("saadparwaiz1/cmp_luasnip")

  -- Formatter
  use("mhartington/formatter.nvim")

  -- Rails
  use("tpope/vim-rails")
  use("tpope/vim-dispatch")

  -- Endwise
  use("tpope/vim-endwise")

  -- Git
  use("tpope/vim-fugitive")

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
