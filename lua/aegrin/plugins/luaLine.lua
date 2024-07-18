return {
    "nvim-lualine/lualine.nvim",
    config = function()
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
            sections = { "error", "warn", "info", "hint" },
            colored = true,
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
            newfile_status = true,
            path = 1,
            shorting_target = 25,
            symbols = {
                modified = " ",
                readonly = " ",
                unnamed = " ",
            },
        }

        local mode = {
            "mode",
            fmt = function(str)
                return string.sub(str, 1, 1)
            end,
            separator = " ",
        }

        local buffers = {
            "buffers",
            mode = 0,
            max_length = vim.o.columns * 7 / 8,
            use_mode_colors = true,
            buffers_color = {
                -- active = "lualine_buffers_active",
                -- inactive = "lualine_buffers_inactive",
            },
            symbols = {
                modified = " 󰉉",
            },
        }

        local tabs = {
            "tabs",
            mode = 0,
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
            separator = "",
        }

        local aerial = {
            "aerial",
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

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
                -- component_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },

                disabled_filetypes = {
                    statusline = { "packer", "NvimTree", "undotree" },
                    winbar = {},
                },
                always_divide_middle = false,
                globalstatus = true,
            },
            sections = {
                lualine_a = { mode, branch },
                lualine_b = { filename },
                lualine_c = { diagnostics },
                lualine_x = { overseer },
                lualine_y = { spaces, "encoding", filetype },
                lualine_z = { location, progress },
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

                lualine_a = { buffers },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { tabs },
            },
            extensions = {},
        })
    end,
}
