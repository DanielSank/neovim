return {
  "PhilRunninger/bufselect",
  keys = {
    -- Map <leader>b to open the floating buffer selector floating window
    { "<leader>b", "<cmd>ShowBufferList<CR>", desc = "Show Buffer List" },
  },
  config = function()
    -- Optional configuration settings
    vim.fn["bufselect#settings"]({
      win = {
        config = {
          border = "rounded",
          title = " Buffers ",
          title_pos = "center",
        },
      },
    })
  end,
}
