local status_ok, dracula = pcall(require, "dracula")
if not status_ok then
    return
end

dracula.setup({
    colors = {},
    transparent_bg = vim.g.transparent_enabled, -- default false
    italic_comment = true, -- default false

    -- overrides the default highlights see `:h synIDattr`
    overrides = {
        -- Examples
        -- Normal = { bg='None' }
        -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
        -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
        -- Nothing = {} -- clear highlight of Nothing
        TreesitterContextBottom = { bg=dracula.colors().nontext},
        TreesitterContextLineNumberBottom = { bg=dracula.colors().nontext}
    },
})

vim.cmd("colorscheme dracula")
