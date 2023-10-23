local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
    return
end

nightfox.setup({
    transparent = vim.g.transparent_enabled,
})

vim.cmd("colorscheme nordfox")
