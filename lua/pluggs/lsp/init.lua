local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("pluggs.lsp.lsp-installerConf")
require("pluggs.lsp.handlersConf").setup()
