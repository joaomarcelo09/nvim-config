require("mason").setup()

require("mason-tool-installer").setup({
  ensure_installed = {
    "jdtls",
    "ts_ls",
    "tailwindcss-language-server",
    "vue-language-server",
    "eslint_d",
    "prettier",
    "node-debug2-adapter",
  },
  auto_update = true,
})

require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "eslint", "jdtls", "vue_ls" },
})

require("mason-nvim-dap").setup({
  ensure_installed = { "node2", "python" },
  automatic_setup = true,
})
