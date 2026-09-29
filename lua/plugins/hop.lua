return {
  "smoka7/hop.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>j", "<cmd>HopWordAC<CR>",              mode = { "n", "x", "o" }, desc = "Hop word forward" },
    { "<leader>k", "<cmd>HopWordBC<CR>",              mode = { "n", "x", "o" }, desc = "Hop word backward" },
    { "<leader>l", "<cmd>HopWordCurrentLineAC<CR>",   mode = { "n", "x", "o" }, desc = "Hop word forward (line)" },
    { "<leader>h", "<cmd>HopWordCurrentLineBC<CR>",   mode = { "n", "x", "o" }, desc = "Hop word backward (line)" },
  },
}

