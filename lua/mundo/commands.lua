" get to config commands!!
command! Zshrc :tabedit ~/.zshrc
command! Fishrc :tabedit ~/.config/fish/config.fish
command! FishPrompt :tabedit ~/.config/fish/functions/fish_prompt.fish
command! Nvimrc :tabedit ~/.config/nvim/init.vim
command! Alacritty :tabedit ~/.config/alacritty/alacritty.yml
command! NvimPlugs :tabedit ~/.config/nvim/conf/base/vim-plugs.vim
command! NvimKeys :tabedit ~/.config/nvim/conf/base/keybinds.vim
command! NvimCommands :tabedit ~/.config/nvim/conf/base/commands.vim
command! NvimSettings :tabedit ~/.config/nvim/conf/base/settings.vim
command! Homestead :tabedit ~/Homestead/Homestead.yaml

augroup lua_write
    " automatically source lua files
    au BufWritePost *.lua luafile %
augroup END

augroup vim_write
    " automatically source vim files
    au BufWritePost *.vim source %
augroup END

augroup misc
    au FileType * set formatoptions-=cro
augroup END

" Issue with help buffer, need to target better
" augroup AutoSaveFolds
"     autocmd!
"     autocmd BufWinLeave * mkview
"     autocmd BufWinEnter * silent loadview
" augroup END
