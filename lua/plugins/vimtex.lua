return {
  "lervag/vimtex",
  lazy = false,  -- VimTeX docs say not to lazy-load; it already loads only for tex files
  init = function()
    -- init (not config): these globals must be set before VimTeX loads
    vim.g.vimtex_view_method = "zathura_simple"
    -- Default prefix <localleader>l would clash with hop's <leader>l (both leaders are \).
    vim.g.vimtex_mappings_prefix = "<localleader>t"
  end,
}
