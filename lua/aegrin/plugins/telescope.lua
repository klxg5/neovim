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
                pickers = {
                    find_files = {
                        hidden = true,
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
            telescope.load_extension("orgmode")

            -- Keymaps
            local opts = { noremap = true, silent = true }
            opts.desc = "Telescope find files"
            vim.keymap.set(
                "n",
                "<leader>p",
                "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy())<cr>",
                opts
            )
            opts.desc = "Telescope help files"
            vim.keymap.set(
                "n",
                "<F1>",
                "<cmd>lua require'telescope.builtin'.help_tags(require('telescope.themes').get_dropdown())<cr>",
                opts
            )
            opts.desc = "Telescope list buffers"
            vim.keymap.set(
                "n",
                "<leader>b",
                "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy())<cr>",
                opts
            )
            opts.desc = "Telescope live grep"
            vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep_args<cr>", opts)
            opts.desc = "Telescope find in buffer"
            vim.keymap.set(
                "n",
                "<leader>/",
                "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_ivy())<cr>",
                opts
            )
            opts.desc = "Telescope show command history"
            vim.keymap.set("n", "q:", "<cmd>lua require'telescope.builtin'.command_history()<cr>", opts)
            opts.desc = "Telescope show git branches"
            vim.keymap.set("n", "<leader>g", "<cmd>Telescope advanced_git_search diff_branch_file<cr>", opts)
            opts.desc = "Telescope zoxide change directory"
            vim.keymap.set("n", "<leader>zx", "<cmd>lua require'telescope'.extensions.zoxide.list()<cr>", opts)

            opts.desc = "Telescope select OrgFile"
            vim.keymap.set(
                "n",
                "<leader>og",
                "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({prompt_title = '🦄 OrgFiles ',cwd = '~/.scratch/orgfiles/',previewer = false,layout_strategy = 'center'}))<cr>",
                opts
            )
            opts.desc = "Telescope select NeoVim file"
            vim.keymap.set(
                "n",
                "<leader>nv",
                "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({prompt_title = ' NeoVim ',cwd = '~/.config/nvim/',previewer = false,layout_strategy = 'center'}))<cr>",
                opts
            )
            opts.desc = "Telescope select from scratch"
            vim.keymap.set(
                "n",
                "<leader>ns",
                "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({prompt_title = ' Scratch ',cwd = '~/.scratch/',previewer = false,layout_strategy = 'center'}))<cr>",
                opts
            )
            opts.desc = "Telescope select symbols in buffer"
            vim.keymap.set(
                "n",
                "<leader>s",
                "<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_dropdown({prompt_title = ' Symbols ',previewer = true,layout_strategy = 'center'}))<cr>",
                opts
            )
            opts.desc = "Telescope select symbols in project"
            vim.keymap.set(
                "n",
                "<leader>S",
                "<cmd>lua require'telescope.builtin'.lsp_dynamic_workspace_symbols(require('telescope.themes').get_dropdown({prompt_title = ' Project Symbols ',previewer = true,layout_strategy = 'center'}))<cr>",
                opts
            )
            opts.desc = "Telescope outline select"
            vim.keymap.set(
                "n",
                "<leader>o",
                "<cmd>lua require'telescope'.extensions.aerial.aerial(require('telescope.themes').get_dropdown({prompt_title = ' Outline ',previewer = false,layout_strategy = 'center'}))<cr>",
                opts
            )
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        config = function()
            local harpoon = require("harpoon")
            local opts = { noremap = true, silent = true }
            harpoon.setup({})

            opts.desc = "Harpoon add file"
            vim.keymap.set("n", "<leader>hh", function()
                harpoon:list():add()
            end, opts)
            opts.desc = "Harpoon menu"
            vim.keymap.set("n", "<C-h>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, opts)
            opts.desc = "Harpoon first file"
            vim.keymap.set("n", "<C-h>1", function()
                harpoon:list():select(1)
            end, opts)
            opts.desc = "Harpoon second file"
            vim.keymap.set("n", "<C-h>2", function()
                harpoon:list():select(2)
            end, opts)
            opts.desc = "Harpoon third file"
            vim.keymap.set("n", "<C-h>3", function()
                harpoon:list():select(3)
            end, opts)
            opts.desc = "Harpoon next file"
            vim.keymap.set("n", "<C-h>n", function()
                harpoon:list():next()
            end, opts)
            opts.desc = "Harpoon prev file"
            vim.keymap.set("n", "<C-h>N", function()
                harpoon:list():prev()
            end, opts)
        end,
    },
}
