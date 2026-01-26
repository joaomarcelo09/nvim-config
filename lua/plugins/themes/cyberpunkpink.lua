-- ── Neovide ───────────────────────────────────────────────
if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font Mono:h12"
  vim.g.neovide_cursor_animation_length = 0.10
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_cursor_vfx_mode = "ripple"
  vim.g.neovide_input_macos_alt_is_meta = false
end

local dracula_pro_path = vim.fn.stdpath("data") .. "/themes/dracula_pro"

-- ── Neon Synth Pink Palette ──────────────────────────────
local pink = {
  bg        = "#1B103D",
  bg_dark   = "#1B103D",
  fg        = "#ffe6fa",
  comment   = "#8b5d9a",
  selection = "#000DFF",

  neon      = "#B051A0",
  hotpink   = "#ff4fd8",
  purple    = "#b77bff",
  cyan      = "#00f6ff",
  green     = "#27C447",
  red       = "#ff2f6d",
  orange    = "#ff79c6",
  yellow    = "#ffe36e",
}

return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    enabled = true,
    config = function()
      vim.cmd("colorscheme tokyonight-night")

      local set = vim.api.nvim_set_hl

      -- ── Core UI ─────────────────────────────────────────
      set(0, "Normal",      { fg = pink.fg, bg = pink.bg })
      set(0, "NormalFloat", { fg = pink.fg, bg = pink.bg_dark })
      set(0, "Comment",     { fg = pink.comment, italic = true })
      set(0, "Visual",      { bg = pink.selection })

      set(0, "CursorLine",   { bg = "#362078" })
      set(0, "LineNr",       { fg = "#50245e" })
      set(0, "CursorLineNr", { fg = pink.neon, bold = true })
      set(0, "WinSeparator", { fg = pink.neon })

      -- ── Syntax ─────────────────────────────────────────
      set(0, "String",      { fg = pink.yellow })
      set(0, "Function",    { fg = pink.green })
      set(0, "Keyword",     { fg = pink.neon, bold = true })
      set(0, "Conditional", { fg = pink.neon })
      set(0, "Repeat",      { fg = pink.neon })
      set(0, "Operator",    { fg = pink.neon })
      set(0, "Identifier",  { fg = pink.fg })
      set(0, "Type",        { fg = pink.purple, bold = true })
      set(0, "Constant",    { fg = pink.orange })
      set(0, "Number",      { fg = pink.orange })
      set(0, "Boolean",     { fg = pink.orange })

      -- ── Diagnostics ────────────────────────────────────
      set(0, "DiagnosticError", { fg = pink.red, bold = true })
      set(0, "DiagnosticWarn",  { fg = pink.orange })
      set(0, "DiagnosticInfo",  { fg = pink.cyan })
      set(0, "DiagnosticHint",  { fg = pink.purple })

      -- ── LSP Semantic Tokens ────────────────────────────
      set(0, "@lsp.type.function",  { fg = pink.green })
      set(0, "@lsp.type.method",    { fg = pink.green })
      set(0, "@lsp.type.class",     { fg = pink.purple, bold = true })
      set(0, "@lsp.type.variable",  { fg = pink.fg })
      set(0, "@lsp.type.parameter", { fg = pink.orange })
      set(0, "@lsp.type.keyword",   { fg = pink.neon, bold = true })
      set(0, "@lsp.type.operator",  { fg = pink.neon })
      set(0, "@lsp.type.string",    { fg = pink.yellow })

      -- ── Your original links ───────────────────────────
      vim.cmd([[
        hi! link @lsp.typemod.variable.readonly Constant
        hi! link @lsp.type.extensionMethodName.cs Function
        hi! link @lsp.type.constantName.cs Constant
      ]])
    end,
  },

  {
    dir = dracula_pro_path,
    priority = 1000,
    enabled = false,
  },
}

