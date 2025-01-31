-- Carregar o cmp
local cmp = require'cmp'

-- Carregar e configurar o colorful-menu
require'colorful-menu'.setup {
  enable = true,  -- Habilitar o colorful-menu
  highlight = {
    lsp = 'CmpItemKindFunction',  -- Cor para sugestões LSP (Funções)
    buffer = 'CmpItemKindVariable', -- Cor para sugestões do buffer (Variáveis)
    path = 'CmpItemKindKeyword',  -- Cor para sugestões de caminho (Keywords)
    luasnip = 'CmpItemKindSnippet',  -- Cor para sugestões de snippets
  },
  -- Outras opções podem ser ajustadas conforme necessário
}

-- Configuração do cmp com colorful-menu integrado
cmp.setup {
  completion = {
    autocomplete = { cmp.TriggerEvent.TextChanged, cmp.TriggerEvent.InsertEnter },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Usando LuaSnip para expansão de snippets
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirmar seleção
  },
  sources = {
    { name = 'nvim_lsp' }, -- LSP
    { name = 'buffer' }, -- Texto do buffer
    { name = 'path' }, -- Caminhos de arquivos
    { name = 'luasnip' }, -- Snippets
  },
  window = {
    completion = {
      -- Utilizando o Colorful Menu para personalizar as cores do menu
      winhighlight = 'Normal:Pmenu,NormalNC:Pmenu,CursorLine:PmenuSel,Search:PmenuSel'
    },
  },
}

-- Configuração para LSP
local capabilities = require'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.vimls.setup {
  capabilities = capabilities,
}

