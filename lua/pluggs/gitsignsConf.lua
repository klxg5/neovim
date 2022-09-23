local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
    return
end

gitsigns.setup {
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = 'ﬢ', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    word_diff = false,
    signcolumn = true,
    numhl = true,
    linehl = false,
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter_opts = {
      relative_time = true
    },
    keymaps = {
        noremap = true,
        ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
        ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},
        ['n <leader>gss'] = '<cmd>Gitsigns stage_hunk<CR>',
        ['v <leader>gss'] = ':Gitsigns stage_hunk<CR>',
        ['n <leader>gsS'] = '<cmd>Gitsigns stage_buffer<CR>',
        ['n <leader>gsu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
        ['n <leader>gsr'] = '<cmd>Gitsigns reset_hunk<CR>',
        ['v <leader>gsr'] = ':Gitsigns reset_hunk<CR>',
        ['n <leader>gsR'] = '<cmd>Gitsigns reset_buffer<CR>',
        ['n <leader>gsp'] = '<cmd>Gitsigns preview_hunk<CR>',
        ['n <leader>gsb'] = '<cmd>Gitsigns blame_line<CR>',
        ['n <leader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',
    }
}
