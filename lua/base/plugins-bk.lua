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
    -- Base
    use({ "wbthomason/packer.nvim" }) -- Packer itself
    use({ "nvim-lua/popup.nvim" }) -- An implimentation of the Popup API
    use({ "nvim-lua/plenary.nvim" }) -- Lua functions used by many plugins
    use({ "nvim-lualine/lualine.nvim" })
    --Themes
    use({ "rmehri01/onenord.nvim", branch = "main" })
    use({ "pappasam/papercolor-theme-slim" })
    use({ "Mofiqul/dracula.nvim" })
    use({ "Shatur/neovim-ayu" })
    use({ "ellisonleao/gruvbox.nvim" })
    use({ "EdenEast/nightfox.nvim" })
    use({ "shaunsingh/solarized.nvim" })
    use({ "folke/tokyonight.nvim" })
    use({ "rebelot/kanagawa.nvim" })
    use({ "catppuccin/nvim", as = "catppuccin" })
    use({ "xiyaowong/transparent.nvim" })
    use({ "NvChad/nvim-colorizer.lua" })
    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "nvim-treesitter/nvim-treesitter-context" })
    use({ "nvim-treesitter/nvim-treesitter-refactor" })
    use({ "mfussenegger/nvim-ts-hint-textobject" })
    -- Code Completion Plugins
    use({ "hrsh7th/nvim-cmp" })
    use({ "hrsh7th/cmp-buffer" })
    use({ "hrsh7th/cmp-path" })
    use({ "hrsh7th/cmp-cmdline" })
    use({ "hrsh7th/cmp-nvim-lua" })
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "saadparwaiz1/cmp_luasnip" })
    -- Snippits
    use({ "L3MON4D3/LuaSnip" }) -- snippit engine
    use({ "rafamadriz/friendly-snippets" }) -- collection of snippits
    -- LSP plugins
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    use({ "neovim/nvim-lspconfig" })
    -- use({ "glepnir/lspsaga.nvim", branch = "main" })
    use ({
        'nvimdev/lspsaga.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('lspsaga').setup({})
        end,
    })
    use({ "jose-elias-alvarez/null-ls.nvim" })
    use({ "jose-elias-alvarez/typescript.nvim" })
    use({ "onsails/lspkind.nvim" })
    use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
    use({ "stevearc/aerial.nvim" })
    -- DAP
    use({ "mfussenegger/nvim-dap" })
    use({ "rcarriga/nvim-dap-ui" })
    use({ "theHamsta/nvim-dap-virtual-text" })
    use({ "nvim-telescope/telescope-dap.nvim" })
    -- bqf Quickfix
    use({ "kevinhwang91/nvim-bqf", ft = "qf" })
    -- Telescope
    use({ "nvim-telescope/telescope.nvim" })
    use({ "nvim-telescope/telescope-live-grep-args.nvim" })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "ThePrimeagen/harpoon" })
    use({ "nvim-telescope/telescope-symbols.nvim" })
    use({ "nvim-telescope/telescope-file-browser.nvim" })
    -- Git
    use({ "lewis6991/gitsigns.nvim" })
    use({ "tpope/vim-fugitive" })
    use({ "sindrets/diffview.nvim" })
    use({ "aaronhallaert/advanced-git-search.nvim" })
    -- MISC
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })
    use({ "mattn/emmet-vim" })
    use({ "folke/todo-comments.nvim" })
    use({ "rcarriga/nvim-notify" })
    use({ "windwp/nvim-autopairs" })
    use({ "akinsho/toggleterm.nvim" })
    use({ "kyazdani42/nvim-web-devicons" })
    use({ "michaelb/sniprun", run = "bash ./install.sh" })
    use({
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
    })
    use({ "kkharji/sqlite.lua" }) -- needed for telescope bookmarks
    use({ "petertriho/nvim-scrollbar" })
    use({ "stevearc/stickybuf.nvim",
        config = function()
            require('stickybuf').setup()
        end,
    })
    use({ "arkav/lualine-lsp-progress" })
    use({
        "stevearc/overseer.nvim",
        config = function()
            require("overseer").setup({
                direction = "bottom"
            })
        end,
    })
    use({ "stevearc/oil.nvim", })
    use ({"nvim-neorg/neorg", run = ":Neorg sync-parsers" })
    use({ "epwalsh/obsidian.nvim", })
    -- Goes at the end
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)