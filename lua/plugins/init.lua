
return {

  require("plugins.alpha"),

  -- Nerdtree
  {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvim_tree = require("nvim-tree")
    local nvim_devicons = require("nvim-web-devicons")

    local git = {
      icon = "󰊢",
      color = "#df3429",
      name = "GitLogo",
    }

    local webpack = {
      icon = "",
      color = "#86d3f7",
      name = "Webpack",
    }

    local env = {
      icon = "󰙪",
      color = "#f9b540",
      name = "Env",
    }

    local eslint = {
      icon = "󰱺",
      color = "#384aa7",
      name = "Eslint",
    }

    nvim_devicons.setup({
      override = {
        ["git"] = git,
        ["env"] = env,
      },
      override_by_filename = {
        ["webpack.config.js"] = webpack,
        [".env.local"] = env,
        [".env.development"] = env,
        [".env.production"] = env,
        [".eslintrc"] = eslint,
        [".eslintrc.json"] = eslint,
        [".eslintrc.js"] = eslint,
        [".gitignore"] = git,
        [".gitattributes"] = git,
      },
    })

    vim.g.loaded = 1
    vim.g.loaded_netrwPlugin = 1
    nvim_tree.setup({
      reload_on_bufenter = true,
      view = {
        width = 28,
        preserve_window_proportions = true,
      },
      actions = {
        open_file = {
          resize_window = false,
        },
      },
      git = {
        ignore = false,
      },
    })

    local current_width = 28
    vim.keymap.set("n", "<leader>e", function()
      local nvim_tree_api = require("nvim-tree.api")
      for _, winid in ipairs(vim.api.nvim_list_wins()) do
        local bufnr = vim.api.nvim_win_get_buf(winid)
        local bufwidth = vim.api.nvim_win_get_width(winid)
        if nvim_tree_api.tree.is_tree_buf(bufnr) then
          current_width = bufwidth
        end
      end

      nvim_tree_api.tree.toggle({ find_file = true, focus = false })
      vim.cmd(":NvimTreeResize " .. current_width)
    end, { noremap = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
      group = vim.api.nvim_create_augroup("NvimTreeOnOpen", { clear = false }),
      desc = "Find file on open",
      pattern = "*",
      callback = function()
        local nvimtree = require("nvim-tree.api")
        nvimtree.tree.find_file({ open = false, focus = false })
      end,
    })
  end,
},

  -- Themes
  {
    "dracula/vim",
    as = "dracula",
    config = function()
      require("plugins.theme-config")
    end,
  },

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
  config = function()
    require("plugins.blink-config")
  end,
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

  -- Vim Debugger
  "puremourning/vimspector",

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
