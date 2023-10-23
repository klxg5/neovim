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
    current_line_blame = false,
     current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter_opts = {
        relative_time = true,
    },
})
