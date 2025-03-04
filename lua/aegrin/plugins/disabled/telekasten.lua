return {
    {
        "nvim-telekasten/telekasten.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telekasten").setup({
                home = vim.fn.expand("~/.scratch/telekasten"),
                dailies = vim.fn.expand("~/.scratch/telekasten/dailies"),
                weeklies = vim.fn.expand("~/.scratch/telekasten/weeklies"),
                templates = vim.fn.expand("~/.scratch/telekasten/templates"),
                template_new_note = vim.fn.expand("~/.scratch/telekasten/templates/new_note.md"), -- template for new notes
                template_new_daily = vim.fn.expand("~/.scratch/telekasten/templates/new_daily.md"), -- template for new daily notes
                template_new_weekly = vim.fn.expand("~/.scratch/telekasten/templates/new_weekly.md"), -- template for new weekly notes
                calendar_monday = 0,
            })
        end,
    },
    {
        "nvim-telekasten/calendar-vim",
    },
    {
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow",
    },
}
