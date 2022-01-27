local status_ok, FTerm = pcall(require, 'FTerm')
if not status_ok then
    return
end

FTerm.setup({
    border = 'solid',
    dimensions  = {
        height = 0.6,
        width = 0.6,
    },
})

-- Example keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-\\>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<C-\\>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
