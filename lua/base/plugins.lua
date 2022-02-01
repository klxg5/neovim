local fn = vim.fn

-- Auto install Packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim"
  vim.cmd [[packadd packer.nvim]]
end

-- Reloads neovim whenever this file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- require packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Packer in a popup
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install Plugins
return packer.startup(function(use)
  -- Plugins
  use "wbthomason/packer.nvim" -- Packer itself
  use "nvim-lua/popup.nvim" -- An implimentation of the Popup API
  use "nvim-lua/plenary.nvim" -- Lua functions used by many plugins
  use {"rmehri01/onenord.nvim", branch = "main"}
  use "Mofiqul/dracula.nvim"
  use "nvim-lualine/lualine.nvim"
  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ':TSUpdate'}
  use "nvim-treesitter/playground"
  use "romgrk/nvim-treesitter-context"
  -- use "theHamsta/nvim-treesitter-pairs"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/nvim-treesitter-refactor"
  use "mfussenegger/nvim-ts-hint-textobject"
  -- Code Completion Plugins
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"
  -- Snippits
  use "L3MON4D3/LuaSnip" -- snippit engine
  use "rafamadriz/friendly-snippets" -- collection of snippits
  -- LSP plugins
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
  use "nvim-telescope/telescope-project.nvim"
  -- Git
  use "lewis6991/gitsigns.nvim"
  -- MISC
  use "romgrk/barbar.nvim"
  use {"numToStr/Comment.nvim", config = function() require('Comment').setup() end}
  use "windwp/nvim-autopairs"
  use "numToStr/FTerm.nvim"
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"
  use "jose-elias-alvarez/null-ls.nvim"
  use "folke/which-key.nvim"
  use "mfussenegger/nvim-dap"
  -- Goes at the end
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
