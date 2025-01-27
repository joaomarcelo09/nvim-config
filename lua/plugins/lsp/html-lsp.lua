print("Starting html LS")

require'lspconfig'.html.setup({
  cmd = { "vscode-html-languageserver", "--stdio" },
  filetypes = { "html", "xhtml" },  -- Suporte para arquivos .html e .xhtml
  settings = {
    html = {
      format = {
        enable = true  -- Ativa o formato automático
      }
    }
  }
})

print("Success loaded html LS")
