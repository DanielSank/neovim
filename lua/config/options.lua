-- Set <Space> as the leader key
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
vim.opt.smartindent = true    -- Insert extra indent after opening braces/blocks (like `def:`, `if:`, `{`)

-- Spaces vs Tabs (4-space standard for Python, C, Lua, etc.)
vim.opt.expandtab = true      -- Convert tabs to spaces when hitting <Tab> or auto-indenting
vim.opt.tabstop = 4           -- Width of a hard tab character
vim.opt.shiftwidth = 4        -- Number of spaces inserted for each level of indentation
vim.opt.softtabstop = 4       -- Makes <BS> treat 4 spaces like a tab when deleting

-- Automatic Trailing Whitespace Trim on New Lines
-- Ensures blank lines created with Enter don't leave lingering spaces
vim.opt.backspace = { "indent", "eol", "start" }
