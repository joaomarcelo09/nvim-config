require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'jdtls', 'pyright', 'tsserver', },
  handlers = {

    -- For more features, see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
    jdtls = function()
        require('lspconfig').jdtls.setup({})
    end,

    pyright = function()
      require('lspconfig').pyright.setup({
        settings = {
          python = {
            analysis = {
              reportMissingTypeStubs = false,
              typeCheckingMode = "off",
            },
          },
        },
      })
    end,
    
    tsserver = function()
      require('lspconfig').tsserver.setup({})
    end,

  },
})
