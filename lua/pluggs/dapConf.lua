local status_ok, dap = pcall(require, 'dap')
if not status_ok then
    return
end

require('dap.ext.vscode').load_launchjs()

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/home/allen/.local/share/nvim/dapinstall/php/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    name = 'Homestead XDebug',
    type = 'php',
    request = 'launch',
    port = 9003,
  },
}

dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
    host = function()
      local value = vim.fn.input('Host [127.0.0.1]: ')
      if value ~= "" then
        return value
      end
      return '127.0.0.1'
    end,
    port = function()
      local val = tonumber(vim.fn.input('Port: '))
      assert(val, "Please provide a port number")
      return val
    end,
  }
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host, port = config.port })
end


    -- :lua require'dap'.continue()<CR>
    -- :lua require'dap'.step_over()<CR>
    -- :lua require'dap'.step_into()<CR>
    -- :lua require'dap'.step_out()<CR>
    -- :lua require'dap'.toggle_breakpoint()<CR>
    -- :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
    -- :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
    -- :lua require'dap'.repl.open()<CR>
    -- :lua require'dap'.run_last()<CR>
