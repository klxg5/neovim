local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Leader key
keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- copy all
keymap.set("n", "<leader>ya", "<cmd>%y<cr>", opts)
-- Replace word under cursor
keymap.set("n", "<leader>sf", "<cmd>%s/<C-R><C-W>//gI<left><left><left>", { noremap = false }) -- in file
keymap.set("n", "<leader>sl", "<cmd>s/<C-R><C-W>//gI<left><left><left>", { noremap = false }) -- on line
-- Window Management
keymap.set("n", "<leader>ww", "<C-w><C-w>", opts) -- cycle though windows
keymap.set("n", "<bs>w", "<C-w>q", opts) -- quit current window alt
keymap.set("n", "<leader>wn", "<C-w>n", opts) -- create new window
keymap.set("n", "<C-h>", "<C-w>h", opts) -- go to window to the left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- go to the lower window
keymap.set("n", "<C-k>", "<C-w>k", opts) -- go to the upper window
keymap.set("n", "<C-l>", "<C-w>l", opts) -- go to window to the right
keymap.set("n", "<M-k>", "<cmd>resize +1<cr>", opts) -- resize window to be taller
keymap.set("n", "<M-j>", "<cmd>resize -1<cr>", opts) -- resize window to be shorter
keymap.set("n", "<M-l>", "<cmd>vertical resize +1<cr>", opts) -- resize window to be wider
keymap.set("n", "<M-h>", "<cmd>vertical resize -1<cr>", opts) -- resize window to be narrower
-- Move lines and keep proper indents
keymap.set("v", "<C-j>", "<cmd>m '>+1'<cr>gv=gv", opts)
keymap.set("v", "<C-k>", "<cmd>m '<-2'<cr>gv=gv", opts)
-- fix Copy/Paste in visual so current text is not overwritten
keymap.set("v", "p", '"_dP')
-- Buffer Management ** see telescope keymaps for buffer list **
keymap.set("n", "<BS>b", "<cmd>bwipeout<cr>", opts)
keymap.set("n", "<S-l>", "<cmd>bnext<cr>", opts)
keymap.set("n", "<S-h>", "<cmd>bprev<cr>", opts)
-- Swap paste (better placement of curser after paste by default)
keymap.set("n", "gp", "p", opts)
keymap.set("n", "gP", "P", opts)
keymap.set("n", "p", "gp", opts)
keymap.set("n", "P", "gP", opts)
-- Center when jumping around
keymap.set("n", "<S-k>", "<C-u>zz", opts)
keymap.set("n", "<S-j>", "<C-d>zz", opts)
keymap.set("n", "n", "nzz", opts)
keymap.set("n", "<S-n>", "<S-n>zz", opts)
keymap.set("n", "gj", "<S-j>x", opts)
-- Quickfix/Location lists
keymap.set("n", "<BS>q", "<cmd>cclose<cr>", opts)
keymap.set("n", "<BS>l", "<cmd>lcl<cr>", opts)
keymap.set("n", "<C-n>", "<cmd>cnext<cr>", opts)
keymap.set("n", "<C-p>", "<cmd>cprev<cr>", opts)
keymap.set("n", "<leader>q<enter>", "<cmd>cw<cr>", opts)
keymap.set("n", "<leader>ll", "<cmd>lw<cr>", opts)
-- Better Join
keymap.set("n", "<M-j>", "<cmd>j<cr>", opts)
-- better tabbing
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
-- while pumvisible
keymap.set("i", "<C-j>", "pumvisible() ? '<C-N>' : 'j'", { noremap = true, expr = true })
keymap.set("i", "<C-k>", "pumvisible() ? '<C-P>' : 'k'", { noremap = true, expr = true })
keymap.set("c", "<C-j>", "pumvisible() ? '<C-N>' : 'j'", { noremap = true, expr = true })
keymap.set("c", "<C-k>", "pumvisible() ? '<C-P>' : 'k'", { noremap = true, expr = true })
-- Empower gf to open non-exsting file locations
keymap.set("", "gf", "<cmd>e <cfile><cr>", { silent = true })
-- Nvim Tree
keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', opts)
keymap.set('n', '<leader>r', '<cmd>NvimTreeRefresh<cr>', opts)
keymap.set('n', '<leader>/', '<cmd>NvimTreeFindFile<cr>', opts)
-- Dap 'xdebug'
keymap.set("n", "<C-x>", "<cmd>lua require('dapui').toggle()<cr>", opts)
keymap.set("n", "<F5>", "<cmd>DapContinue<cr>", opts)
keymap.set("n", "<F10>", "<cmd>DapStepOver<cr>", opts)
keymap.set("n", "<F11>", "<cmd>DapStepInto<cr>", opts)
keymap.set("n", "<F12>", "<cmd>DapStepOut<cr>", opts)
keymap.set("n", "<leader>x", "<cmd>DapToggleBreakpoint<cr>", opts)
keymap.set("n", "<leader>X", "lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
-- Telescope
keymap.set("n", "<leader>p", "<cmd>Telescope find_files<cr>", opts)
keymap.set("n", "<leader><S-p>", "<cmd>Telescope repo<cr>", opts)
keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<cr>", opts)
keymap.set("n", "<leader>fa", "<cmd>Telescope live_grep_args<cr>", opts)
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap.set("n", "<leader>nv", "<cmd>lua require'telescope.builtin'.find_files({prompt_title = '< NeoVim >', cwd = '~/.config/nvim/'})<cr>", opts)
-- Fterm
keymap.set('n', '<M-t>', '<cmd>lua require("FTerm").toggle()<cr>', opts)
keymap.set('t', '<M-t>', '<cmd>lua require("FTerm").toggle()<cr>', opts)
-- Harpoon
keymap.set('n', '<leader>h', '<cmd>lua require("harpoon.mark").add_file()<cr>', opts)
keymap.set("n", "<C-t>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap.set("n", "<C-t>n", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)
keymap.set("n", "<C-t>p", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)
-- Folds
keymap.set("n", "<leader><TAB>", "za" ) -- toggle current fold
keymap.set("n", "<leader><S-TAB>", "zA" ) -- toggle all folds
keymap.set("n", "<leader>z", "zfa}", { noremap = true }) -- create fold from block
keymap.set("v", "<leader>z", "zf", { noremap = true }) -- create fold from selection
keymap.set("n", "<BS>z", "zd", { noremap = true }) -- delete fold
-- Edit
