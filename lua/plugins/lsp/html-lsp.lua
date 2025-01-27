local lspconfig = require('lspconfig')

lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Configurações específicas para quando o LSP for anexado
  end,
  filetypes = { "html", "xhtml" },  -- Adiciona 'xhtml' como tipo de arquivo
}
