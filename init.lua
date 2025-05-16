-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("settings")

-- Load your plugins from lua/plugins/init.lua
require("lazy").setup("plugins.init")
require("plugins.mason-config")
require("plugins.cmp-config")
require("plugins.colorful-menu-config")
require("plugins.lsp.html-lsp")
require("plugins.lsp.java-lsp")
require("plugins.lsp.python-lsp")
require("plugins.lsp.typescript-lsp")
require("plugins.threesitter")
require("plugins.cmdline")
require("plugins.bufferline-config")
require("plugins.lua-line-config")

-- Shortcuts
require('shortcuts-config')
