local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    return
end

saga.setup({

})
-- saga.init_lsp_saga({
--     move_in_saga = { prev = "<C-k>", next = "<C-j>"},
--     finder_action_keys = {
--         open = "<CR>",
--         quit = {'q','<ESC>'},
--     },
--     definition_action_keys = {
--         edit = "<CR>",
--         quit = {'q','<ESC>'},
--     },
--     code_action_keys = {
--         quit = {'q','<ESC>'},
--     }
-- })
