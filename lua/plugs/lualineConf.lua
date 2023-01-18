local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 90
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = {
        "error",
        "warn",
        lualine_x = { "areial" },
        lualine_y = { "aerial",
            sep = ' ) ',
            depth = nil,
            dense = false,
            dense_sep = '.',
            colored = true,
        }
    },
    symbols = { error = " ", warn = " " },
    colored = false,
    update_in_insert = false,
    always_visible = false,
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
}

local filename = {
    "filename",
    file_status = true,
    path = 1,
    shorting_target = 500,
    symbols = {
        modified = ' ',
        readonly = ' ',
        unnamed = ' '
    }
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
    padding = 0,
}

-- cool function for progress
local progress = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "█", "▇", "▆", "▅", "▄", "▃", "▂", "▁", " " }

    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

local spaces = function()
    return "spaces " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            -- statusline = { "packer", "NvimTree", "undotree" },
            winbar = {}
        },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { mode, branch },
        lualine_b = { filename },
        lualine_c = { diagnostics },
        lualine_x = { diff },
        lualine_y = { spaces, "encoding", filetype },
        lualine_z = { location, progress },
        -- lualine_a = {'mode'},
        -- lualine_b = {'branch', 'diff', 'diagnostics'},
        -- lualine_c = {'filename'},
        -- lualine_x = {'encoding', 'fileformat', 'filetype'},
        -- lualine_y = {'progress'},
        -- lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
        lualine_a = { 'buffers' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'tabs' }
    },
    extensions = {},
})
