local status_ok, _ = pcall(require, "nvim-lspconfig")
if not status_ok then
  return
end

require("lsp.lsp-installer")
require("lsp.handlers").setup()
