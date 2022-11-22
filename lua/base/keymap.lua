local keymap = vim.keymap
local term_opts = { silent = true }

-- Leader key
keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- copy all
keymap.set("n", "<leader>ya", ":%y<cr>")
-- Replace word under cursor
keymap.set("n", "<leader>sf", ":%s/<C-R><C-W>//gI<left><left><left>", { noremap = false }) -- in file
keymap.set("n", "<leader>sl", ":s/<C-R><C-W>//gI<left><left><left>", { noremap = false }) -- on line
-- Window Management
keymap.set("n", "<leader>ww", "<C-w><C-w>") -- cycle though windows
keymap.set("n", "<bs>w", "<C-w>q") -- quit current window alt
keymap.set("n", "<leader>wn", "<C-w>n") -- create new window
keymap.set("n", "<M-h>", "<C-w>h") -- go to window to the left
keymap.set("n", "<M-j>", "<C-w>j") -- go to the lower window
keymap.set("n", "<M-k>", "<C-w>k") -- go to the upper window
keymap.set("n", "<M-l>", "<C-w>l") -- go to window to the right
keymap.set("n", "<M-up>", ":resize +2<cr>") -- resize window to be taller
keymap.set("n", "<M-down>", ":resize -2<cr>") -- resize window to be shorter
keymap.set("n", "<M-right>", ":vertical resize +2<cr>") -- resize window to be wider
keymap.set("n", "<M-left>", ":vertical resize -2<cr>") -- resize window to be narrower
-- Move lines and keep proper indents
keymap.set("v", "<C-j>", ":m '>+1'<cr>gv=gv")
keymap.set("v", "<C-k>", ":m '<-2'<cr>gv=gv")
-- fix Copy/Paste in visual so current text is not overwritten
keymap.set("v", "p", '"_dP')
-- Buffer Management ** PLUGIN **
keymap.set("n", "<BS>b", ":BufferWipeout<CR>") -- Delete/Close Buffer
keymap.set("n", "<Leader>b", ":BufferLast<CR>") -- Open the last Buffer
keymap.set("n", "<S-l>", ":BufferNext<CR>")
keymap.set("n", "<S-M-l>", ":BufferMoveNext<CR>")
keymap.set("n", "<S-h>", ":BufferPrevious<CR>")
keymap.set("n", "<S-M-h>", ":BufferMovePrevious<CR>")
-- Swap paste
keymap.set("n", "gp", "p")
keymap.set("n", "gP", "P")
keymap.set("n", "p", "gp")
keymap.set("n", "P", "gP")
-- Center when jumping around
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "n", "nzz")
keymap.set("n", "<S-n>", "<S-n>zz")
-- Quickfix/Location lists
keymap.set("n", "<BS>cq", ":cclose<CR>")
keymap.set("n", "<BS>cl", ":lcl<CR>")
keymap.set("n", "<C-n>", ":cnext<CR>")
keymap.set("n", "<C-p>", ":cprev<CR>")
keymap.set("n", "<Leader>cq", ":cw<CR>")
keymap.set("n", "<Leader>cl", ":lw<CR>")
-- Better Join
keymap.set("n", "<S-j>", ":j<CR>")
-- Remap Home Key
keymap.set("n", "<Home>", "^")
keymap.set("n", "<S-Home>", "$")
keymap.set("n", "<PageUp>", "<C-b>")
keymap.set("n", "<S-PageUp>", "<C-u>")
keymap.set("n", "<PageDown>", "<C-f>")
keymap.set("n", "<S-PageDown>", "<C-d>")
-- better tabbing
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
-- while pumvisible
keymap.set("i", "<C-j>", "pumvisible() ? '<C-N>' : 'j'", { noremap = true, expr = true })
keymap.set("i", "<C-k>", "pumvisible() ? '<C-P>' : 'k'", { noremap = true, expr = true })
keymap.set("c", "<C-j>", "pumvisible() ? '<C-N>' : 'j'", { noremap = true, expr = true })
keymap.set("c", "<C-k>", "pumvisible() ? '<C-P>' : 'k'", { noremap = true, expr = true })
-- Empower gf to open non-exsting file locations
keymap.set("", "gf", ":e <cfile><cr>", { silent = true })
-- Folds
keymap.set("n", "<Leader><TAB>", "za" ) -- toggle current fold
keymap.set("n", "<Leader><S-TAB>", "zA" ) -- toggle all folds
keymap.set("n", "<Leader>z", "zfa}", { noremap = true }) -- create fold from block
keymap.set("v", "<Leader>z", "zf", { noremap = true }) -- create fold from selection
keymap.set("n", "<BS>z", "zd", { noremap = true }) -- delete fold
-- Edit
