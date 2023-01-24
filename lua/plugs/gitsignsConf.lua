local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    return
end

gitsigns.setup({
    signs = {
        add = { text = "" },
        change = { text = "" },
        delete = { text = "" },
        topdelete = { text = "ﬢ" },
        changedelete = { text = "" },
        untracked = { text = "⇢" },
    },
    signcolumn = true,
    numhl = true,
    linehl = false,
    word_diff = false,
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter_opts = {
        relative_time = true,
    },
    keymaps = {
        noremap = true,
        ["n gsn"] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'" },
        ["n gsN"] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'" },
        ["n gss"] = "<cmd>Gitsigns stage_hunk<CR>",
        ["n gsS"] = "<cmd>Gitsigns stage_buffer<CR>",
        ["n gsu"] = "<cmd>Gitsigns undo_stage_hunk<CR>",
        ["n gsr"] = "<cmd>Gitsigns reset_hunk<CR>",
        ["n gsR"] = "<cmd>Gitsigns reset_buffer<CR>",
        ["n gsp"] = "<cmd>Gitsigns preview_hunk<CR>",
        ["n gsb"] = "<cmd>Gitsigns blame_line<CR>",
        ["n gsi"] = "<cmd>Gitsigns reset_buffer_index<CR>",
    },
})
