return {
    "lewis6991/gitsigns.nvim",
    config = function ()
        local gitsigns = require("gitsigns")

        gitsigns.setup({
            signs = {
                add = { text = "" },
                change = { text = "" },
                delete = { text = "" },
                topdelete = { text = "󰘣" },
                changedelete = { text = "󰁭" },
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
    end
}
