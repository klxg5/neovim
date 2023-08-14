local status_ok, configs = pcall(require, "zen-mode")
if not status_ok then
    return
end

configs.setup({
    window = {
        width = 0.75,
    }
})
