return    {
    "cryptomilk/nightcity.nvim",
    config = {
        style = 'afterlife',
        on_highlights = function(groups, c)
            groups.String = { bg = c.none }
            groups['@variable'] = { fg = c.lightaqua }
            groups.lualine_buffers_active = { bg = c.darkred, fg = '#690000' }
            groups.lualine_buffers_inactive = { bg = '#615b53', fg = c.white }
            -- groups.Function = { bold = false }
            -- groups['@parameter'] = { bold = false }
        end,
    },
}
