return {
    "nvim-orgmode/orgmode",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-orgmode/telescope-orgmode.nvim",
        "nvim-orgmode/org-bullets.nvim",
        "Saghen/blink.cmp",
    },
    event = "VeryLazy",
    ft = { "org" },
    config = function()
        require("orgmode").setup({
            org_agenda_files = "~/.scratch/orgfiles/**/*",
            org_default_notes_file = "~/.scratch/orgfiles/refile.org",
        })
        require("org-bullets").setup()
        require("blink.cmp").setup({
            sources = {
                per_filetype = {
                    org = { "orgmode" },
                },
                providers = {
                    orgmode = {
                        name = "Orgmode",
                        module = "orgmode.org.autocompletion.blink",
                        fallbacks = { "buffer" },
                    },
                },
            },
        })
    end,
}
