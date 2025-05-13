local dap = require("dap")
local dapui = require("dapui")

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

dapui.setup()
require("nvim-dap-virtual-text").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
