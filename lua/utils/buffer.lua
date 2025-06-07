local M = {}

function M.smart_bdelete()
  local bufnr = vim.api.nvim_get_current_buf()
  local alt_buf = vim.fn.bufnr("#")

  if alt_buf > 0 and vim.api.nvim_buf_is_loaded(alt_buf) and alt_buf ~= bufnr then
    vim.cmd("buffer " .. alt_buf)
  else
    local normal_buffers = vim.tbl_filter(function(buf)
      return vim.api.nvim_buf_is_loaded(buf)
        and vim.api.nvim_get_option_value("buftype", { buf = buf }) == ""
        and buf ~= bufnr
    end, vim.api.nvim_list_bufs())

    if #normal_buffers > 0 then
      vim.cmd("buffer " .. normal_buffers[#normal_buffers])
    else
      vim.cmd("enew")
    end
  end

  vim.cmd("bdelete " .. bufnr)
end


return M
