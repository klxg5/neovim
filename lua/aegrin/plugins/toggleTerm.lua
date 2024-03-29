return {
    "akinsho/toggleterm.nvim",
    config = function ()
        local toggleterm = require("toggleterm")

        toggleterm.setup({
            open_mapping = [[<c-enter>]],
            direction = 'float',
            float_opts = {
                border = 'curved'
            }
        })

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0, noremap = true, silent = true }
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd <CR>]], opts)
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
    end
}
