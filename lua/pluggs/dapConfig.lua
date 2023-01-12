local has_dap, dap = pcall(require, "dap")
if not has_dap then
    return
end

local has_dap_ui, dapui = pcall(require, "dapui")
if not has_dap_ui then
    return
end

local set_namespace = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
local namespace = vim.api.nvim_create_namespace("dap-hlng")
vim.api.nvim_set_hl(namespace, 'DapStopped', { fg='#eaeaeb', bg='#ffffff' })
vim.fn.sign_define('DapBreakpoint', {text='📌', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='ﰌ', texthl='DapStopped', linehl='DapStopped', numhl='DapStopped'})

dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/.local/share/vscode-php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
    {
        name = "Replatform",
        type = "php",
        request = "launch",
        pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}"
        },
        port = 9003,
        stopOnEntry = false,
        xdebugSettings = {
            max_children = 9999,
            max_data = -1
        }
    },
    {
        name = "Legacy TemplatePortal",
        type = "php",
        request = "launch",
        pathMappings = {
            ["/home/vagrant/Code/rvsales-templateportal"] = "${workspaceFolder}"
        },
        port = 9003,
        stopOnEntry = false,
        xdebugSettings = {
            max_children = 9999,
            max_data = -1
        }
    },
    {
        name = "Legacy CWRV",
        type = "php",
        request = "launch",
        pathMappings = {
            ["/home/vagrant/Code/CampingWorldRVSales"] = "${workspaceFolder}"
        },
        port = 9003,
        stopOnEntry = false,
        xdebugSettings = {
            max_children = 9999,
            max_data = -1
        }
    },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

require "dapui".setup {
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 50, -- 40 columns
            position = "right",
        },
        {
            elements = {
                { id = "repl", size = 0.5 },
                { id = "console", size = 0.5 },
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
        },
    }
}

require "nvim-dap-virtual-text".setup {
    commented = true,
}
