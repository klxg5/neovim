local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("pluggs.lsp.lsp-installer")
require("pluggs.lsp.handlers").setup()

