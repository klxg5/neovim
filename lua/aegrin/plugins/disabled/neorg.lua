return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/.scratch/neorg/notes"
                        },
                        default_workspace = 'notes',
                    },
                },
                ["core.summary"] = {
                    config = {
                        strategy = "default",
                    }
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                        name = '[Neorg]',
                    }
                },
                ["core.export"] = {},
                ["core.export.markdown"] = {},
                ["core.keybinds"] = {
                    config = {
                        default_keybinds = true;
                    }
                }
            },
        }

    end,
}
