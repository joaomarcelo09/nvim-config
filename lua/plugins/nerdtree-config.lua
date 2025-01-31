-- Abre o NERDTree automaticamente ao iniciar o Neovim e foca no último buffer
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  command = "NERDTree | wincmd p"
})

-- Mantém o NERDTree sincronizado ao trocar de buffer, exceto em diffs
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if not vim.o.diff then
      vim.cmd("silent! NERDTreeMirror")
    end
  end
})

-- Atalho para alternar o NERDTree com `,`
vim.api.nvim_set_keymap("n", ",", ":NERDTreeToggle<CR>", { noremap = true, silent = true })

