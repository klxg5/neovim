return {
    -- game to get better at vim motions, need an empty buffer before you call it however
    "ThePrimeagen/vim-be-good",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "Mofiqul/dracula.nvim",
    -- {
    --     "NvChad/nvim-colorizer.lua",
    --     opts = {
    --         sass = { enable = true, parsers = { "css" }, }, -- Enable sass colors
    --         mode = "forground",
    --     }
    -- },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    "kevinhwang91/nvim-bqf",
    -- ft = "qf",
    "tpope/vim-fugitive",
    "sindrets/diffview.nvim",
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
        },
    },
    "nvim-tree/nvim-web-devicons",
    {
        "michaelb/sniprun",
        build = "bash ./install.sh",
    },
    "mbbill/undotree",
    "kkharji/sqlite.lua",
    {
        "stevearc/stickybuf.nvim",
        config = function()
            require("stickybuf").setup()
        end,
    },
    "arkav/lualine-lsp-progress",
    {
        "stevearc/overseer.nvim",
        config = function()
            require("overseer").setup({ direction = "bottom" })
        end,
    },
}
