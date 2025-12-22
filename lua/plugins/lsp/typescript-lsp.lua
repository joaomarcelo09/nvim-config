local lspconfig = require('lspconfig')
local home = os.getenv("HOME")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.ts_ls.setup {
  capabilities = capabilities,   
  init_options = {
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = home .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
          languages = { 'vue' },
        },
      },
  },
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
}
