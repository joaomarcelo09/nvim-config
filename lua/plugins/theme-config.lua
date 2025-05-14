local dracula = require("dracula")

dracula.setup({
  -- Customize Dracula color palette with lime neon accents
  colors = {
    bg = "#282A36",  -- background dark and sleek
    fg = "#F8F8F2",  -- standard text color (off-white for readability)
    selection = "#44475A",  -- selection highlight (subtle grayish-blue)
    comment = "#6272A4",  -- keep comments in the calm blue
    red = "#FF5555",  -- original red
    orange = "#FFB86C",  -- warm orange for vibrance
    yellow = "#F1FA8C",  -- light yellow for some pop
    green = "#39FF14",  -- neon lime green
    purple = "#BD93F9",  -- purple remains for accents
    cyan = "#8BE9FD",  -- subtle cyan for clarity
    pink = "#FF79C6",  -- pink for balance
    bright_red = "#FF6E6E",  -- bright red for stronger errors
    bright_green = "#69FF94",  -- bright neon green for highlighting
    bright_yellow = "#FFFFA5",  -- bright yellow for warning hints
    bright_blue = "#D6ACFF",  -- calm bright blue for softer highlights
    bright_magenta = "#FF92DF",  -- bright magenta (pinkish) for pop
    bright_cyan = "#A4FFFF",  -- bright cyan for less intense accents
    bright_white = "#FFFFFF",  -- pure white for text clarity
    menu = "#21222C",  -- background for the menu
    visual = "#3E4452",  -- background for selected text
    gutter_fg = "#4B5263",  -- color for line numbers in gutter
    nontext = "#3B4048",  -- color for non-text characters
    white = "#ABB2BF",  -- slightly off-white for less glare
    black = "#191A21",  -- pitch-black background for contrast
  },
  
  -- Additional Options
  show_end_of_buffer = true,  -- show '~' at the end of buffers
  transparent_bg = true,  -- background can be transparent if desired
  lualine_bg_color = "#44475a",  -- subtle background color for lualine
  italic_comment = true,  -- comments in italics for better readability
  
  -- Custom highlight overrides
  overrides = {
    -- LSP diagnostics with neon accents
    DiagnosticWarn = { fg = "#39FF14", underline = true },  -- Neon green for warnings
    DiagnosticUnderlineWarn = { undercurl = true, sp = "#39FF14" },  -- Lime undercurl for warnings

    DiagnosticError = { fg = "#FF0000", underline = true },  -- Bright red for errors
    DiagnosticUnderlineError = { undercurl = true, sp = "#FF0000" },  -- Red undercurl for errors

    -- Optional: Optional highlights (like line numbers or cursorline)
    CursorLineNr = { fg = "#39FF14", bold = true },  -- Bold neon green for line numbers
    LineNr = { fg = "#44475a" },  -- Normal line numbers (soft gray)

    -- Optional: Set NonText highlight (useful for line breaks)
    NonText = { fg = "#6272A4" },  -- Soft blue for non-text characters
  },
})

-- Apply the colorscheme
vim.cmd[[colorscheme dracula]]
