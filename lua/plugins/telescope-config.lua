local telescope = require('telescope')
local actions = require('telescope.actions')

-- Configuração do comportamento ao selecionar um arquivo
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-d>"] = actions.select_horizontal,  -- Abre no split horizontal ao pressionar Enter
        ["<C-x>"] = actions.select_vertical,   -- Abre no split vertical ao pressionar Ctrl+x
        ["<CR>"] = actions.select_default,   -- Abre o arquivo em cima do anterior (sem split) ao pressionar Ctrl+Enter
      },
    },
  },
})
