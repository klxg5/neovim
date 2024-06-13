return {
    {
        "stevearc/oil.nvim",
        config = function()
            local oil = require("oil")
            local actions = require("oil.actions")

            local function open_cwd()
                actions.open_cwd.callback()
            end

            oil.setup({
                columns = {
                    "icon",
                },
                default_file_explorer = true,
                delete_to_trash = true,
                skip_confirm_for_simple_edits = true,
                view_options = {
                    show_hidden = true,
                    is_always_hidden = function(name, _)
                        return name == ".."
                    end,
                },
                win_options = {
                    wrap = true,
                },
                vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" }),
                vim.keymap.set("n", "_", open_cwd, { desc = "Open current working directory" }),
            })
        end,
    },
    {
        "chrishrb/gx.nvim",
        keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
        cmd = { "Browse" },
        init = function()
            vim.g.netrw_nogx = 1 -- disablew netrw gx
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
        submodules = false,
    },
}
