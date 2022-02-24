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
