print("Configuring mason debugger")
require("mason").setup()

require("mason-tool-installer").setup({
  ensure_installed = {
    "ts_ls",
    "eslint_d",
    "prettier",
    "node-debug2-adapter",
  },
  auto_update = true,
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "eslint" }, -- whatever you want preinstalled
})

require("mason-nvim-dap").setup({
  ensure_installed = { "node2" }, -- or "js" for js-debug
  automatic_setup = true,
})

print("loaded mason")

