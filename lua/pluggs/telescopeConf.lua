local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

-- local actions = require("telescope.actions")
local M = {}
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

telescope.setup({
	defaults = {
		prompt_prefix = "🔭 ",
		selection_caret = "★ ",
		color_devicons = true,
		path_display = { "smart" },

		mappings = {},

		pickers = {
			find_files = {
				no_ignore = true,
			},
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
        require"telescope.builtin".git_files()
    else
        require"telescope.builtin".find_files()
    end
end


require("telescope").load_extension("repo")
require("telescope").load_extension("fzf")
-- require("telescope").load_extension("zf-native")
require("telescope").load_extension("bookmarks")
require("telescope").load_extension("aerial")

keymap.set("n", "<Leader>tf", ":Telescope find_files<CR>", opts)
keymap.set("n", "<Leader>tg", ":Telescope live_grep<CR>", opts)
keymap.set("n", "<Leader>tz", ":Telescope fzf<CR>", opts)
keymap.set("n", "<Leader>tb", ":Telescope buffers<CR>", opts)
keymap.set("n", "<Leader>tr", ":Telescope registers<CR>", opts)
keymap.set("n", "<Leader>tp", ":Telescope repo list<CR>", opts)
keymap.set("n", "<Leader>th", ":Telescope help_tags<CR>", opts)
keymap.set("n", "<Leader>tk", ":Telescope keymap<CR>", opts)
keymap.set("n", "<Leader>tv", "<cmd>lua require'telescope.builtin'.find_files({prompt_title = '< NeoVim >', cwd = '~/.config/nvim/'})<CR>", opts)
