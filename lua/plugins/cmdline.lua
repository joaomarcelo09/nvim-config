require('fine-cmdline').setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = ': '
  },
  popup = {
  position = {
    row = '30%', 
    col = '50%', 
  },
  size = {
    width = '40%',
  },
  border = {
    style = 'rounded',
  },
  relative = "editor",
  win_options = {
  winhighlight = "Normal:None,FloatBorder:FineCmdlineBorder",
  winblend = 100,
  },
},
 hooks = {
    before_mount = function(input)
      -- code
    end,
    after_mount = function(input)
      -- code
    end,
    set_keymaps = function(imap, feedkeys)
      -- code
    end
  }
})
