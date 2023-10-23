return {
    "petertriho/nvim-scrollbar",
    config = function ()
        local scrollbar = require("scrollbar")
        if not status_ok then
            return
        end

        local colors = require("catppuccin.palettes").get_palette "mocha"

        scrollbar.setup({
            marks = {
                Cursor = {
                    text = "█",
                    color = colors.purple,
                },
                GitAdd = {
                    text = "✓",
                    color = colors.green,
                },
                GitChange = {
                    text = "⥂",
                    color = colors.cyan,
                },
                GitDelete = {
                    text = "",
                    color = colors.red,
                },
            },
            handlers = {
                gitsigns = false,
            },
        })
    end
}
