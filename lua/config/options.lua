-- Set the leader key
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Whitespace
vim.opt.list = true
vim.opt.listchars = {
  space = "·",
  tab = ">-",
  trail = "·",
}

vim.opt.number = true
vim.opt.updatetime = 500
vim.opt.signcolumn = "yes"

-- Copy indent from current line when making a new line
-- Only relevant for filetypes where treesitter does't set indentation rules
vim.opt.autoindent = true

-- Spaces vs Tabs (4-space standard for Python, C, Lua, etc.)
-- treesitter doesn't mess with these, but after/ftplugin can override them.
vim.opt.expandtab = true      -- Convert tabs to spaces when hitting <Tab> or auto-indenting
vim.opt.tabstop = 4           -- How wide a tab character is displayed
vim.opt.shiftwidth = 4        -- Number of spaces inserted for each level of indentation
vim.opt.softtabstop = 4       -- Makes tab and backspace create/eat 4 spaces

vim.opt.backspace = { "indent", "eol", "start" }

-- Folding.
-- We call out to treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 0

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd.colorscheme("retrobox")
