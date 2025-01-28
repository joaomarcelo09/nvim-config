print("Configuring jdtls for Java")

require'lspconfig'.jdtls.setup{
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.level=ALL',
        '-noverify',
        '-Xmx1G',
        '-jar', '/home/joaogomes/jdtls/plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar',
        '-configuration', '/home/joaogomes/jdtls/config_linux',
        '-data', '/home/joaogomes/jdtls/workspace'
    },
    settings = {
  java = {
    diagnostics = {
      enable = true,  -- Certifique-se de que a coleta de diagnósticos está ativada
      showInlayHints = true,  -- Hints de erro ou warning
      checkOnSave = true  -- Verifica o código e gera erros automaticamente ao salvar
    },
    completion = {
      enabled = true  -- Habilita as sugestões de código
    },
    format = {
      enabled = true  -- Habilita a formatação automática
    }
  }
}
}

print("Success loaded java LSP")
