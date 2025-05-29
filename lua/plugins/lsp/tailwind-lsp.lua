print('Start tailwind lsp')

local on_attach = function(client, bufnr)
  -- Only activate if it's the Tailwind CSS language server
  if client.name == "tailwindcss" then
    require("tailwind-highlight").setup(client, bufnr)
  end
end

require('lspconfig').tailwindcss.setup({
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          -- For custom class extraction (optional)
          { "tw`([^`]*)", 1 },
          { 'tw="([^"]*)', 1 },
          { "tw\\(([^)]*)\\)", 1 },
        },
      },
    },
  },
})
print('Tailwind loaded')
