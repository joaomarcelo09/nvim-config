-- Mantém o NERDTree sincronizado ao trocar de buffer, exceto em diffs
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if not vim.o.diff then
      vim.cmd("silent! NERDTreeMirror")
    end
  end
})

vim.g.NERDTreeDirArrowExpandable = ""
vim.g.NERDTreeDirArrowCollapsible = ""

vim.cmd [[
  let g:WebDevIconsUnicodeDecorateFileNodes = 1
  let g:NERDTreeGitStatusUseNerdFonts = 1
]]

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "nerdtree" then
      -- Conta quantas janelas estão abertas (excluindo o NERDTree)
      local windows = vim.fn.winnr("$")
      local buffers = vim.fn.len(vim.fn.getbufinfo({ bufloaded = 1 }))

      print(windows)
      print(buffers)
      -- Se há apenas 1 janela e pelo menos 1 outro buffer aberto, alterna para ele antes de fechar o NERDTree
      if windows == 1 and buffers > 1 then
        vim.cmd("bnext") -- Alterna para o próximo buffer
      elseif windows == 1 then
        vim.cmd("bnext") -- Alterna para o próximo buffer
      end
    end
  end
})

