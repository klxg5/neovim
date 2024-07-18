return {
    "goolord/alpha-nvim",
    dependancies = { "nvim-tree/nvim-web-dev" },
    config = function()
        local alpha = require("aegrin.plugins.alphaStartify")
        local startify = require("alpha.themes.startify")
        startify.section.header.val = {
            [[ ▄▄▄      ▓█████   ▄████  ██▀███   ██▓ ███▄    █ ]],
            [[▒████▄    ▓█   ▀  ██▒ ▀█▒▓██ ▒ ██▒▓██▒ ██ ▀█   █ ]],
            [[▒██  ▀█▄  ▒███   ▒██░▄▄▄░▓██ ░▄█ ▒▒██▒▓██  ▀█ ██▒]],
            [[░██▄▄▄▄██ ▒▓█  ▄ ░▓█  ██▓▒██▀▀█▄  ░██░▓██▒  ▐▌██▒]],
            [[ ▓█   ▓██▒░▒████▒░▒▓███▀▒░██▓ ▒██▒░██░▒██░   ▓██░]],
            [[ ▒▒   ▓▒█░░░ ▒░ ░ ░▒   ▒ ░ ▒▓ ░▒▓░░▓  ░ ▒░   ▒ ▒ ]],
            [[  ▒   ▒▒ ░ ░ ░  ░  ░   ░   ░▒ ░ ▒░ ▒ ░░ ░░   ░ ▒░]],
            [[  ░   ▒      ░   ░ ░   ░   ░░   ░  ▒ ░   ░   ░ ░ ]],
            [[      ░  ░   ░  ░      ░    ░      ░           ░ ]],
        }

        startify.section.top_buttons.val = {
            startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            startify.button("a", "code", ":e ~/code<CR>"),
            startify.button("n", "  NeoVim", "<leader>nv"),
            startify.button("s", "󱞁  Scratch", "<leader>ns"),
        }
        startify.section.bottom_buttons.val = {
            startify.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
        }

        alpha.setup(startify.config)
    end,
}
