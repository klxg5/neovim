return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function ()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            ensure_installed = {
                "php",
                "phpdoc",
                "javascript",
                "typescript",
                "html",
                "markdown",
                "markdown_inline",
                "c_sharp",
                "lua",
                "json",
                "tsx",
                "yaml",
                "css",
                "scss",
                "markdown",
                "markdown_inline",
                "vim",
                "dockerfile",
                "gitignore",
                "git_config",
                "git_rebase",
                "bash",
                "twig",
                "toml",
                "ssh_config",
                "sql",
                "norg",
                "fish",
                "diff",
                "csv",
            },
            sync_install = true,
            highlight = {
                enable = true,
                disable = { "" },
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
                disable = { "" },
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-Space>",
                    node_incremental = "<C-Space>",
                    scope_incremental = false,
                    node_decremental = "<C-BS>",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["a="] = { query = "@assignment.outer", desc = "Select outer parts of an assignment" },
                        ["i="] = { query = "@assignment.inner", desc = "Select inner parts of an assignment" },
                        ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                        ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

                        ["aa"] = { query = "@parameter.outer", desc = "Select outer parts of a parameter/argument" },
                        ["ia"] = { query = "@parameter.inner", desc = "Select inner parts of a parameter/argument" },

                        ["ai"] = { query = "@conditional.outer", desc = "Select outer parts of a conditional" },
                        ["ii"] = { query = "@conditional.inner", desc = "Select inner parts of a conditional" },

                        ["al"] = { query = "@loop.outer", desc = "Select outer parts of a loop" },
                        ["il"] = { query = "@loop.inner", desc = "Select inner parts of a loop" },

                        ["at"] = { query = "@comment.outer", desc = "Select outer parts of a comment" },
                        ["it"] = { query = "@comment.inner", desc = "Select inner parts of a comment" },

                        ["ab"] = { query = "@block.outer", desc = "Select outer parts of a block" },
                        ["ib"] = { query = "@block.inner", desc = "Select inner parts of a block" },

                        ["af"] = { query = "@call.outer", desc = "Select outer parts of a function call" },
                        ["if"] = { query = "@call.inner", desc = "Select inner parts of a function call" },

                        ["am"] = { query = "@function.outer", desc = "Select outer parts of a method/function definition" },
                        ["im"] = { query = "@function.inner", desc = "Select inner parts of a method/function definition" },

                        ["ac"] = { query = "@class.outer", desc = "Select outer parts of a class" },
                        ["ic"] = { query = "@class.inner", desc = "Select inner parts of a class" },
                    }
                }
            }
        })
    end;
}
