local status_ok, configs = pcall(require, "twilight")
if not status_ok then
    return
end

configs.setup({
    context = 15
})
