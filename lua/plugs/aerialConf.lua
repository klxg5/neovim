local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
	return
end

local keymap = vim.keymap

aerial.setup({
    on_attach = function(bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
        keymap.set('n', '{', '<cmd>AerialPrev<CR>', opts)
        keymap.set('n', '}', '<cmd>AerialNext<CR>', opts)
    end
})

keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
