
return {

  require("plugins.alpha"),
  require("plugins.auto-session"),
  require("plugins.colorizer"),
  require("plugins.neodev"),
  require("plugins.template-string"),
  require("plugins.rainbow"),
  require("plugins.git"),
  require("plugins.codeium"),

  {
  "princejoogie/tailwind-highlight.nvim",
  ft = { "html", "javascriptreact", "typescriptreact", "vue", "svelte" },
  },

  -- Nerdtree
  require("plugins.nerdtree-config"),

  -- Themes
  require("plugins.colorscheme"), 

{
  "williamboman/mason.nvim",
},
{
  "williamboman/mason-lspconfig.nvim",
},
{
  "WhoIsSethDaniel/mason-tool-installer.nvim",
},
{
  "jay-babu/mason-nvim-dap.nvim",
},

  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "xzbdmw/colorful-menu.nvim" },

  {
  "saghen/blink.cmp",
  version = "1.*",
  },

 {
  "neovim/nvim-lspconfig",
  },

  {"mfussenegger/nvim-jdtls"},

    -- Syntax Support
  "sheerun/vim-polyglot",

  -- Treesitter + textobjects
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- Prisma support
  "prisma/vim-prisma",

  -- Icons (essencial pra vários plugins ficarem bonitões)
  "ryanoasis/vim-devicons",

  -- Debugger plugins
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function() require("plugins.dap-config") end,
  },
  "mfussenegger/nvim-dap-python",  -- No config? Or add if you have one
  "rcarriga/nvim-dap-ui",          -- Optional config inside dap-config.lua?
  "theHamsta/nvim-dap-virtual-text", -- Optional config inside dap-config.lua?

  -- Neotest (test integration)
  "nvim-neotest/nvim-nio",

  -- Telescope and dependencies
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  {
    "nvim-telescope/telescope.nvim",
    config = function() require("plugins.telescope-config") end,
  },
  "nvim-telescope/telescope-fzy-native.nvim",

    -- Auto Pairs
  "windwp/nvim-autopairs",

  -- Styled Components
  { "styled-components/vim-styled-components", branch = "main" },

  -- Airline (legacy vibes, mas funcional)
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",

  -- Git power trio
  "tpope/vim-fugitive",
  "Xuyuanp/nerdtree-git-plugin",
  "tpope/vim-rhubarb",
  "junegunn/gv.vim",

  -- Prettier
  {
    "prettier/vim-prettier",
    build = "yarn install --frozen-lockfile --production",
  },

  -- Bufferline & Statusline
  { "akinsho/bufferline.nvim" },
  "nvim-lualine/lualine.nvim",

  -- Comment like a pro
  "preservim/nerdcommenter",

  -- TMUX Navigator
  "christoomey/vim-tmux-navigator",

 -- Cmdline Popup
  "VonHeikemen/fine-cmdline.nvim",
  "MunifTanjim/nui.nvim",

  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local indentscope = require("mini.indentscope")
      indentscope.setup({
        symbol = "│",
        options = { try_as_border = true },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local ibl = require("ibl")
      ibl.setup({
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = { enabled = false },
      })
    end,
  },
}
