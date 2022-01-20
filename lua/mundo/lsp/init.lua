local status_ok, _ = pcall(require, "nvim-lspconfig")
if not status_ok then
  return
end

require("mundo.lsp.lsp-installer")
require("mundo.lsp.handlers").setup()
