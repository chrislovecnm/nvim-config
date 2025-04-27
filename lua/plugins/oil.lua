return {
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
    keys = { { "-", "<cmd>Oil<cr>", mode = "n", desc = "Open parent directory" } },
  },
}
