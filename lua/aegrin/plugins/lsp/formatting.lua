return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                yaml = { "prettier" },
                json = { "prettier" },
                php = { "phpcbf" },
                blade = { "blade-formatter" },
                sql = { "sqlfluff" },
                markdown = { "prettier" },
            },
            -- format_on_save = {
            --     lsp_format = "fallback",
            --     async = false,
            --     timeout_ms = 1000,
            -- },
            notify_no_formatters = true,
        })

        vim.keymap.set({ "n", "v" }, "<leader>F", function()
            conform.format({
                lsp_fallback = "fallback",
                async = true,
                -- timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
