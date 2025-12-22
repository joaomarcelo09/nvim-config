local lspconfig = require("lspconfig")
local home = os.getenv("HOME")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig.configs").vtsls = require("vtsls").lspconfig

lspconfig.vtsls.setup({
  capabilities = capabilities,

  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "html",
  },

  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,

  settings = {
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
    },

    typescript = {
      suggest = {
        autoImports = true,
        completeFunctionCalls = true,
      },
    },

    javascript = {
      suggest = {
        autoImports = true,
        completeFunctionCalls = true,
      },
    },
  },

  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = home
          .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
        languages = { "vue" },
      },
    },
  },
})

lspconfig.volar.setup {}
