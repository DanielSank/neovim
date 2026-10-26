-- Recommend installing ripgrep and fd-find to make commands used by this
-- plugin faster.
return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<CR>",     desc = "FZF Find Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "FZF Live Grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<CR>",   desc = "FZF Buffers" },
    { "<leader>fh", "<cmd>FzfLua help_tags<CR>", desc = "FZF Help Tags" },
  },
  opts = {
    defaults = {
      file_icons = false,
      git_icons = false,
    },
    winopts = {
      height = 0.85,
      width = 0.80,
      row = 0.35,
      col = 0.50,
      border = "rounded",
    },
  },
}
