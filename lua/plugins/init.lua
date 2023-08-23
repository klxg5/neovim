return {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    {
        "rmehri01/onenord.nvim",
        branch = "main",
    },
    "pappasam/papercolor-theme-slim",
    "Mofiqul/dracula.nvim",
    "Shatur/neovim-ayu",
    "ellisonleao/gruvbox.nvim",
    "EdenEast/nightfox.nvim",
    "shaunsingh/solarized.nvim",
    "folke/tokyonight.nvim",
    "rebelot/kanagawa.nvim",
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            sass = { enable = true, parsers = { "css" }, }, -- Enable sass colors
            mode = "forground";
        }
    },
    -- "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-refactor",
    "mfussenegger/nvim-ts-hint-textobject",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
        "xiyaowong/transparent.nvim",
        opts = {
            extra_groups = {
                "TelescopeNormal",
                "TelescopeBorder",
                "NormalFloat",
                "FoldColumn",
            },
        },
    },
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({})
        end,
    },
    "jose-elias-alvarez/null-ls.nvim",
    "jose-elias-alvarez/typescript.nvim",
    "onsails/lspkind.nvim",
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons"
    },
    -- "stevearc/aerial.nvim",
    "stevearc/oil.nvim",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "kevinhwang91/nvim-bqf", ft = "qf",
    {
        "nvim-telescope/telescope.nvim",
    },
    "nvim-telescope/telescope-live-grep-args.nvim",
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },
    "ThePrimeagen/harpoon",
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "lewis6991/gitsigns.nvim",
    "tpope/vim-fugitive",
    "sindrets/diffview.nvim",
    "aaronhallaert/advanced-git-search.nvim",
     {
         "numToStr/Comment.nvim",
         config = function()
             require("Comment").setup()
         end,
     },
    "mattn/emmet-vim",
    {
        "rcarriga/nvim-notify",
        opts = {
          background_colour = "#000000",
        }
    },
    "windwp/nvim-autopairs",
    "kyazdani42/nvim-web-devicons",
    {
        "michaelb/sniprun",
        build = "bash ./install.sh"
    },
    "mbbill/undotree",
    "kkharji/sqlite.lua",
    "petertriho/nvim-scrollbar",
     {
        "stevearc/stickybuf.nvim",
        config = function()
            require('stickybuf').setup()
        end,
    },
    "arkav/lualine-lsp-progress",
    {
        "stevearc/overseer.nvim",
        config = function()
            require("overseer").setup({ direction = "bottom" })
        end,
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
    },
    "epwalsh/obsidian.nvim",
    {
      'Wansmer/treesj',
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
    }
}
