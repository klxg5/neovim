return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lint = require("lint")

        lint.lnters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            php = { "tlint" },
            blade = { "tlint" },
            lua = { "selene" },
            go = { "staticcheck" },
            css = { "stylelint" },
            scss = { "stylelint" },
            sql = { "sqlfluff" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            pattern = { "*.ts", "*.js", "*.php", "*.blade.php", "*.go", "*.lua", "*.sql", "*.scss" },
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>L", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
