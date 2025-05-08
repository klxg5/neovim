local opts = { noremap = true, silent = true }

-- Leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- copy all
opts.desc = "Yank all"
vim.keymap.set("n", "<leader>ya", "<cmd>%y<cr>", opts)
-- Window Management
opts.desc = "Close Window"
vim.keymap.set("n", "<bs>w", "<C-w>q", opts)
opts.desc = "Move to the left window"
vim.keymap.set("n", "<M-h>", "<C-w>h", opts)
opts.desc = "Move to the lower window"
vim.keymap.set("n", "<M-j>", "<C-w>j", opts)
opts.desc = "Move to the upper window"
vim.keymap.set("n", "<M-k>", "<C-w>k", opts)
opts.desc = "Move to the right window"
vim.keymap.set("n", "<M-l>", "<C-w>l", opts)
opts.desc = "Resize windows to be equal"
vim.keymap.set("n", "<M-5>", "<C-w>=", opts)
opts.desc = "Resize window to be +1 taller"
vim.keymap.set("n", "<M-8>", "<cmd>resize +1<cr>", opts)
opts.desc = "Resize window to be -1 shorter"
vim.keymap.set("n", "<M-2>", "<cmd>resize -1<cr>", opts)
opts.desc = "Resize window to be +1 wider"
vim.keymap.set("n", "<M-6>", "<cmd>vertical resize +1<cr>", opts)
opts.desc = "Resize window to be -1 narrower"
vim.keymap.set("n", "<M-4>", "<cmd>vertical resize -1<cr>", opts)
-- opts.desc = "Go to declaration"
-- vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
-- fix Copy/Paste in visual so current text is not overwritten
vim.keymap.set("v", "p", '"_dP')
-- Buffer Management ** see telescope keymaps for buffer list **
opts.desc = "Close Tab"
vim.keymap.set("n", "<BS>t", "<cmd>tabc<cr>", opts)
-- Buffer Management ** see telescope keymaps for buffer list **
opts.desc = "Close buffer"
vim.keymap.set("n", "<BS>b", "<cmd>bwipeout<cr>", opts)
opts.desc = "Previous Buffer"
vim.keymap.set("n", "H", "<cmd>bprev<cr>", opts)
opts.desc = "Next Buffer"
vim.keymap.set("n", "L", "<cmd>bnext<cr>", opts)
-- Swap paste (better placement of curser after paste by default)
-- vim.keymap.set("n", "gp", "p", opts)
-- vim.keymap.set("n", "gP", "P", opts)
-- vim.keymap.set("n", "p", "gp", opts)
-- vim.keymap.set("n", "P", "gP", opts)
-- Center when jumping around
opts.desc = "Half page up and center"
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
opts.desc = "Half page down and center"
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
opts.desc = "Find next and center"
vim.keymap.set("n", "n", "nzz", opts)
opts.desc = "Find prev and center"
vim.keymap.set("n", "<S-n>", "<S-n>zz", opts)
-- Quickfix/Location lists
opts.desc = "Close quickfix menu"
vim.keymap.set("n", "<BS>q", "<cmd>cclose<cr>", opts)
opts.desc = "Close local quickfix menu"
vim.keymap.set("n", "<BS>l", "<cmd>lcl<cr>", opts)
-- Better Join
opts.desc = "Join seperated line with cursor at the end"
vim.keymap.set("n", "J", "J", opts)
opts.desc = "Join non-seperated line with cursor at the end"
vim.keymap.set("n", "gJ", "gJ", opts)
opts.desc = "Join seperated line with curser at the beginning"
vim.keymap.set("n", "<leader>j", "<cmd>join<cr>", opts)
opts.desc = "Join non-seperated line with curser at the beginning"
vim.keymap.set("n", "<leader>J", "<cmd>join!<cr>", opts)
-- better tabbing
opts.desc = "Indent and keep selection"
vim.keymap.set("v", ">", ">gv", opts)
opts.desc = "Unindent and keep selection"
vim.keymap.set("v", "<", "<gv", opts)
-- Empower gf to open non-exsting file locations
opts.desc = "Empowered gf"
vim.keymap.set("n", "gf", "<cmd>e <cfile><cr>", { silent = true })
-- Format code
vim.keymap.set("n", "<M-f>", "<cmd>lua vim.lsp.buf.format()<cr>")
-- nohl shortcut
vim.keymap.set("n", "<leader><Esc>", "<cmd>nohlsearch<cr>")
-- Folds
vim.keymap.set("n", "<C-z>", "za") -- toggle current fold
vim.keymap.set("n", "<leader><S-TAB>", "zA") -- toggle all folds
vim.keymap.set("n", "<leader>z", "zfa}", { noremap = true }) -- create fold from block
vim.keymap.set("v", "<leader>z", "zf", { noremap = true }) -- create fold from selection
vim.keymap.set("n", "<BS>z", "zd", { noremap = true }) -- delete fold
-- Remap wrap commands
vim.keymap.set("n", "wj", "gj", { noremap = true }) -- go down one wrapped line
vim.keymap.set("n", "wk", "gk", { noremap = true }) -- go up one wrapped line
vim.keymap.set("n", "w^", "g^", { noremap = true }) -- go to the beginning of the wrapped line
vim.keymap.set("n", "w0", "g0", { noremap = true }) -- go to the beginning of the wrapped line
vim.keymap.set("n", "w$", "g$", { noremap = true }) -- go to the end of the wrapped line

