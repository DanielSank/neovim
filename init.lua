-- Load non-plugin settings and keymaps
require("config.options")
require("config.keymaps")

-- lazy.nvim can't read git's "reftable" repo format.
-- Make git commands started by Neovim (lazy's clones)
-- use the classic "files" format.
local n = tonumber(vim.env.GIT_CONFIG_COUNT) or 0
vim.env["GIT_CONFIG_KEY_" .. n] = "init.defaultRefFormat"
vim.env["GIT_CONFIG_VALUE_" .. n] = "files"
vim.env.GIT_CONFIG_COUNT = tostring(n + 1)

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Automatically load all plugin specs in lua/plugins/*.lua
require("lazy").setup("plugins")
