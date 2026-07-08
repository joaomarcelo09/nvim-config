local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")

require("nvim-treesitter-textobjects").setup {
  select = {
    lookahead = true,
  },
  move = {
    set_jumps = true,
  },
}

vim.keymap.set({ "x", "o" }, "af", function()
  select.select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
  select.select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
  select.select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
  select.select_textobject("@class.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "at", function()
  select.select_textobject("@tag.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "it", function()
  select.select_textobject("@tag.inner", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]f", function()
  move.goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]c", function()
  move.goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]t", function()
  move.goto_next_start("@tag.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[f", function()
  move.goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[c", function()
  move.goto_previous_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[t", function()
  move.goto_previous_start("@tag.outer", "textobjects")
end)
