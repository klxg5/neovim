Opts = { noremap = true, silent = true }

-- Leader key
vim.keymap.set("", "<Space>", "<Nop>", Opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- copy all
vim.keymap.set("n", "<leader>ya", "<cmd>%y<cr>", Opts)
-- Window Management
vim.keymap.set("n", "<bs>w", "<C-w>q", Opts) -- quit current window alt
vim.keymap.set("n", "<M-h>", "<C-w>h", Opts) -- go to left window
vim.keymap.set("n", "<M-j>", "<C-w>j", Opts) -- go to bottom window
vim.keymap.set("n", "<M-k>", "<C-w>k", Opts) -- go to top window
vim.keymap.set("n", "<M-l>", "<C-w>l", Opts) -- go to right window
vim.keymap.set("n", "<leader>vk", "<cmd>resize +1<cr>", Opts) -- resize window to be taller
vim.keymap.set("n", "<leader>vj", "<cmd>resize -1<cr>", Opts) -- resize window to be shorter
vim.keymap.set("n", "<leader>vl", "<cmd>vertical resize +1<cr>", Opts) -- resize window to be wider
vim.keymap.set("n", "<leader>vh", "<cmd>vertical resize -1<cr>", Opts) -- resize window to be narrower
vim.keymap.set("n", "<leader>vkk", "<cmd>resize +3<cr>", Opts) -- resize window to be taller
vim.keymap.set("n", "<leader>vjj", "<cmd>resize -3<cr>", Opts) -- resize window to be shorter
vim.keymap.set("n", "<leader>vll", "<cmd>vertical resize +8<cr>", Opts) -- resize window to be wider
vim.keymap.set("n", "<leader>vhh", "<cmd>vertical resize -8<cr>", Opts) -- resize window to be narrower
-- fix Copy/Paste in visual so current text is not overwritten
vim.keymap.set("v", "p", '"_dP')
-- Buffer Management ** see telescope keymaps for buffer list **
vim.keymap.set("n", "<BS>t", "<cmd>tabc<cr>", Opts)
-- Buffer Management ** see telescope keymaps for buffer list **
vim.keymap.set("n", "<BS>b", "<cmd>bwipeout<cr>", Opts)
vim.keymap.set("n", "H", "<cmd>bprev<cr>", Opts)
vim.keymap.set("n", "L", "<cmd>bnext<cr>", Opts)
-- Swap paste (better placement of curser after paste by default)
vim.keymap.set("n", "gp", "p", Opts)
vim.keymap.set("n", "gP", "P", Opts)
vim.keymap.set("n", "p", "gp", Opts)
vim.keymap.set("n", "P", "gP", Opts)
-- Center when jumping around
vim.keymap.set("n", "<C-u>", "<C-u>zz", Opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", Opts)
vim.keymap.set("n", "n", "nzz", Opts)
vim.keymap.set("n", "<S-n>", "<S-n>zz", Opts)
-- vim.keymap.set("n", "<S-j>", "gJ", Opts)
-- Quickfix/Location lists
vim.keymap.set("n", "<BS>q", "<cmd>cclose<cr>", Opts)
vim.keymap.set("n", "<BS>l", "<cmd>lcl<cr>", Opts)
vim.keymap.set("n", "<C-n>", "<cmd>cnext<cr>", Opts)
vim.keymap.set("n", "<c-p>", "<cmd>cprev<cr>", Opts)
vim.keymap.set("n", "<leader>q<enter>", "<cmd>cw<cr>", Opts)
vim.keymap.set("n", "<leader>ll", "<cmd>lw<cr>", Opts)
-- Better Join
vim.keymap.set("n", "<leader>j", "J", Opts)
vim.keymap.set("n", "J", "<cmd>j<cr>", Opts)
vim.keymap.set("n", "gJ", "gJ", Opts)
-- better tabbing
vim.keymap.set("v", "<", "<gv", Opts)
vim.keymap.set("v", ">", ">gv", Opts)
-- Empower gf to open non-exsting file locations
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
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, Opts)
-- Harpoon
-- Pomodoro
vim.keymap.set("n", "<F7>", "<cmd>PomodoroStart<cr>", Opts)
vim.keymap.set("n", "<S-F7>", "<cmd>PomodoroStop<cr>", Opts)
-- Gitsigns
vim.keymap.set("n", "gsn", "<cmd>Gitsigns next_hunk<CR>", Opts)
vim.keymap.set("n", "gsN", "<cmd>Gitsigns prev_hunk<CR>", Opts)
vim.keymap.set("n", "gss", "<cmd>Gitsigns stage_hunk<CR>", Opts)
vim.keymap.set("n", "gsu", "<cmd>Gitsigns undo_stage_hunk<CR>", Opts)
vim.keymap.set("n", "gsr", "<cmd>Gitsigns reset_hunk<CR>", Opts)
vim.keymap.set("n", "gsp", "<cmd>Gitsigns preview_hunk<CR>", Opts)
vim.keymap.set("n", "gsb", "<cmd>Gitsigns blame_line<CR>", Opts)
vim.keymap.set("n", "gst", "<cmd>Gitsigns toggle_current_line_blame<CR>", Opts)
-- treesitter context
vim.keymap.set("n", "gk", function()
    require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })
