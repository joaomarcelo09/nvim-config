local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("ts_ls", {
  capabilities = capabilities,   
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "vue" },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
  settings = {
    typescript = {
      suggest = {
        autoImports = true,
        completeFunctionCalls = true
      }
    },
    javascript = {
      suggest = {
        autoImports = true,
        completeFunctionCalls = true
      }
    }
  }
}) 

vim.lsp.enable("ts_ls")
