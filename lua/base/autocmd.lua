local api = vim.api

-- When plugins.lua is written(saved) source <afile> then run PackerSync
-- local packer_config = api.nvim_create_augroup("PackerConfig", { clear = true })
-- api.nvim_create_autocmd("BufWritePost", {
--     pattern = "plugins.lua",
--     command = "source <afile> | PackerSync",
--     group = packer_config
-- })

-- Highlight on yank
local yank_grp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yank_grp
})

-- Remove filetype from bufflist
local remove_buf_type = api.nvim_create_augroup("RemoveFromBuflist", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = { "qf" },
    command = "set nobuflisted",
    group = remove_buf_type
})

-- windows to close with "q"
local close_q = api.nvim_create_augroup("CloseQ", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = { "help", "startuptime", "qf", "zsh", "toggleterm", "fugitive", "aerial" },
    command = [[nnoremap <buffer><silent> q :close<CR>]],
    group = close_q
})
api.nvim_create_autocmd("FileType", {
    pattern = "man",
    command = [[nnoremap <buffer><silent> q :quit<CR>]],
    group = close_q
})

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd( { "InsertLeave", "WinEnter" }, {
    pattern = "*",
    command = "set cursorline",
    group = cursorGrp
})
api.nvim_create_autocmd( { "InsertEnter", "WinLeave" }, {
    pattern = "*",
    command = "set nocursorline",
    group = cursorGrp
})

-- When anything inside the qNotes has a buffer create the dirs first before save
local qNote_save = api.nvim_create_augroup("qNoteSave", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
    pattern = "~/.scratch/qNotes/**/*-q.md",
    command = "!mkdir -p /folder/you/want/",
    group = qNote_save
})

-- reset type of .env.local to .sh
local file_type_of_env_local = api.nvim_create_augroup("fileTypeOfEnvLocal", { clear = true })
api.nvim_create_autocmd("BufEnter", {
    pattern = {".env", ".env.*", "env.*"},
    command = "set filetype=sh",
    group = file_type_of_env_local
})

local auto_create_parent_dir = api.nvim_create_augroup("autoCreateParentDir", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "call mkdir(expand('<afile>:p:h'), 'p')",
    group = auto_create_parent_dir
})
