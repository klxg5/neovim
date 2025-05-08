return {
    "petertriho/nvim-scrollbar",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "Mofiqul/dracula.nvim",
    },
    config = function()
        local scrollbar = require("scrollbar")
        local scrollbarSigns = require("scrollbar.handlers.gitsigns")

        -- local colors = require("catppuccin.palettes").get_palette("mocha")
        local colors = require("dracula").colors()

        scrollbar.setup({
            marks = {
                Cursor = {
                    color = colors.purple,
                },
                GitAdd = {
                    color = colors.green,
                },
                GitChange = {
                    color = colors.cyan,
                },
                GitDelete = {
                    color = colors.red,
                },
            },
            handlers = {
                gitsigns = false,
            },
        })
        scrollbarSigns.setup({})
    end,
}
