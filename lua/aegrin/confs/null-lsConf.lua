local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier.with({ filetypes = { "html" } }),
        formatting.stylua,
        -- formatting.pint,
        formatting.blade_formatter.with({ filetypes = { "blade" } }),
        formatting.deno_fmt.with({ filetypes = { "markdown" } }),
    },
})
