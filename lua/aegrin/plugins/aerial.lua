return {
    "stevearc/aerial.nvim",
    config = function()
        local aerial = require("aerial")
        local keymap = vim.keymap

        aerial.setup({
            filter_kind = false,
            default_direction = "prefer_right",
        })

        keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    end,
}
