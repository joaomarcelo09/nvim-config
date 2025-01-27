require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'jdtls' },
  handlers = {

    -- For more features, see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
    jdtls = function()
        require('lspconfig').jdtls.setup({})
    end,
  },
})
