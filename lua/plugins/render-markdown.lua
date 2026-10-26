return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown" },
  cmd = { "RenderMarkdown" },
  -- markdown and markdown_inline parsers come bundled with Neovim 0.12
  opts = {},
}
