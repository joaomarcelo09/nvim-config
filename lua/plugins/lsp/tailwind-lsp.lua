local on_attach = function(client, bufnr)
  -- Only activate if it's the Tailwind CSS language server
  if client.name == "tailwindcss" then
    require("tailwind-highlight").setup(client, bufnr)
  end
end

vim.lsp.config("tailwindcss", {
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
