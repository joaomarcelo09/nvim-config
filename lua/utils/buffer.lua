local M = {}

function M.smart_bdelete()
  local bufnr = vim.api.nvim_get_current_buf()

  -- Find all other regular buffers
  local normal_buffers = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_loaded(buf)
      and vim.api.nvim_get_option_value("buftype", { buf = buf }) == ""
      and buf ~= bufnr
  end, vim.api.nvim_list_bufs())

  -- If there's another normal buffer, switch to it first
  if #normal_buffers > 0 then
    vim.cmd("buffer " .. normal_buffers[1])  -- Focus another buffer
  else
    vim.cmd("enew")  -- Open an empty buffer if no other normal ones
  end

  -- Then delete the original buffer
  vim.cmd("bdelete " .. bufnr)
end

return M
