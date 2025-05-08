return {
    "nvim-orgmode/orgmode",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-orgmode/telescope-orgmode.nvim",
        "nvim-orgmode/org-bullets.nvim",
        "danilshvalov/org-modern.nvim",
    },
    event = "VeryLazy",
    ft = { "org" },
    config = function()
        local Menu = require("org-modern.menu")
        require("org-bullets").setup()
        require("orgmode").setup({
            org_agenda_files = "~/.scratch/orgfiles/**/*",
            org_default_notes_file = "~/.scratch/orgfiles/inbox.org",
            -- win_split_mode = "float",
            org_capture_templates = {
                t = {
                    description = "Tasks",
                    template = "** TODO %?",
                    target = "~/.scratch/orgfiles/capture/TODO.org",
                },
                c = {
                    description = "Code Note",
                    template = "** %a\n%?",
                    target = "~/.scratch/orgfiles/capture/codeNotes.org",
                },
                d = {
                    description = "Brain Dump",
                    template = "** %t\n%?",
                    target = "~/.scratch/orgfiles/capture/brainDump.org",
                },
                u = {
                    description = "Urls",
                    template = "** %x\n%?",
                    target = "~/.scratch/orgfiles/capture/urls.org",
                },
            },
            ui = {
                menu = {
                    handler = function(data)
                        Menu:new({
                            window = {
                                margin = { 1, 0, 1, 0 },
                                padding = { 0, 1, 0, 1 },
                                title_pos = "center",
                                border = "single",
                                zindex = 1000,
                            },
                            icons = {
                                separator = "⤚",
                            },
                        }):open(data)
                    end,
                },
            },
            mappings = {
                prefix = "<leader>l",
                global = {
                    -- org_agenda = "la",
                    -- org_capture = "lc",
                },
            },
        })
        local opts = { noremap = true, silent = true }

        opts.desc = "Orgmode Agenda"
        vim.keymap.set("n", "<leader>la", "<cmd>Org agenda<cr>", opts)
        opts.desc = "Orgmode Capture"
        vim.keymap.set("n", "<leader>lc", "<cmd>Org capture<cr>", opts)
    end,
}
