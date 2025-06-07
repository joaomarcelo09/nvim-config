local lspconfig = require('lspconfig')

-- Capabilities básicas para o LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.ts_ls.setup {
  capabilities = capabilities, -- Passa as capacidades para o servidor
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html" },
  on_attach = function(client, bufnr)
    -- Desabilitar a formatação padrão para usar ferramentas como Prettier
    client.server_capabilities.documentFormattingProvider = false
  end,
  settings = {
    typescript = {
      suggest = {
        autoImports = true, -- Habilita sugestões de auto-import
        completeFunctionCalls = true -- Completa funções automaticamente com parênteses
      }
    },
    javascript = {
      suggest = {
        autoImports = true, -- Mesmo para JavaScript
        completeFunctionCalls = true
      }
    }
  }
}
