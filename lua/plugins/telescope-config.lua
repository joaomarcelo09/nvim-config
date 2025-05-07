local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-d>"] = actions.select_horizontal,
        ["<C-x>"] = actions.select_vertical,
        ["<CR>"] = actions.select_default,
     },
    },
  },
})
