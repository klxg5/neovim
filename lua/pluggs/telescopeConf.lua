local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local map = vim.api.nvim_set_keymap
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

		extensions = {
			fzf = {},
			project = {
				display_type = "full",
				base_dirs = {
					"~/code",
					"~/code/cw",
					"~/.config",
				},
			},
		},
	},
})

require("telescope").load_extension("project")
require("telescope").load_extension("fzf")

map("n", "<Leader>tf", ":Telescope find_files<CR>", opts)
map("n", "<Leader>tg", ":Telescope git_files<CR>", opts)
map("n", "<Leader>tz", ":Telescope fzf<CR>", opts)
map("n", "<Leader>tb", ":Telescope buffers<CR>", opts)
map("n", "<Leader>tr", ":Telescope registers<CR>", opts)
map("n", "<Leader>tp", ":Telescope project<CR>", opts)
map("n", "<Leader>th", ":Telescope help_tags<CR>", opts)
map("n", "<Leader>tk", ":Telescope keymap<CR>", opts)
map(
	"n",
	"<Leader>tv",
	"<cmd>lua require'telescope.builtin'.find_files({prompt_title = '< NeoVim >', cwd = '~/.config/nvim/'})<CR>",
	opts
)
