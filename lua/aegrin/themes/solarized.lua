local scolors = require'solarized.colors'
vim.o.background = "light"
vim.cmd("colorscheme solarized")
vim.g.solarized_contrast = true
vim.g.solarized_borders = true
vim.api.nvim_set_hl(0,'NonText',{fg="#eee8d5"})
vim.api.nvim_set_hl(0,'CursorLine',{bg="#d3cfc1"})
