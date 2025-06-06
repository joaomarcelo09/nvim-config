return {
  "axelvc/template-string.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local template_string = require("template-string")
    template_string.setup({
        remove_template_string = true
      })
  end,
}
