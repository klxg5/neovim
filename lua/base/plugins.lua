local fn = vim.fn

-- Auto install Packer
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
    print("Installing packer close and reopen Neovim")
    vim.cmd([[packadd packer.nvim]])
end

-- When plugins.lua is written(saved) source <afile> then run PackerSync
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- require packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Packer in a popup
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install Plugins
return packer.startup(function(use)
    -- Plugins
    use("wbthomason/packer.nvim") -- Packer itself
    use("nvim-lua/popup.nvim") -- An implimentation of the Popup API
    use("nvim-lua/plenary.nvim") -- Lua functions used by many plugins
    use({ "rmehri01/onenord.nvim", branch = "main" })
    use("Mofiqul/dracula.nvim")
    use("nvim-lualine/lualine.nvim")
    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")
    use("p00f/nvim-ts-rainbow")
    use("nvim-treesitter/nvim-treesitter-refactor")
    use("mfussenegger/nvim-ts-hint-textobject")
    -- Code Completion Plugins
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    -- Snippits
    use("L3MON4D3/LuaSnip") -- snippit engine
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets") -- collection of snippits
    -- LSP plugins
    use{"williamboman/mason.nvim"}
    use{"williamboman/mason-lspconfig.nvim"}
    use("neovim/nvim-lspconfig")
    use({"glepnir/lspsaga.nvim", branch = "main"})
    use("jose-elias-alvarez/null-ls.nvim")
    use("jose-elias-alvarez/typescript.nvim")
    use("onsails/lspkind.nvim")
    use{"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons"}
    use({"stevearc/aerial.nvim"})
    -- Telescope
    use{"nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim"}
    use{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use("ThePrimeagen/harpoon")
    use("dhruvmanila/telescope-bookmarks.nvim")
    use("cljoly/telescope-repo.nvim")
    -- Git
    use("lewis6991/gitsigns.nvim")
    -- MISC
    use("romgrk/barbar.nvim")
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })
    use("rcarriga/nvim-notify")
    use("windwp/nvim-autopairs")
    use("numToStr/FTerm.nvim")
    use("kyazdani42/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons")
    use({ "michaelb/sniprun", run = "bash ./install.sh" })
    use("kkharji/sqlite.lua") -- needed for telescope bookmarks

    -- Goes at the end
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
