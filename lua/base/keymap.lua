local opts = { noremap = true, silent = true }

-- Leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- copy all
vim.keymap.set("n", "<leader>ya", "<cmd>%y<cr>", opts)
-- Replace word under cursor
vim.keymap.set("n", "<leader>sf", "<cmd>%s/<C-R><C-W>//gI<left><left><left>", { noremap = false }) -- in file
vim.keymap.set("n", "<leader>sl", "<cmd>s/<C-R><C-W>//gI<left><left><left>", { noremap = false }) -- on line
-- Window Management
vim.keymap.set("n", "<leader>ww", "<C-w><C-w>", opts) -- cycle though windows
vim.keymap.set("n", "<bs>w", "<C-w>q", opts) -- quit current window alt
vim.keymap.set("n", "<leader>wn", "<C-w>n", opts) -- create new window
vim.keymap.set("n", "<C-h>", "<C-w>h", opts) -- go to window to the left
vim.keymap.set("n", "<C-j>", "<C-w>j", opts) -- go to the lower window
vim.keymap.set("n", "<C-k>", "<C-w>k", opts) -- go to the upper window
vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- go to window to the right
vim.keymap.set("n", "<M-C-k>", "<cmd>resize +1<cr>", opts) -- resize window to be taller
vim.keymap.set("n", "<M-C-j>", "<cmd>resize -1<cr>", opts) -- resize window to be shorter
vim.keymap.set("n", "<M-C-l>", "<cmd>vertical resize +1<cr>", opts) -- resize window to be wider
vim.keymap.set("n", "<M-C-h>", "<cmd>vertical resize -1<cr>", opts) -- resize window to be narrower
vim.keymap.set("n", "<M-k>", "<cmd>resize +3<cr>", opts) -- resize window to be taller
vim.keymap.set("n", "<M-j>", "<cmd>resize -3<cr>", opts) -- resize window to be shorter
vim.keymap.set("n", "<M-l>", "<cmd>vertical resize +10<cr>", opts) -- resize window to be wider
vim.keymap.set("n", "<M-h>", "<cmd>vertical resize -10<cr>", opts) -- resize window to be narrower
-- Move lines and keep proper indents
vim.keymap.set("v", "<C-j>", "<cmd>m '>+1'<cr>gv=gv", opts)
vim.keymap.set("v", "<C-k>", "<cmd>m '<-2'<cr>gv=gv", opts)
-- fix Copy/Paste in visual so current text is not overwritten
vim.keymap.set("v", "p", '"_dP')
-- Buffer Management ** see telescope keymaps for buffer list **
vim.keymap.set("n", "<BS>t", "<cmd>tabc<cr>", opts)
vim.keymap.set("n", "<leader>nt", "<cmd>tabnext<cr>", opts)
vim.keymap.set("n", "<leader>pt", "<cmd>tabprevious<cr>", opts)
-- Buffer Management ** see telescope keymaps for buffer list **
vim.keymap.set("n", "<BS>b", "<cmd>bwipeout<cr>", opts)
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", opts)
vim.keymap.set("n", "<S-h>", "<cmd>bprev<cr>", opts)
-- Swap paste (better placement of curser after paste by default)
vim.keymap.set("n", "gp", "p", opts)
vim.keymap.set("n", "gP", "P", opts)
vim.keymap.set("n", "p", "gp", opts)
vim.keymap.set("n", "P", "gP", opts)
-- Center when jumping around
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "<S-n>", "<S-n>zz", opts)
-- keymap.set("n", "<S-j>", "gJ", opts)
vim.keymap.set("n", "<S-k>", "Whs<cr><C-[>", opts)
-- Quickfix/Location lists
vim.keymap.set("n", "<BS>q", "<cmd>cclose<cr>", opts)
vim.keymap.set("n", "<BS>l", "<cmd>lcl<cr>", opts)
vim.keymap.set("n", "<C-n>", "<cmd>cnext<cr>", opts)
vim.keymap.set("n", "<c-p>", "<cmd>cprev<cr>", opts)
vim.keymap.set("n", "<leader>q<enter>", "<cmd>cw<cr>", opts)
vim.keymap.set("n", "<leader>ll", "<cmd>lw<cr>", opts)
-- Better Join
vim.keymap.set("n", "gj", "<cmd>j<cr>", opts)
-- better tabbing
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("n", "<M-H>", "<cmd>tabprevious<cr>")
vim.keymap.set("n", "<M-L>", "<cmd>tabnext<cr>")
-- Empower gf to open non-exsting file locations
-- vim.keymap.set("n", "gf", "<cmd>e <cfile><cr>", { silent = true })
-- Format code
vim.keymap.set("n", "<M-f>", "<cmd>lua vim.lsp.buf.format()<cr>")
-- Folds
vim.keymap.set("n", "<C-z>", "za") -- toggle current fold
vim.keymap.set("n", "<leader><S-TAB>", "zA") -- toggle all folds
vim.keymap.set("n", "<leader>z", "zfa}", { noremap = true }) -- create fold from block
vim.keymap.set("v", "<leader>z", "zf", { noremap = true }) -- create fold from selection
vim.keymap.set("n", "<BS>z", "zd", { noremap = true }) -- delete fold

-- PLUGINS

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, opts)
-- Harpoon
vim.keymap.set("n", "<leader>hh", "<cmd>lua require'harpoon.mark'.add_file()<cr>", opts)
vim.keymap.set("n", "<leader>h", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>", opts)
vim.keymap.set("n", "<leader>hn", "<cmd>lua require'harpoon.ui'.nav_next()<cr>", opts)
vim.keymap.set("n", "<leader>hk", "<cmd>lua require'harpoon.ui'.nav_prev()<cr>", opts)
-- Pomodoro
vim.keymap.set("n", "<F7>", "<cmd>PomodoroStart<cr>", opts)
vim.keymap.set("n", "<S-F7>", "<cmd>PomodoroStop<cr>", opts)
-- Gitsigns
vim.keymap.set("n", "gsn", "<cmd>Gitsigns next_hunk<CR>", opts)
vim.keymap.set("n", "gsN", "<cmd>Gitsigns prev_hunk<CR>", opts)
vim.keymap.set("n", "gss", "<cmd>Gitsigns stage_hunk<CR>", opts)
vim.keymap.set("n", "gsS", "<cmd>Gitsigns undo_stage_hunk<CR>", opts)
vim.keymap.set("n", "gsr", "<cmd>Gitsigns reset_hunk<CR>", opts)
vim.keymap.set("n", "gsp", "<cmd>Gitsigns preview_hunk<CR>", opts)
vim.keymap.set("n", "gsb", "<cmd>Gitsigns blame_line<CR>", opts)
vim.keymap.set("n", "gst", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
