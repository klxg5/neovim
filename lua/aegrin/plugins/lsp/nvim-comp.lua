return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        lspkind.init({
            symbol_map = {
                -- Copilot = "",
            },
        })

        -- load friendly-snippets
        require("luasnip/loaders/from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noinsert,noselect",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                -- ["<C-l>"] = cmp.mapping.complete(),
                ["<ESC>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),
                ["<Tab>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback()
                    end
                end,
                ["<S-Tab>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback()
                    end
                end,
            }),

            sources = cmp.config.sources({
                { name = "nvim_lua" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                -- { name = "copilot" },
                { name = "spell" },
                { name = "path" },
                { name = "cmdline" },
            }),

            formatting = {
                format = lspkind.cmp_format({
                    with_text = true,
                    menu = {
                        nvim_lua = "[LUA]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[Snippet]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                        -- copilot = "[Copilot]",
                        spell = "[Spell]",
                        cmdline = "[Cmdline]",
                    },
                }),
            },

            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            experimental = {
                ghost_text = true,
                native_menu = false,
            },

            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            }),

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
                matching = { disallow_symbol_nonprefix_matching = false },
            }),
        })
    end,
}
