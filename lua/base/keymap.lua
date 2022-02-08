local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- copy all
map("n", "<leader>ya", ":%y<cr>", opts)
-- Replace word under cursor
map("n", "<leader>sf", ":%s/<C-R><C-W>//gI<left><left><left>", { noremap = false }) -- in file
map("n", "<leader>sl", ":s/<C-R><C-W>//gI<left><left><left>", { noremap = false }) -- on line
-- Window Management
map("n", "<leader>ww", "<C-w><C-w>", opts) -- cycle though windows
map("n", "<bs>w", "<C-w>q", opts) -- quit current window alt
map("n", "<leader>wn", "<C-w>n", opts) -- create new window
map("n", "<M-h>", "<C-w>h", opts) -- go to window to the left
map("n", "<M-j>", "<C-w>j", opts) -- go to the lower window
map("n", "<M-k>", "<C-w>k", opts) -- go to the upper window
map("n", "<M-l>", "<C-w>l", opts) -- go to window to the right
map("n", "<M-up>", ":resize +2<cr>", opts) -- resize window to be taller
map("n", "<M-down>", ":resize -2<cr>", opts) -- resize window to be shorter
map("n", "<M-right>", ":vertical resize +2<cr>", opts) -- resize window to be wider
map("n", "<M-left>", ":vertical resize -2<cr>", opts) -- resize window to be narrower
-- Move lines and keep proper indents
map("v", "<C-j>", ":m '>+1'<cr>gv=gv", opts)
map("v", "<C-k>", ":m '<-2'<cr>gv=gv", opts)
-- fix Copy/Paste in visual so current text is not overwritten
map("v", "p", '"_dP', opts)
-- Buffer Management ** PLUGIN **
map("n", "<BS>b", ":BufferWipeout<CR>", opts) -- Delete/Close Buffer
map("n", "<Leader>b", ":BufferLast<CR>", opts) -- Open the last Buffer
map("n", "<S-l>", ":BufferNext<CR>", opts)
map("n", "<S-M-l>", ":BufferMoveNext<CR>", opts)
map("n", "<S-h>", ":BufferPrevious<CR>", opts)
map("n", "<S-M-h>", ":BufferMovePrevious<CR>", opts)
-- Swap paste
map("n", "gp", "p", opts)
map("n", "gP", "P", opts)
map("n", "p", "gp", opts)
map("n", "P", "gP", opts)
-- Quickfix/Location lists
map("n", "<BS>cq", ":cclose<CR>", opts)
map("n", "<BS>cl", ":lcl<CR>", opts)
map("n", "<C-n>", ":cnext<CR>", opts)
map("n", "<C-p>", ":cprev<CR>", opts)
map("n", "<Leader>cq", ":cw<CR>", opts)
map("n", "<Leader>cl", ":lw<CR>", opts)
-- Better Join
map("n", "<S-j>", ":j<CR>", opts)
-- Remap Home Key
map("n", "<Home>", "^", opts)
map("n", "<S-Home>", "$", opts)
map("n", "<PageUp>", "<C-b>", opts)
map("n", "<S-PageUp>", "<C-u>", opts)
map("n", "<PageDown>", "<C-f>", opts)
map("n", "<S-PageDown>", "<C-d>", opts)
-- better tabbing
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
-- while pumvisible
map("i", "<C-j>", "pumvisible() ? '<C-N>' : 'j'", { noremap = true, expr = true })
map("i", "<C-k>", "pumvisible() ? '<C-P>' : 'k'", { noremap = true, expr = true })
map("c", "<C-j>", "pumvisible() ? '<C-N>' : 'j'", { noremap = true, expr = true })
map("c", "<C-k>", "pumvisible() ? '<C-P>' : 'k'", { noremap = true, expr = true })
-- Empower gf to open non-exsting file locations
map("", "gf", ":e <cfile><cr>", { silent = true })
-- Folds
map("n", "<Leader><TAB>", "za", opts ) -- toggle current fold
map("n", "<Leader><S-TAB>", "zA", opts ) -- toggle all folds
map("n", "<Leader>z", "zfa}", { noremap = true }) -- create fold from block
map("v", "<Leader>z", "zf", { noremap = true }) -- create fold from selection
map("n", "<Leader>zx", "zd", { noremap = true }) -- delete fold
-- Edit
