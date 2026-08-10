local opts = { noremap = true, silent = true }

vim.keymap.set("i", "jj", "<ESC>", opts)

-- Window Navigation (Control + hjkl to move between splits)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)


-- Buffer Navigation

vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
-- Move to next buffer

vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
-- Move to previous buffer


-- Clear search highlights easily
vim.keymap.set("n", "<CR>", ":nohlsearch<CR>", opts)


-- Keep cursor centered when scrolling half pages
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

