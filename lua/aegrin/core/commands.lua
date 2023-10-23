-- get to config commands!!
-- command! Zshrc :tabedit ~/.zshrc
-- command! Fishrc :tabedit ~/.config/fish/config.fish
-- command! FishPrompt :tabedit ~/.config/fish/functions/fish_prompt.fish
-- command! Nvimrc :tabedit ~/.config/nvim/init.vim
-- command! Alacritty :tabedit ~/.config/alacritty/alacritty.yml
-- command! NvimPlugs :tabedit ~/.config/nvim/conf/base/vim-plugs.vim
-- command! NvimKeys :tabedit ~/.config/nvim/conf/base/keybinds.vim
-- command! NvimCommands :tabedit ~/.config/nvim/conf/base/commands.vim
-- command! NvimSettings :tabedit ~/.config/nvim/conf/base/settings.vim
-- command! Homestead :tabedit ~/Homestead/Homestead.yaml

vim.cmd([[
  augroup lua_write
      au BufWritePost *.lua luafile %
  augroup END
]])

vim.cmd([[
  augroup vim_write
    au BufWritePost *.vim source %
  augroup END
]])

vim.cmd([[
  augroup misc
      au FileType * set formatoptions-=cro
  augroup END
]])

-- Issue with help buffer, need to target better
vim.cmd([[
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent loadview
augroup END
]])
