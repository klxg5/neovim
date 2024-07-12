return {
    "stevearc/overseer.nvim",
    config = function()
        require("overseer").setup({ direction = "bottom" })
    end,
}
