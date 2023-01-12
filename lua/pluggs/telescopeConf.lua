local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

-- local actions = require("telescope.actions")
local M = {}
local keymap = vim.keymap

telescope.setup({
    defaults = {
        prompt_prefix = "🔭 ",
        selection_caret = "★ ",
        color_devicons = true,
        path_display = {"tail"},
        layout_strategy = "vertical",
        sorting_strategy = "ascending",
        dynamic_preview_title = true,
        pickers = {
            find_files = {
                no_ignore = true,
            },
        },
        layout_config = {
            prompt_position = 'top',
            width = 0.85,
            height = 0.99,
            preview_height = 0.60,
            mirror = true,
        },
    },
    extensions = {
        fzf = {},
        repo = {
            list = {
                search_dirs = {
                    "~/code/cw",
                    "~/.config",
                }
            }
        },
        bookmarks = {
            selected_browser = "firefox",
            firefox_profile_name = "default-release",
            url_open_plugin = "open_browser",
        },
        aerial = {
            show_nesting = {
                ['_'] = false,
                json = true,
                yaml = true,
            }
        },
    },
})

M.project_files = function()
    -- local opts = {}
    vim.fm.system('git rev-parse --is-inside-work-tree')
    if vim.v.shell_error == 0 then
        require "telescope.builtin".git_files()
    else
        require "telescope.builtin".find_files()
    end
end


require("telescope").load_extension("repo")
require("telescope").load_extension("fzf")
require("telescope").load_extension("bookmarks")
require("telescope").load_extension("aerial")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("dap")
