-- Carregar o nvim-dap
local dap = require('dap')

-- Configuração para o adaptador node2 para TypeScript
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {vim.fn.stdpath('data') .. '/mason/packages/vscode-node-debug2/out/src/nodeDebug.js'}
}

dap.configurations.typescript = {
  {
    name = 'Launch Program',
    type = 'node2',
    request = 'launch',
    program = '${workspaceFolder}/index.ts',
    cwd = '${workspaceFolder}',  -- Diretorio de trabalho do projeto
  },
}


