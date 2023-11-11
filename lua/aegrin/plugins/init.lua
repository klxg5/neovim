return {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    {
        "rmehri01/onenord.nvim",
        branch = "main",
    },
    "pappasam/papercolor-theme-slim",
    "Mofiqul/dracula.nvim",
    "Shatur/neovim-ayu",
    "ellisonleao/gruvbox.nvim",
    "EdenEast/nightfox.nvim",
    "shaunsingh/solarized.nvim",
    "folke/tokyonight.nvim",
    "rebelot/kanagawa.nvim",
    "yonlu/omni.vim",
    "olimorris/onedark.nvim",
    "polirritmico/monokai-nightasty.nvim",
    "zootedb0t/citruszest.nvim",
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            sass = { enable = true, parsers = { "css" }, }, -- Enable sass colors
            mode = "forground",
        }
    },
    -- "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-refactor",
    "mfussenegger/nvim-ts-hint-textobject",
    "nvim-treesitter/playground",
    {
        "folke/trouble.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"}
    },
    {
        "folke/which-key.nvim",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    -- "stevearc/aerial.nvim",
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    "tpope/vim-fugitive",
    "sindrets/diffview.nvim",
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    "mattn/emmet-vim",
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
        }
    },
    "nvim-tree/nvim-web-devicons",
    {
        "michaelb/sniprun",
        build = "bash ./install.sh"
    },
    "mbbill/undotree",
    "kkharji/sqlite.lua",
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
            require("overseer").setup({ direction = "bottom" })
        end,
    },
    {
        'Wansmer/treesj',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
    {
        "jlcrochet/vim-razor"
    },
}
