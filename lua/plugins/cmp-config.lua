-- Load cmp
local cmp = require'cmp'

-- Load and configure colorful-menu
require'colorful-menu'.setup {
  enable = true,  -- Enable colorful-menu
  highlight = {
    lsp = 'CmpItemKindFunction',  -- Color for LSP suggestions (Functions)
    buffer = 'CmpItemKindVariable', -- Color for buffer suggestions (Variables)
    path = 'CmpItemKindKeyword',  -- Color for path suggestions (Keywords)
    luasnip = 'CmpItemKindSnippet',  -- Color for snippet suggestions
  },
  -- Other options can be adjusted as needed
}

-- cmp setup with integrated colorful-menu
cmp.setup {
  completion = {
    autocomplete = { cmp.TriggerEvent.TextChanged, cmp.TriggerEvent.InsertEnter },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Using LuaSnip to expand snippets
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
  },
  sources = {
    { name = 'nvim_lsp' }, -- LSP
    { name = 'buffer' }, -- Buffer text
    { name = 'path' }, -- File paths
    { name = 'luasnip' }, -- Snippets
  },
  window = {
    completion = {
      -- Using Colorful Menu to customize the menu colors
      winhighlight = 'Normal:Pmenu,NormalNC:Pmenu,CursorLine:PmenuSel,Search:PmenuSel'
    },
  },
}

-- LSP configuration
local capabilities = require'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.vimls.setup {
  capabilities = capabilities,
}
