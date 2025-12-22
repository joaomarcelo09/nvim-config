require("mason").setup()

require("mason-tool-installer").setup({
  ensure_installed = {
    "jdtls",
    "vtsls",
    "tailwindcss-language-server",
    "vue-language-server",
    "eslint_d",
    "prettier",
    "node-debug2-adapter",
  },
  auto_update = true,
})

require("mason-lspconfig").setup({
  ensure_installed = { "vtsls", "tailwindcss", "eslint", "jdtls", "vue_ls" },
})

require("mason-nvim-dap").setup({
  ensure_installed = { "node2", "python" },
  automatic_setup = true,
})
