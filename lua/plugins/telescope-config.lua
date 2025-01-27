local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

-- Mapeamento para abrir o Find Files
vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({
    previewer = false,  -- Desativa o preview para exibir apenas o conteúdo
    layout_strategy = 'horizontal',  -- Mantém o layout horizontal (ou 'vertical')
    winblend = 20,  -- Define a transparência da janela
    border = true,  -- Adiciona borda
    borderchars = { '─', '│', '─', '│', '┌', '┐', '└', '┘' },  -- Borda estilizada
  })
end, { desc = "Find Files" })

-- Mapeamento para abrir o Live Grep
vim.keymap.set('n', '<leader>fg', function()
  builtin.live_grep({
    previewer = false,
    layout_strategy = 'horizontal',
    winblend = 20,
    border = true,
    borderchars = { '─', '│', '─', '│', '┌', '┐', '└', '┘' },
  })
end, { desc = "Live Grep" })

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
