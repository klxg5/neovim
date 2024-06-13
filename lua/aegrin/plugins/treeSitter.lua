return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/playground",
    }, config = function ()
        local treesitter = require("nvim-treesitter.configs")
        local tscontext = require("treesitter-context")
        -- start blade intergration
        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = {"src/parser.c"},
                branch = "main",
            },
            filetype = "blade"
        }
        -- end blade intergration
        treesitter.setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "blade",
                "php",
                "typescript",
                "javascript",
                "html",
                "css",
                "scss",
                "toml",
                "markdown",
                "markdown_inline",
                "yaml",
                "dockerfile",
                "sql",
                "vue",
                "xml",
                "json",
            },
            -- automatically install parsers when entering buffer
            auto_install = true,
            -- Install parsers syncronously for items in 'ensure_installed'
            sync_install = false,
            -- allows highlighting
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            -- allows indents
            indent = {
                enable = true,
                disable = { "" },
            },
            -- allows you to increse or decrease whats currently selected
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-Space>",
                    node_incremental = "<C-Space>",
                    scope_incremental = false,
                    node_decremental = "<C-BS>",
                },
            },
            -- allows new "motions" such as da= or ya= or ca=
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
        tscontext.setup{
            enable = true,
            mode = 'topline',
        }
    end;
}
