-- local w = vim.loop.new_fs_event()
-- function watch_file(fname)
--   local fullpath = vim.api.nvim_call_function(
--     'fnamemodify', {fname, ':p'})
--   w:start(fullpath, {}, vim.schedule_wrap(function(...)
--     on_change(...) end))
-- end
-- vim.api.nvim_command(
--   "command! -nargs=1 Watch call luaeval('watch_file(_A)', expand('<args>'))")

-- function! CSVH(colnr)
--   if a:colnr > 1
--     let n = a:colnr - 1
--     execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
--     execute 'normal! 0'.n.'f,'
--   elseif a:colnr == 1
--     match Keyword /^[^,]*/
--     normal! 0
--   else
--     match
--   endif
-- endfunction

-- local function csvh(colnr)
--   if colnr > 1 then
--     local n = colnr - 1
--     --
--   elseif colnr == 1 then
--     --
--   else
--     --
--   end
-- end
-- vim.api.nvim_command(
--   "command! -nargs=1 Csv :call csvh('<args>')")

function _G.set_terminal_keymaps()
    local opts = { buffer = 0, noremap = true, silent = true }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd <CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
