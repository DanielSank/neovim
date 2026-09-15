return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = { "lua", "python", "javascript", "typescript", "rust", "go", "bash" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  }
}
