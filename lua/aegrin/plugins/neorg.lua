return {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = "disabled",
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/.scratch/neorg/notes",
                        },
                        default_workspace = "notes",
                    },
                },
            },
        })

        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
    end,
}
