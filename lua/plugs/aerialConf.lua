local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
    return
end

local keymap = vim.keymap

aerial.setup({
    filter_kind = false,
    default_direction = 'prefer_right',
})

keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
