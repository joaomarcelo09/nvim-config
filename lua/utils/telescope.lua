local builtin = require('telescope.builtin')

local M = {}

function M.live_grep_visual_selection()
  -- Reselect visual mode text
  vim.cmd('normal! gv')

  local bufnr = vim.api.nvim_get_current_buf()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local start_line, start_col = start_pos[2] - 1, start_pos[3] - 1
  local end_line, end_col = end_pos[2] - 1, end_pos[3]

  -- Handle reversed selection
  if start_line > end_line or (start_line == end_line and start_col > end_col) then
    start_line, end_line = end_line, start_line
    start_col, end_col = end_col, start_col
  end

  -- Safe read
  local lines = vim.api.nvim_buf_get_text(bufnr, start_line, start_col, end_line, end_col, {})
  local selection = table.concat(lines, "\n"):gsub("\n", " "):gsub("^%s+", ""):gsub("%s+$", "")

  if #selection > 0 then
    builtin.live_grep({ default_text = selection })
  else
    vim.notify("No text selected", vim.log.levels.WARN)
  end
end

return M

