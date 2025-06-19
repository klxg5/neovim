-- return {
--     "goolord/alpha-nvim",
--     dependencies = {
--         "nvim-tree/nvim-web-devicons",
--         "nvim-lua/plenary.nvim",
--     },
--     config = function()
--         require("alpha").setup(require("alpha.themes.theta").config)
--     end,
-- }
return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        local logo = [[
   _____                      .__        
  /  _  \   ____   ___________|__| ____  
 /  /_\  \_/ __ \ / ___\_  __ \  |/    \ 
/    |    \  ___// /_/  >  | \/  |   |  \
\____|__  /\___  >___  /|__|  |__|___|  /
        \/     \/_____/               \/ 

]]
        dashboard.section.header.val = vim.split(logo, "\n")
        dashboard.section.buttons.val = {
            dashboard.button("a", "󰑙 " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
            dashboard.button("s", "󱉯 " .. " Find session", "<cmd>Telescope session-lens<cr>"),
            dashboard.button("n", "󰠮 " .. " Notes", "<cmd>Neorg index<CR>"),
            dashboard.button(
                "r",
                "󰛔 " .. " Recent files",
                "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({prompt_title = '󰛔 Recent files',layout_strategy = 'bottom_pane'}))<cr>"
            ),
            dashboard.button(
                "f",
                " " .. " Find note",
                "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({prompt_title = '  Find note',cwd = '~/.scratch/telekasten/',layout_strategy = 'bottom_pane'}))<cr>"
            ),
            dashboard.button("c", "󰃭 " .. " Calender", "<cmd>Calendar<CR>"),
            dashboard.button("z", " " .. " Zoxide", "<cmd>Telescope zoxide list<cr>"),
            dashboard.button("l", "󰒲 " .. " Lazy", "<cmd>Lazy<CR>"),
            dashboard.button("q", " " .. " Quit", "<cmd>qa<CR>"),
        }
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.opts.layout[1].val = 6
        return dashboard
    end,

    config = function(_, dashboard)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                once = true,
                pattern = "AlphaReady",
                callback = function()
                    -- require("lazy").show()
                end,
            })
        end

        require("alpha").setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                -- Get the current date and time

                -- Get the current hour
                local current_hour = tonumber(os.date("%H"))

                -- Define the greeting variable
                local greeting

                if current_hour < 5 then
                    greeting = "    Good night!"
                elseif current_hour < 12 then
                    greeting = "  󰼰 Good morning!"
                elseif current_hour < 17 then
                    greeting = "    Good afternoon!"
                elseif current_hour < 20 then
                    greeting = "  󰖝  Good evening!"
                else
                    greeting = "  󰖔  Good night!"
                end

                dashboard.section.footer.val = greeting

                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
