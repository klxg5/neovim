local map = vim.keymap.set
local term_opts = { silent = true }

-- Leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- copy all
map("n", "<leader>ya", ":%y<cr>")
-- Replace word under cursor
map("n", "<leader>sf", ":%s/<C-R><C-W>//gI<left><left><left>", { noremap = false }) -- in file
map("n", "<leader>sl", ":s/<C-R><C-W>//gI<left><left><left>", { noremap = false }) -- on line
-- Window Management
map("n", "<leader>ww", "<C-w><C-w>") -- cycle though windows
map("n", "<bs>w", "<C-w>q") -- quit current window alt
map("n", "<leader>wn", "<C-w>n") -- create new window
map("n", "<M-h>", "<C-w>h") -- go to window to the left
map("n", "<M-j>", "<C-w>j") -- go to the lower window
map("n", "<M-k>", "<C-w>k") -- go to the upper window
map("n", "<M-l>", "<C-w>l") -- go to window to the right
map("n", "<M-up>", ":resize +2<cr>") -- resize window to be taller
map("n", "<M-down>", ":resize -2<cr>") -- resize window to be shorter
map("n", "<M-right>", ":vertical resize +2<cr>") -- resize window to be wider
map("n", "<M-left>", ":vertical resize -2<cr>") -- resize window to be narrower
-- Move lines and keep proper indents
map("v", "<C-j>", ":m '>+1'<cr>gv=gv")
map("v", "<C-k>", ":m '<-2'<cr>gv=gv")
-- fix Copy/Paste in visual so current text is not overwritten
map("v", "p", '"_dP')
-- Buffer Management ** PLUGIN **
map("n", "<BS>b", ":BufferWipeout<CR>") -- Delete/Close Buffer
map("n", "<Leader>b", ":BufferLast<CR>") -- Open the last Buffer
map("n", "<S-l>", ":BufferNext<CR>")
map("n", "<S-M-l>", ":BufferMoveNext<CR>")
map("n", "<S-h>", ":BufferPrevious<CR>")
map("n", "<S-M-h>", ":BufferMovePrevious<CR>")
-- Swap paste
map("n", "gp", "p")
map("n", "gP", "P")
map("n", "p", "gp")
map("n", "P", "gP")
-- Center when jumping around
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "n", "nzz")
map("n", "<S-n>", "<S-n>zz")
-- Quickfix/Location lists
map("n", "<BS>cq", ":cclose<CR>")
map("n", "<BS>cl", ":lcl<CR>")
map("n", "<C-n>", ":cnext<CR>")
map("n", "<C-p>", ":cprev<CR>")
map("n", "<Leader>cq", ":cw<CR>")
map("n", "<Leader>cl", ":lw<CR>")
-- Better Join
map("n", "<S-j>", ":j<CR>")
-- Remap Home Key
map("n", "<Home>", "^")
map("n", "<S-Home>", "$")
map("n", "<PageUp>", "<C-b>")
map("n", "<S-PageUp>", "<C-u>")
map("n", "<PageDown>", "<C-f>")
map("n", "<S-PageDown>", "<C-d>")
-- better tabbing
map("v", "<", "<gv")
map("v", ">", ">gv")
-- while pumvisible
map("i", "<C-j>", "pumvisible() ? '<C-N>' : 'j'", { noremap = true, expr = true })
map("i", "<C-k>", "pumvisible() ? '<C-P>' : 'k'", { noremap = true, expr = true })
map("c", "<C-j>", "pumvisible() ? '<C-N>' : 'j'", { noremap = true, expr = true })
map("c", "<C-k>", "pumvisible() ? '<C-P>' : 'k'", { noremap = true, expr = true })
-- Empower gf to open non-exsting file locations
map("", "gf", ":e <cfile><cr>", { silent = true })
-- Folds
map("n", "<Leader><TAB>", "za" ) -- toggle current fold
map("n", "<Leader><S-TAB>", "zA" ) -- toggle all folds
map("n", "<Leader>z", "zfa}", { noremap = true }) -- create fold from block
map("v", "<Leader>z", "zf", { noremap = true }) -- create fold from selection
map("n", "<BS>z", "zd", { noremap = true }) -- delete fold
-- Edit
