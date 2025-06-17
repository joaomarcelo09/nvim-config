return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local gitsigns = require("gitsigns")
      gitsigns.setup({
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 350,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
      })
      vim.cmd([[
        hi! link GitSignsCurrentLineBlame DraculaFg
      ]])
    end,
  },
  {
    "github/copilot.vim",
    event = { "BufReadPre", "BufNewFile" },
  },
}
