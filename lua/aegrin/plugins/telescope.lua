return {
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "aaronhallaert/advanced-git-search.nvim",
    "jvgrootveld/telescope-zoxide",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local lga_actions = require("telescope-live-grep-args.actions")

            telescope.setup({
                defaults = {
                    prompt_prefix = "  ",
                    selection_caret = " ",
                    multi_icon = " ",
                    color_devicons = true,
                    path_display = { "shorten" },
                    dynamic_preview_title = true,
                    border = true,
                    cache_picker = {
                        num_pickers = -1,
                        limit_entries = 1000,
                    },
                    layout_strategy = "horizontal",
                    sorting_strategy = "ascending",
                    layout_config = {
                        prompt_position = "top",
                    },
                    mappings = {
                        i = {
                            ["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                        n = {
                            ["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
                        },
                    },
                },

                extensions = {
                    -- file_browser = {},
                    advanced_git_search = {
                        entry_default_author_or_date = "date",
                    },
                    live_grep_args = {
                        auto_quoting = true,
                        theme = "ivy",
                        mappings = { -- extend mappings
                            i = {
                                ["<C-'>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                            },
                            n = {
                                ["<C-'>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                            },
                        },
                    },
                    media_files = {
                        find_cmd = "rg",
                    },
                    zoxide = {
                        prompt_title = "Zoxide",
                    },
                },
            })

            telescope.load_extension("live_grep_args")
            telescope.load_extension("advanced_git_search")
            telescope.load_extension("media_files")
            telescope.load_extension("zoxide")

            -- Keymaps
            vim.keymap.set(
                "n",
                "<leader>p",
                "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy())<cr>",
                Opts
            )
            vim.keymap.set(
                "n",
                "<F1>",
                "<cmd>lua require'telescope.builtin'.help_tags(require('telescope.themes').get_dropdown())<cr>",
                Opts
            )
            vim.keymap.set(
                "n",
                "<leader>b",
                "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy())<cr>",
                Opts
            )
            vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep_args<cr>", Opts)
            vim.keymap.set("n", "<leader>ep", function()
                require("telescope.builtin").find_files({
                    cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
                })
            end)
            vim.keymap.set(
                "n",
                "<leader>/",
                "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_ivy())<cr>",
                Opts
            )
            vim.keymap.set("n", "q:", "<cmd>lua require'telescope.builtin'.command_history()<cr>", Opts)
            vim.keymap.set("n", "<leader>g", "<cmd>Telescope advanced_git_search diff_branch_file<cr>", Opts)
            vim.keymap.set("n", "<leader>T", "<cmd>lua require'telescope.builtin'.builtin()<cr>", Opts)
            vim.keymap.set("n", "<leader>t", "<cmd>lua require'telescope.builtin'.resume()<cr>", Opts)
            vim.keymap.set("n", "<leader>tp", "<cmd>lua require'telescope.builtin'.pickers()<cr>", Opts)
            vim.keymap.set("n", "<leader>zx", "<cmd>lua require'telescope'.extensions.zoxide.list()<cr>", Opts)
            -- vim.keymap.set("n", "<leader>cd", t.extensions.zoxide.list)

            vim.keymap.set(
                "n",
                "<leader>qmk",
                "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({prompt_title = ' QMK ',cwd = '~/qmk_firmware/keyboards/crkbd/keymaps/klxg5/',previewer = false,layout_strategy = 'center'}))<cr>",
                Opts
            )
            vim.keymap.set(
                "n",
                "<leader>nv",
                "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({prompt_title = ' NeoVim ',cwd = '~/.config/nvim/',previewer = false,layout_strategy = 'center'}))<cr>",
                Opts
            )
            vim.keymap.set(
                "n",
                "<leader>ns",
                "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({prompt_title = ' Scratch ',cwd = '~/.scratch/',previewer = false,layout_strategy = 'center'}))<cr>",
                Opts
            )
            vim.keymap.set(
                "n",
                "<leader>s",
                "<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_dropdown({prompt_title = ' Symbols ',previewer = true,layout_strategy = 'center'}))<cr>",
                Opts
            )
            vim.keymap.set(
                "n",
                "<leader>S",
                "<cmd>lua require'telescope.builtin'.lsp_dynamic_workspace_symbols(require('telescope.themes').get_dropdown({prompt_title = ' Project Symbols ',previewer = true,layout_strategy = 'center'}))<cr>",
                Opts
            )
            vim.keymap.set(
                "n",
                "<leader>o",
                "<cmd>lua require'telescope'.extensions.aerial.aerial(require('telescope.themes').get_dropdown({prompt_title = ' Outline ',previewer = false,layout_strategy = 'center'}))<cr>",
                Opts
            )
            -- vim.keymap.set(
            --     "n",
            --     "<leader>aw",
            --     "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({prompt_title = '󰣇 ArchWiki ',cwd = '/usr/share/doc/arch-wiki/text/',previewer = false,layout_strategy = 'center'}))<cr>",
            --     Opts
            -- )
        end,
    },
    {
        "ThePrimeagen/harpoon",
        config = function()
            local harpoon = require("harpoon")
            harpoon.setup({
                --
            })
        end,

        vim.keymap.set("n", "<leader>h", "<cmd>lua require'harpoon.mark'.add_file()<cr>", Opts),
        vim.keymap.set("n", "<leader>H", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>", Opts),
        vim.keymap.set("n", "<leader>hn", "<cmd>lua require'harpoon.ui'.nav_next()<cr>", Opts),
        vim.keymap.set("n", "<leader>hp", "<cmd>lua require'harpoon.ui'.nav_prev()<cr>", Opts),
    },
}
