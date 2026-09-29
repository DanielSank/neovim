-- Load non-plugin settings and keymaps
require("config.options")
require("config.keymaps")

-- lazy.nvim can't read git's "reftable" format: https://github.com/folke/lazy.nvim/issues/2046
-- Make git commands started by Neovim use the classic "files" format.
vim.env.GIT_DEFAULT_REF_FORMAT = "files"

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
