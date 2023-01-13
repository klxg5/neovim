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

vim.keymap.set('n', '<A-g>', function()gitui:toggle()end)
vim.keymap.set('t', '<A-g>', function()gitui:toggle()end)

