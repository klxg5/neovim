local status_ok, _ = pcall(require, "nvim-lspconfig")
if not status_ok then
  return
end

require("pluggs.lsp.lsp-installer")
require("pluggs.lsp.handlers").setup()
