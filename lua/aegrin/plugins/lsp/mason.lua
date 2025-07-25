return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "󰊠",
                    package_pending = "",
                    package_uninstalled = "󱙝",
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "intelephense",
                "html",
                "cssls",
                "sqlls",
                "lua_ls",
                "ts_ls",
                "cobol_ls",
            },

            automatic_installation = true,
        })
        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "phpcbf",
                "blade-formatter",
                "eslint_d",
                "tlint",
                "stylelint",
                "sqlfluff",
            },
        })
    end,
}
