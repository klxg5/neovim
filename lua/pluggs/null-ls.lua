local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

local sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.diagnostics.eslint,
  null_ls.builtins.formatting.phpcsfixer,
}

null_ls.setup({ sources = sources })
