local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

telescope.setup({
    defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        multi_icon = " ",
        color_devicons = true,
        path_display = { "shorten" },
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        dynamic_preview_title = true,
        border = true,
        borderchars = { "", "│", "", "│", "", "", "", "" },
        layout_config = {
            prompt_position = 'top',
            -- width = 0.85,
            -- height = 0.99,
            -- preview_height = 0.60,
            -- mirror = true,
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
        file_browser = {},
    },
})

-- load extensions
require("telescope").load_extension("repo")
require("telescope").load_extension("fzf")
require("telescope").load_extension("bookmarks")
require("telescope").load_extension("aerial")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("dap")
require("telescope").load_extension("file_browser")

-- Keymaps
keymap.set("n", "<leader>p", "<cmd>lua require'telescope.builtin'.find_files()<cr>"
    , opts)
keymap.set("n", "<leader><S-p>", "<cmd>Telescope repo<cr>", opts)
keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<cr>", opts)
keymap.set("n", "<leader>fa", "<cmd>Telescope live_grep_args<cr>", opts)
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap.set("n", "<leader>nv", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({prompt_title = ' NeoVim ',cwd = '~/.config/nvim/',previewer = false,layout_strategy = 'center'}))<cr>", opts)
keymap.set('n', "<leader>e", "<cmd>lua require'telescope'.extensions.file_browser.file_browser()<cr>", opts)
keymap.set('n', "<F1>", "<cmd>lua require'telescope.builtin'.help_tags(require('telescope.themes').get_dropdown())<cr>", opts)

