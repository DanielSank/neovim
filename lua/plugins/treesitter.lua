return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,          -- main doesn't support lazy-loading
  build = ":TSUpdate",   -- recompile parsers when the plugin updates
  config = function()
    -- Download + compile parsers (async; does nothing if already installed)
    require("nvim-treesitter").install({
      "lua", "python", "javascript", "typescript", "tsx", "rust", "go", "bash",
    })

    -- main no longer turns features on by itself; do it per buffer
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("UserTreesitter", {}),
      callback = function(ev)
        -- pcall: silently skip filetypes that have no parser
        if pcall(vim.treesitter.start, ev.buf) then
          -- Optional, experimental: tree-sitter indentation.
          -- Delete this line to use Neovim's built-in indent scripts instead.
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}

