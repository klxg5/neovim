local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "git@github.com:folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local plugins = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-lualine/lualine.nvim",
    {
        "rmehri01/onenord.nvim",
        branch = "main"
    },
    "pappasam/papercolor-theme-slim",
    "Mofiqul/dracula.nvim",
    "Shatur/neovim-ayu",
    "ellisonleao/gruvbox.nvim",
    "EdenEast/nightfox.nvim",
    "shaunsingh/solarized.nvim",
    "folke/tokyonight.nvim",
    "rebelot/kanagawa.nvim",
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
    "xiyaowong/transparent.nvim",
    "NvChad/nvim-colorizer.lua",
    {
       "nvim-treesitter/nvim-treesitter",
       build = ":TSUpdate"
    },
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-refactor",
    "mfussenegger/nvim-ts-hint-textobject",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({})
        end,
    },
    "jose-elias-alvarez/null-ls.nvim",
    "jose-elias-alvarez/typescript.nvim",
    "onsails/lspkind.nvim",
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons"
    },
    "stevearc/aerial.nvim",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "kevinhwang91/nvim-bqf", ft = "qf",
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },
    "ThePrimeagen/harpoon",
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "lewis6991/gitsigns.nvim",
    "tpope/vim-fugitive",
    "sindrets/diffview.nvim",
    "aaronhallaert/advanced-git-search.nvim",
     {
         "numToStr/Comment.nvim",
         config = function()
             require("Comment").setup()
         end,
     },
    "mattn/emmet-vim",
    "rcarriga/nvim-notify",
    "windwp/nvim-autopairs",
    "akinsho/toggleterm.nvim",
    "kyazdani42/nvim-web-devicons",
    {
        "michaelb/sniprun",
        build = "bash ./install.sh"
    },
    -- {
    --     "mbbill/undotree",
    --     cmd = "UndotreeToggle",
    --     config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
    -- },
    "kkharji/sqlite.lua",
    "petertriho/nvim-scrollbar",
     {
        "stevearc/stickybuf.nvim",
        config = function()
            require('stickybuf').setup()
        end,
    },
    "arkav/lualine-lsp-progress",
    {
        "stevearc/overseer.nvim",
        config = function()
            require("overseer").setup({
                direction = "bottom"
            })
        end,
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers"
    },
    "epwalsh/obsidian.nvim",
}

require("lazy").setup(plugins)
