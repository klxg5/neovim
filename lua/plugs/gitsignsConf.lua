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
    current_line_blame = true,
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
        ['n gsn'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
        ['n gsN'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},
        ['n gss'] = '<cmd>Gitsigns stage_hunk<CR>',
        ['n gsS'] = '<cmd>Gitsigns stage_buffer<CR>',
        ['n gsu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
        ['n gsr'] = '<cmd>Gitsigns reset_hunk<CR>',
        ['n gsR'] = '<cmd>Gitsigns reset_buffer<CR>',
        ['n gsp'] = '<cmd>Gitsigns preview_hunk<CR>',
        ['n gsb'] = '<cmd>Gitsigns blame_line<CR>',
        ['n gsi'] = '<cmd>Gitsigns reset_buffer_index<CR>',
    }
}
