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

-- Auto-indentation based on line context and filetype syntax
vim.opt.autoindent = true     -- Copy indent from current line when making a new line
-- vim.opt.smartindent = true    -- Insert extra indent after opening braces/blocks (like `def:`, `if:`, `{`)
-- Commented out because of conflict with treesitter

-- Spaces vs Tabs (4-space standard for Python, C, Lua, etc.)
vim.opt.expandtab = true      -- Convert tabs to spaces when hitting <Tab> or auto-indenting
vim.opt.tabstop = 4           -- Width of a hard tab character
vim.opt.shiftwidth = 4        -- Number of spaces inserted for each level of indentation
vim.opt.softtabstop = 4       -- Makes <BS> treat 4 spaces like a tab when deleting

vim.opt.backspace = { "indent", "eol", "start" }

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 0

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd.colorscheme("retrobox")
