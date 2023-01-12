local status_ok, FTerm = pcall(require, 'FTerm')
if not status_ok then
    return
end

FTerm.setup({
    border = 'solid',
    dimensions  = {
        height = 0.6,
        width = 0.6,
    },
})

