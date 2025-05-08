return {
    {
        "ccaglak/phptools.nvim",
        keys = {
            { "<leader>lm", "<cmd>PhpTools Method<cr>" },
            { "<leader>lc", "<cmd>PhpTools Class<cr>" },
            { "<leader>ls", "<cmd>PhpTools Scripts<cr>" },
            { "<leader>ln", "<cmd>PhpTools Namespace<cr>" },
            { "<leader>lg", "<cmd>PhpTools GetSet<cr>" },
            { "<leader>lf", "<cmd>PhpTools Create<cr>" },
            { "<leader>ld", "<cmd>PhpTools DrupalAutoLoader<cr>" },
            { mode = "v", "<leader>lr", "<cmd>PhpTools Refactor<cr>" },
        },
        dependencies = {
            "ccaglak/larago.nvim", -- optional -- laravel goto blade/components
            "ccaglak/snippets.nvim", -- optional -- native snippet expander
        },
        config = function()
            require("phptools").setup({
                ui = {
                    enable = true, -- default:true; false only if you have a UI enhancement plugin
                    fzf = false, -- default:false; tests requires fzf used only in tests module otherwise there might long list  of tests
                },
                drupal_autoloader = { -- delete if you dont use it
                    enable = false, -- default:false
                    scan_paths = { "/web/modules/contrib/" }, -- Paths to scan for modules
                    root_markers = { ".git" }, -- Project root markers
                    autoload_file = "/vendor/composer/autoload_psr4.php", -- Autoload file path
                },
                custom_toggles = { -- delete if you dont use it
                    enable = false, -- default:false
                    -- { "foo", "bar", "baz" }, -- Add more custom toggle groups here
                },
            })

            local opts = { noremap = true, silent = true }
            local ide_helper = require("phptools.ide_helper")

            opts.desc = "Generate all IDE helpers"
            vim.keymap.set("n", "<leader>lha", ide_helper.generate_all, opts)
            opts.desc = "Generate model helpers"
            vim.keymap.set("n", "<leader>lhm", ide_helper.generate_models, opts)
            opts.desc = "Generate facade helpers"
            vim.keymap.set("n", "<leader>lhf", ide_helper.generate_facades, opts)
            opts.desc = "Generate meta helper"
            vim.keymap.set("n", "<leader>lht", ide_helper.generate_meta, opts)
            opts.desc = "Install IDE Helper package"
            vim.keymap.set("n", "<leader>lhi", ide_helper.install, opts)

            local tests = require("phptools.tests") --

            opts.desc = "Run all tests"
            vim.keymap.set("n", "<Leader>ta", tests.test.all, opts)
            opts.desc = "Run current file tests"
            vim.keymap.set("n", "<Leader>tf", tests.test.file, opts)
            opts.desc = "Run test at cursor"
            vim.keymap.set("n", "<Leader>tl", tests.test.line, opts)
            opts.desc = "Search and run test"
            vim.keymap.set("n", "<Leader>ts", tests.test.filter, opts)
            opts.desc = "Run tests in parallel"
            vim.keymap.set("n", "<Leader>tp", tests.test.parallel, opts)
            opts.desc = "Rerun last test"
            vim.keymap.set("n", "<Leader>tr", tests.test.rerun, opts)
            opts.desc = "Run selected test file"
            vim.keymap.set("n", "<Leader>ti", tests.test.selected, opts)

            -- largo
            vim.keymap.set("n", "<leader>gg", "<cmd>GoBlade<cr>")
        end,
    },
    {
        "ccaglak/namespace.nvim",
        keys = {
            -- { "<leader>la", "<cmd>Php classes<cr>" },
            -- { "<leader>lc", "<cmd>Php class<cr>" },
            -- { "<leader>ln", "<cmd>Php namespace<cr>" },
            -- { "<leader>ls", "<cmd>Php sort<cr>" },
        },
        dependencies = {
            "ccaglak/phptools.nvim", -- optional
            "ccaglak/larago.nvim", -- optional
        },
        config = function()
            require("namespace").setup({
                ui = true, -- default: true -- false only if you want to use your own ui
                cacheOnload = false, -- default: false -- cache composer.json on load
                dumpOnload = false, -- default: false -- dump composer.json on load
                sort = {
                    on_save = false, -- default: false -- sorts on every search
                    sort_type = "length_desc", -- default: natural -- seam like what pint is sorting
                    --  ascending -- descending -- length_asc
                    -- length_desc -- natural -- case_insensitive
                },
            })
            local opts = { noremap = true, silent = true }

            opts.desc = "GetCLasses"
            vim.keymap.set("n", "<leader>la", "<cmd>Php classes<cr>", opts)
            opts.desc = "GetClass"
            vim.keymap.set("n", "<leader>lc", "<cmd>Php class<cr>", opts)
            opts.desc = "Namespace"
            vim.keymap.set("n", "<leader>ln", "<cmd>Php namespace<cr>", opts)
            opts.desc = "Sort Classes"
            vim.keymap.set("n", "<leader>ls", "<cmd>Php sort<cr>", opts)
        end,
    },
}
