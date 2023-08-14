local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
    return
end

obsidian.setup({
    dir = "~/.scratch/obsidian/work",
    daily_notes = {
        folder = "daily",
    },
    completion = {
        nvim_cmp = true,
    },
    mappings = {
        ["gf"] = require("obsidian.mapping").gf_passthrough(),
    },
    open_notes_in = "vsplit"

})
