local status_ok, onenord = pcall(require, "onenord")
if not status_ok then
    return
end

local colors = require("onenord.colors").load()
onenord.setup({
    theme = "dark",
    fade_nc = true,
    styles = {},
    custom_highlights = {
        TSDefinition = {
            bg = colors.dark_pink,
        },
        TSDefinitionUsage = {
            bg = colors.dark_red,
        },
        TSCurrentScope = {
            bg = "#3C424F",
        },
    },
})
