return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    "folke/snacks.nvim"
  },
  keys = {
    {
      "<leader>e",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      "<leader>E",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },

  opts = {
    open_for_directories = true,
    floating_window_scaling_factor = 0.9,
    yazi_floating_window_winblend = 0,
    keymaps = {
      show_help = "<c-1>",
    },
    set_keymappings_function = function(yazi_buffer_id, config, context) end,
    yazi_floating_window_border = "rounded",
    future_features = {
      process_events_live = true,
    },
  },
  init = function()
    vim.g.loaded_netrwPlugin = 1
  end,
}
