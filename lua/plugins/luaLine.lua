local hide_in_width = function()
    return vim.fn.winwidth(0) > 90
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn", "info", "hint" },
    colored = true,
    update_in_insert = false,
    always_visible = false,
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    -- cond = hide_in_width,
}

local filename = {
    "filename",
    file_status = true,
    newfile_status = true,
    path = 1,
    shorting_target = 25,
    symbols = {
        modified = " 󰉉",
        readonly = " ",
        unnamed = " ",
    },
}

local mode = {
    "mode",
    fmt = function(str)
        return string.sub(str, 1, 1)
    end,
}

local filetype = {
    "filetype",
    icons_enabled = true,
    icon = nil,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

local location = {
    "location",
}

local aerial = {
    "aerial",
}

local lsp_progress = {
    "lsp_progress",
}

local overseer = {
    "overseer",
}

-- cool function for progress
local progress = {
    function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "█", "▇", "▆", "▅", "▄", "▃", "▂", "▁", " " }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
    end,
}

local spaces = {
    function()
        return "spaces " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end,
}

return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },

            disabled_filetypes = {
                statusline = { "packer", "NvimTree", "undotree" },
                winbar = {},
            },
            always_divide_middle = false,
            globalstatus = true,
            ignore_focus = {
                "dapui_watches",
                "dapui_breakpoints",
                "dapui_scopes",
                "dapui_console",
                "dapui_stacks",
                "dap-repl"
            }
        },
        sections = {
            lualine_a = { mode },
            lualine_b = { branch, diff },
            lualine_c = { filename, diagnostics },
            lualine_x = { spaces, "encoding" },
            lualine_y = { filetype },
            lualine_z = { location },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {

            lualine_a = {{"buffers", mode = 0, symbols = { modified = ' 󰉉' }, max_length = vim.o.columns * 7/8}},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {{"tabs", mode = 0}},
        },
        extensions = {},
    }
}
