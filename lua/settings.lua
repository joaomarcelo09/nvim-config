-- Leader key (just like Vimscript let g:mapleader = "\<Space>")
vim.g.mapleader = " "

-- Options via vim.o or vim.opt (vim.opt is usually nicer)
local opt = vim.opt

opt.syntax = "enable"          -- syntax enable
opt.hidden = true              -- keep multiple buffers open
opt.wrap = false               -- nowrap
opt.encoding = "utf-8"         -- encoding displayed
opt.pumheight = 10             -- popup menu height
opt.fileencoding = "utf-8"     -- file encoding written
opt.ruler = true               -- show cursor position
opt.cmdheight = 2              -- command line height
opt.iskeyword:append("-")      -- treat dash-separated words as one word
opt.mouse = ""                 -- disable mouse? (your vimscript has set mouse=, which means disable)
opt.splitbelow = true          -- horizontal splits below
opt.splitright = true          -- vertical splits right
opt.conceallevel = 0           -- show backticks in markdown
opt.tabstop = 4                -- tab width (you had 4)
opt.shiftwidth = 2             -- indentation width (you had 2)
opt.smarttab = true            -- smarter tabs
opt.expandtab = true           -- tabs to spaces
opt.smartindent = true         -- smart indent
opt.autoindent = true          -- auto indent
opt.laststatus = 0             -- hide statusline? (you had 0, usually 2 or 3 recommended)
opt.number = true              -- line numbers
opt.cursorline = true          -- highlight current line
opt.background = "dark"        -- dark background
opt.showtabline = 2            -- always show tabs
opt.showmode = false           -- hide mode text
opt.backup = false             -- no backup
opt.writebackup = false        -- no write backup
opt.updatetime = 300           -- faster completion
opt.timeoutlen = 500           -- key timeout
opt.formatoptions:remove({ "c", "r", "o" }) -- stop auto comment continuation
opt.clipboard:append("unnamedplus") -- system clipboard
opt.relativenumber = true      -- relative numbers
opt.completeopt = "menuone,noselect"

-- Enable filetype plugins (like filetype plugin on)
vim.cmd("filetype plugin on")

-- Auto source init.lua on save (like your autocommand)
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.expand("$MYVIMRC"),
  command = "source %",
})

-- Map 'w!!' to write file with sudo permission (like your cmap)
vim.cmd([[cmap w!! w !sudo tee %]])

-- Markdown fenced languages global variable
vim.g.markdown_fenced_languages = { "vim", "help" }

