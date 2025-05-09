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
        -- Around and Inside functions
        ["af"] = "@function.outer", -- around function
        ["if"] = "@function.inner", -- inside function

        -- Around and Inside classes
        ["ac"] = "@class.outer",    -- around class
        ["ic"] = "@class.inner",    -- inside class

        -- Around and Inside HTML/TSX tags
        ["at"] = "@tag.outer",      -- around tag (e.g., <div>...</div>)
        ["it"] = "@tag.inner",      -- inside tag (e.g., content inside <div>)
      },
    },

    move = {
      enable = true,
      set_jumps = true, -- keep jump history
      goto_next_start = {
        ["]f"] = "@function.outer", -- move to next function
        ["]c"] = "@class.outer",    -- move to next class
        ["]t"] = "@tag.outer",      -- move to next tag (e.g., <div>)
      },
      goto_previous_start = {
        ["[f"] = "@function.outer", -- move to previous function
        ["[c"] = "@class.outer",    -- move to previous class
        ["[t"] = "@tag.outer",      -- move to previous tag (e.g., <div>)
      },
    },
  },
}
