return {
    "stevearc/overseer.nvim",
    config = function()
        local overseer = require("overseer")
        local snacks = require("snacks")
        local artisan_history = {}

        overseer.setup({ direction = "bottom" })

        local function run_artisan()
            vim.ui.input({
                prompt = "Artisan Command: ",
                default = "php artisan ",
                completion = "command",
            }, function(cmd)
                if cmd and cmd ~= "" then
                    -- Add to history if not already present
                    if not vim.tbl_contains(artisan_history, cmd) then
                        table.insert(artisan_history, 1, cmd)
                    end

                    overseer
                        .new_task({
                            name = cmd,
                            cmd = cmd,
                            strategy = "toggleterm", -- options: toggleterm, job, terminal
                        })
                        :start()
                end
            end)
        end

        -- Map to <leader>a
        vim.keymap.set("n", "<leader>al", run_artisan, { noremap = true, silent = true })
    end,
}
