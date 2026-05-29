return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")
        local add = ls.add_snippets
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local extras = require("luasnip.extras")
        local rep = extras.rep
        local fmt = require("luasnip.extras.fmt").fmt
        local c = ls.choice_node
        local f = ls.function_node
        local d = ls.dynamic_node
        local sn = ls.snippet_node

        vim.keymap.set({ "i", "s" }, "<M-right>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump(1)
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<M-left>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<M-down>", function()
            if ls.choice_active(-1) then
                ls.change_choice(-1)
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<M-up>", function()
            if ls.choice_active() then
                ls.change_choice(-1)
            end
        end, { silent = true })

        add("typescriptreact", {
            s("_mdata", {
                t("export const metadata = {"),
                t("  title: '"),
                i(1),
                t("',"),
                t("  description: '"),
                i(2),
                t("',"),
                t("}"),
            }),
        })

        add("tsx", {
            s("hello", {
                t('print("hello '),
                c(1, {
                    t("amazing"),
                    t("wonderful"),
                    t("cruel"),
                    t("meh"),
                }),
                t(' world")'),
            }),
        })
    end,
}
