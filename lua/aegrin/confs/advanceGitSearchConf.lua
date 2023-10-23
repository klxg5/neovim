local status_ok, advanced_git_search = pcall(require, "advanced_git_search")
if not status_ok then
    return
end

advanced_git_search.setup({
    -- show_builtin_git_pickers = true,
    entry_default_author_or_date = "date",
    telescope_theme = {
        show_custom_functions = "ivy",
        diff_branch_file = "ivy",
    }
})
