local M = {}

local dapui = require("dapui")

local layout = {
    {
      -- Elements shown on the left
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "watches", size = 0.50 },
        { id = "breakpoints", size = 0.15 },
        { id = "stacks", size = 0.10 },
      },
      size = 30,
      position = "right",
    },
    {
      -- Elements shown on the bottom
      elements = {
        "repl",
        "console",
      },
      size = 10, -- 📏 height of the bottom window
      position = "bottom",
    },
  } 

function M.setup_dapui()
  dapui.setup({
  layouts = layout,
  })
end

function M.reset_dapui()
  dapui.close()
  dapui.setup({
  layouts = layout,
  })
  dapui.open()
end

return M

