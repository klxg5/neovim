local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

local ok, lspkind = pcall(require, "lspkind")
if not ok then
    return
end

lspkind.init({
    symbol_map = {
        Copilot = "",
    },
})

-- load friendly-snippets
require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<C-Enter>"] = cmp.mapping.complete(),
        ["<C-BS>"] = cmp.mapping.abort(),
        ["<Enter>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
    },

    sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "copilot" },
        { name = "spell" },
        { name = "path" },
    },

    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            menu = {
                nvim_lua = "[LUA]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
                copilot = "[Copilot]",
                spell = "[Spell]",
            },
        }),
    },

    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    -- window = {
    --     completion = cmp.config.window.bordered(),
    --     documentation = cmp.config.window.bordered(),
    -- },
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
})
