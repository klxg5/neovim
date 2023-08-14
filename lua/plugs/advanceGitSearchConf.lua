local status_ok, advanced_git_search = pcall(require, "advanced_git_search")
if not status_ok then
    return
end

advanced_git_search.setup({
    -- telescope_theme = {
    --     show_custom_functions = {
    --         layout_config = { width = 0.4, height = 0.4 },
    --     },
    --     diff_branch_file = {
    --         layout_config = { width = 0.8, height = 0.8 },
    --     },
    -- }
})
