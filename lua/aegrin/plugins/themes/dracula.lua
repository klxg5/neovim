return {
    "Mofiqul/dracula.nvim",
    config = function()
        local dracula = require("dracula")
        local colors = require("dracula").colors()
        dracula.setup({
            colors = {},
            transparent_bg = vim.g.transparent_enabled, -- default false
            italic_comment = true, -- default false

            overrides = {
                TreesitterContextBottom = { bg = colors.nontext },
                TreesitterContextLineNumberBottom = { bg = colors.nontext },
            },
        })
    end,
}
