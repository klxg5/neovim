return {
    "folke/snacks.nvim",
    priority = 1000,
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "OilActionPost",
            callback = function(event)
                if event.data.actions.type == "move" then
                    Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
                end
            end,
        })
    end,
    opts = {
        bigfile = { enabled = true },
    }
}
