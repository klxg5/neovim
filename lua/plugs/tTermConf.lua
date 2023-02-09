local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup()

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<M-t>", '<cmd>ToggleTerm<cr>', opts)
vim.keymap.set("t", "<M-t>", [[<C-\><C-n><cmd>wincmd q<cr>]], opts)
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
