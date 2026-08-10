return {
  "ibhagwan/fzf-lua",
  config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
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
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "FZF Find Files" })
    vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "FZF Live Grep" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "FZF Buffers" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "FZF Help Tags" })
    end,
}
