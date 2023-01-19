local status_ok, FTerm = pcall(require, 'FTerm')
if not status_ok then
    return
end

FTerm.setup({
    ft = 'FTerm',
    -- border chars -  │
    border = {"", "", "", "│", "", "", "", "│"},
    dimensions  = {
        height = 0.5,
        width = 0.75,
        x = 0.5,
        y = 0.5,
    },
})

local gitui = FTerm:new({
    ft = 'fterm_gitui',
    border = {"", "", "", "│", "", "", "", "│"},
    cmd = "gitui",
    dimensions = {
        height = 0.9,
        width = 0.9,
        x = 0.5,
        y = 0.5,
    }
})

-- Keymap
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
keymap.set('n', '<M-t>', '<cmd>lua require("FTerm").toggle()<cr>', opts)
keymap.set('t', '<M-t>', '<cmd>lua require("FTerm").toggle()<cr>', opts)

keymap.set('n', '<M-g>', function ()
    gitui:toggle()
end)