-- PLUGINS

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, opts)
-- Harpoon
-- Pomodoro
vim.keymap.set("n", "<F7>", "<cmd>PomodoroStart<cr>", opts)
vim.keymap.set("n", "<S-F7>", "<cmd>PomodoroStop<cr>", opts)
-- Gitsigns
vim.keymap.set("n", "gsn", "<cmd>Gitsigns next_hunk<CR>", opts)
vim.keymap.set("n", "gsN", "<cmd>Gitsigns prev_hunk<CR>", opts)
vim.keymap.set("n", "gss", "<cmd>Gitsigns stage_hunk<CR>", opts)
vim.keymap.set("n", "gsu", "<cmd>Gitsigns undo_stage_hunk<CR>", opts)
vim.keymap.set("n", "gsr", "<cmd>Gitsigns reset_hunk<CR>", opts)
vim.keymap.set("n", "gsp", "<cmd>Gitsigns preview_hunk<CR>", opts)
vim.keymap.set("n", "gsb", "<cmd>Gitsigns blame_line<CR>", opts)
vim.keymap.set("n", "gst", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
-- treesitter context
vim.keymap.set("n", "gk", function()
    require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })
-- ToggleTerm
vim.keymap.set("n", "<leader><enter>", "<cmd>ToggleTerm<cr>", opts)
-- Neovide config
vim.keymap.set("n", "ide", "<cmd>e ~/.config/neovide/config.toml<cr>", opts)
-- Telekasten
-- vim.keymap.set("n", "<leader>tk", "<cmd>lua require'telekasten'.find_notes()<cr>", opts)
-- vim.keymap.set("n", "<leader>tkt", "<cmd>lua require'telekasten'.show_tags()<cr>", opts)
-- vim.keymap.set("n", "<leader>tkb", "<cmd>lua require'telekasten'.show_backlinks()<cr>", opts)
-- vim.keymap.set("n", "<leader>tkd", "<cmd>lua require'telekasten'.find_daily_notes()<cr>", opts)
-- vim.keymap.set("n", "<leader>tkw", "<cmd>lua require'telekasten'.find_weekly_notes()<cr>", opts)
-- vim.keymap.set("n", "<leader>tkf", "<cmd>lua require'telekasten'.find_friends()<cr>", opts)
-- vim.keymap.set("n", "<leader>tkm", "<cmd>lua require'telekasten'.browse_media()<cr>", opts)
-- vim.keymap.set("n", "<leader>tks", "<cmd>lua require'telekasten'.search_notes()<cr>", opts)
-- vim.keymap.set("n", "tkc", "<cmd>lua require'telekasten'.show_calendar()<cr>", opts)
-- vim.keymap.set("n", "tkd", "<cmd>lua require'telekasten'.goto_today()<cr>", opts)
-- vim.keymap.set("n", "tkw", "<cmd>lua require'telekasten'.goto_thisweek()<cr>", opts)
-- vim.keymap.set("n", "tkn", "<cmd>lua require'telekasten'.new_note()<cr>", opts)
-- vim.keymap.set("n", "tknt", "<cmd>lua require'telekasten'.new_templated_note()<cr>", opts)
-- vim.keymap.set("n", "tkt", "<cmd>lua require('telekasten').toggle_todo()<cr>", opts)
-- vim.keymap.set("n", "tk<enter>", "<cmd>lua require('telekasten').follow_link()<cr>", opts)
-- vim.keymap.set("n", "tky", "<cmd>lua require('telekasten').yank_notelink()<cr>", opts)
-- vim.keymap.set("i", "<M-t>i", "<esc>:lua require'telekasten'.insert_link({ i = true })<cr>", opts)
-- vim.keymap.set("i", "<M-t>d", "<esc>:lua require'telekasten'.toggle_todo({ i = true })<cr>", opts)
-- vim.keymap.set("i", "<M-t>t", "<esc>:lua require'telekasten'.show_tags({ i = true })<cr>", opts)
-- nnoremap <leader>zi :lua require('telekasten').paste_img_and_link()<CR>
-- nnoremap <leader>zI :lua require('telekasten').insert_img_link({ i=true })<CR>
-- nnoremap <leader>zp :lua require('telekasten').preview_img()<CR>
