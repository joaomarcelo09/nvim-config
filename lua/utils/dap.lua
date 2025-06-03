local M = {}

local dapui = require("dapui")

function M.reset_dapui()
  dapui.close()
  dapui.setup({
    layouts = {
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
        },
        size = 10, -- 📏 height of the bottom window
        position = "bottom",
      },
    },
  })
  dapui.open()
end

return M

