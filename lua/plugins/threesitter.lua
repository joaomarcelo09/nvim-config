-- Make sure treesitter and textobjects are installed via your plugin manager
require'nvim-treesitter.configs'.setup {
  -- Enable syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- Enable Tree-sitter based textobjects
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to matching textobj
      keymaps = {
        ["af"] = "@function.outer", -- around function
        ["if"] = "@function.inner", -- inside function
        ["ac"] = "@class.outer",    -- around class
        ["ic"] = "@class.inner",    -- inside class
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- keep jump history
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
      },
    },
  },
}

