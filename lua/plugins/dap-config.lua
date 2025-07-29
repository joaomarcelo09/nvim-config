local dap = require("dap")
local dapui = require("dapui")
local dap_python = require('dap-python')
local dapui_utils = require('utils/dap')

local function get_python_path()
  local cwd = vim.fn.getcwd()
  local parent_venv = "/home/joaogomes/font/flowts/venv/bin/python"

  if vim.fn.executable(parent_venv) == 1 then
    return parent_venv
  elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
    return cwd .. "/.venv/bin/python"
  elseif vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
    return cwd .. "/venv/bin/python"
  else
    return "python3" -- fallback global
  end
end

dap_python.setup(get_python_path())
local manage_py = "/home/joaogomes/font/flowts/demo/src/manage.py"

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {
    os.getenv("HOME") .. "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js",
  },
}

dap.configurations.typescript = {
  {
    name = "Launch NestJS (main.ts)",
    type = "node2",
    request = "launch",
    program = "${workspaceFolder}/src/main.ts",  -- This is your entry point (main.ts)
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    outFiles = { "${workspaceFolder}/dist/**/*.js" },  -- Make sure to point to the compiled JS output
    runtimeExecutable = "node",  -- Use node to run it
    runtimeArgs = { "-r", "ts-node/register" },  -- Use ts-node to run TypeScript
    protocol = "inspector", 
    console = "integratedTerminal",
    skipFiles = { "<node_internals>/**" },  -- Ignore node internals
  },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    python = get_python_path(),
    name = 'Django Runserver',
    program = "${workspaceFolder}/src/manage.py",
    args = { "runserver" },
    django = true,
    justMyCode = false,
  },
}

require("dapui").setup({
  layouts = {
    {
      -- Elements shown on the left
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "watches", size = 0.50 },
        { id = "breakpoints", size = 0.15 },
        { id = "stacks", size = 0.10 },
      },
      size = 35,
      position = "left",
    },
    {
      -- Elements shown on the bottom
      elements = {
        "repl",
      },
      size = 10, -- 📏 height of the bottom window
      position = "bottom",
    },
  },
})

require("nvim-dap-virtual-text").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.after.event_initialized["dapui_reset"] = function()
  dapui_utils.reset_dapui()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
