require("bufferline").setup({
  options = {
    indicator = {
      style = "icon",
      icon = "●",  -- Pode mudar para "○", "*" ou outro
    }
  }
})

vim.api.nvim_set_keymap('n', 'H', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':bdelete<CR>', { noremap = true, silent = true })
