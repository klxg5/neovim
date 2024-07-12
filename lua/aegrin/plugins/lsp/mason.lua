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
                "denols",
                "gopls",
                "nil_ls",
            },

            automatic_installation = true,
        })
        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "gofumpt",
                "phpcbf",
                "blade-formatter",
                "nixpkgs-fmt",
                "eslint_d",
                "tlint",
                "selene",
                "staticcheck",
                "stylelint",
                "sqlfluff",
            },
        })
    end,
}
