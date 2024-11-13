print("Configuring jdtls for Java")
require('lspconfig').jdtls.setup {
  cmd = { '/home/joaogomes/.local/share/nvim/lsp_servers/jdtls/bin/jdtls' },
  -- Outras configurações...
}



