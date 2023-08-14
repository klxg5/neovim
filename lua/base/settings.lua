-- :help options
local set = vim.opt
local seo = vim.o

set.backup = false
set.clipboard = "unnamedplus"
set.cmdheight = 2
set.completeopt = { "menuone", "noselect" }
set.conceallevel = 0
set.fileencoding = "utf-8"
set.hlsearch = true
set.ignorecase = true
set.mouse = "a"
set.pumheight = 10
set.showmode = false
set.showtabline = 2
set.smartcase = true
set.smartindent = true
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.termguicolors = true
set.timeoutlen = 300
set.undofile = true
set.updatetime = 300
set.writebackup = false
set.expandtab = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.cursorline = true
set.autoindent = true
set.copyindent = true
set.number = true
set.relativenumber = false
set.numberwidth = 4
set.signcolumn = "yes"
set.wrap = false
set.scrolloff = 1
set.sidescrolloff = 2
set.laststatus = 3

--TODO: see if we can change these to set instead of seo
seo.foldcolumn = "1" -- '0' is not bad
seo.foldenable = true
seo.confirm = true
 
set.list = true
set.showbreak = "⤷  "
-- set.listchars = { lead = "―", tab = " ", extends = "⇶", precedes = "⬱", nbsp = "░", trail = "░", space = "·", eol = "⤶" }
set.listchars = { tab = " ", extends = "⇶", precedes = "⬱", nbsp = "░", trail = "░", space = "·" }
set.fillchars = { fold = "·", foldopen = "", foldclose = "", foldsep = "" }

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd("set whichwrap+=<,>,[,]")
