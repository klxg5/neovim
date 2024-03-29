local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

telescope.setup({
    defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        multi_icon = " ",
        color_devicons = true,
        path_display = { "shorten" },
        dynamic_preview_title = true,
        border = true,
        cache_picker = {
            num_pickers = -1,
            limit_entries = 1000,
        },
        -- borderchars = { "ﮆ", "│", "―", "│", "", "", "", "" },
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
            -- preview_width = 0.65,
            -- width = 0.85,
            -- height = 0.99,
            -- preview_height = 0.60,
            -- mirror = true,
        },
        mappings = {
            i = {
                ['<C-q>'] = actions.smart_add_to_qflist + actions.open_qflist,
            },
            n = {
                ['<C-q>'] = actions.smart_add_to_qflist + actions.open_qflist,
            }
        },
    },

    extensions = {
        fzf = {},
        file_browser = {},
        live_grep_args = {
            auto_quoting = true,
            theme = "ivy",
            mappings = { -- extend mappings
                i = {
                  ["<C-'>"] = lga_actions.quote_prompt({ postfix = ' --iglob '}),
                },
                n = {
                  ["<C-'>"] = lga_actions.quote_prompt({ postfix = ' --iglob '}),
                },
            },
        },
    },
})

-- load extensions
require("telescope").load_extension("fzf")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("dap")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("advanced_git_search")

-- Keymaps
keymap.set("n", "<leader>p", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy())<cr>", opts)
keymap.set("n", "<F1>", "<cmd>lua require'telescope.builtin'.help_tags(require('telescope.themes').get_dropdown())<cr>", opts)
keymap.set("n", "<leader>b", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy())<cr>", opts)
keymap.set("n", "<leader>e", "<cmd>lua require'telescope'.extensions.file_browser.file_browser()<cr>", opts)
keymap.set("n", "<leader>f", "<cmd>Telescope live_grep_args<cr>", opts)
keymap.set("n", "<leader>/", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_ivy())<cr>", opts)
keymap.set("n", "<leader>g", "<cmd>Telescope advanced_git_search diff_branch_file<cr>", opts)
keymap.set(
    "n",
    "<leader>nv",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({prompt_title = ' NeoVim ',cwd = '~/.config/nvim/',previewer = false,layout_strategy = 'center'}))<cr>",
    opts
)
keymap.set(
    "n",
    "<leader>s",
    "<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_dropdown({prompt_title = ' Symbols ',previewer = true,layout_strategy = 'center'}))<cr>",
    opts
)
keymap.set(
    "n",
    "<leader>S",
    "<cmd>lua require'telescope.builtin'.lsp_dynamic_workspace_symbols(require('telescope.themes').get_dropdown({prompt_title = ' Project Symbols ',previewer = true,layout_strategy = 'center'}))<cr>",
    opts
)
-- keymap.set(
--     "n",
--     "<leader>o",
--     "<cmd>lua require'telescope'.extensions.aerial.aerial(require('telescope.themes').get_dropdown({prompt_title = ' Outline ',previewer = false,layout_strategy = 'center'}))<cr>",
--     opts
-- )
