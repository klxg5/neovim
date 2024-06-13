-- :help options
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.cursorline = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 5
vim.opt.laststatus = 3
vim.opt.wrapscan = false

-- vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldenable = true
vim.o.confirm = true

vim.opt.list = true
vim.opt.showbreak = "⤷  "
-- vim.opt.listchars = { lead = "―", tab = " ", extends = "⇶", precedes = "⬱", nbsp = "░", trail = "░", space = "·", eol = "⤶" }
vim.opt.listchars = { tab = "󰞔 ", extends = "⇶", precedes = "⬱", nbsp = "░", trail = "░", space = "·" }
-- vim.opt.fillchars = { fold = "·", foldopen = "", foldclose = "󰉋" }

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd("set whichwrap+=<,>,[,]")
