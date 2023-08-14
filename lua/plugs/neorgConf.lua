local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
    return
end

neorg.setup ({
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.completion"] = {
            config = {
                engine = 'nvim-cmp',
                name = '[Neorg]'
            }
        },
        ["core.summary"] = {},
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                default_workspace = 'work',
                workspaces = {
                    work = "~/.scratch/neorg/work",
                    notes = "~/.scratch/neorg/notes",
                },
            }
        }
    }
})