-- ToggleTerm
vim.keymap.set("n", "<leader><enter>", "<cmd>ToggleTerm<cr>", Opts)
-- Neovide config
vim.keymap.set("n", "ide", "<cmd>e ~/.config/neovide/config.toml<cr>", Opts)
-- Telekasten
-- vim.keymap.set("n", "<leader>tk", "<cmd>lua require'telekasten'.find_notes()<cr>", Opts)
-- vim.keymap.set("n", "<leader>tkt", "<cmd>lua require'telekasten'.show_tags()<cr>", Opts)
-- vim.keymap.set("n", "<leader>tkb", "<cmd>lua require'telekasten'.show_backlinks()<cr>", Opts)
-- vim.keymap.set("n", "<leader>tkd", "<cmd>lua require'telekasten'.find_daily_notes()<cr>", Opts)
-- vim.keymap.set("n", "<leader>tkw", "<cmd>lua require'telekasten'.find_weekly_notes()<cr>", Opts)
-- vim.keymap.set("n", "<leader>tkf", "<cmd>lua require'telekasten'.find_friends()<cr>", Opts)
-- vim.keymap.set("n", "<leader>tkm", "<cmd>lua require'telekasten'.browse_media()<cr>", Opts)
-- vim.keymap.set("n", "<leader>tks", "<cmd>lua require'telekasten'.search_notes()<cr>", Opts)
-- vim.keymap.set("n", "tkc", "<cmd>lua require'telekasten'.show_calendar()<cr>", Opts)
-- vim.keymap.set("n", "tkd", "<cmd>lua require'telekasten'.goto_today()<cr>", Opts)
-- vim.keymap.set("n", "tkw", "<cmd>lua require'telekasten'.goto_thisweek()<cr>", Opts)
-- vim.keymap.set("n", "tkn", "<cmd>lua require'telekasten'.new_note()<cr>", Opts)
-- vim.keymap.set("n", "tknt", "<cmd>lua require'telekasten'.new_templated_note()<cr>", Opts)
-- vim.keymap.set("n", "tkt", "<cmd>lua require('telekasten').toggle_todo()<cr>", Opts)
-- vim.keymap.set("n", "tk<enter>", "<cmd>lua require('telekasten').follow_link()<cr>", Opts)
-- vim.keymap.set("n", "tky", "<cmd>lua require('telekasten').yank_notelink()<cr>", Opts)
-- vim.keymap.set("i", "<M-t>i", "<esc>:lua require'telekasten'.insert_link({ i = true })<cr>", Opts)
-- vim.keymap.set("i", "<M-t>d", "<esc>:lua require'telekasten'.toggle_todo({ i = true })<cr>", Opts)
-- vim.keymap.set("i", "<M-t>t", "<esc>:lua require'telekasten'.show_tags({ i = true })<cr>", Opts)
-- nnoremap <leader>zi :lua require('telekasten').paste_img_and_link()<CR>
-- nnoremap <leader>zI :lua require('telekasten').insert_img_link({ i=true })<CR>
-- nnoremap <leader>zp :lua require('telekasten').preview_img()<CR>
