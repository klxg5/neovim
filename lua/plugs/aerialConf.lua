local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
    return
end

local keymap = vim.keymap

aerial.setup({
})

keymap.set("n", "<leader>A", "<cmd>AerialToggle!<CR>")
