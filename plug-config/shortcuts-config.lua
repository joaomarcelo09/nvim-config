-- Helper for cleaner key mapping
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')
local dap, dapui = require("dap"), require("dapui")

-- SHORTCUTS

-- Save code in buffer
map('n', '<leader>sb', ':w<CR>', opts)

-- Format with Prettier
map('n', '<leader>fb', ':Prettier<CR>', opts)

-- Visual
map('n', '<C-a>', 'ggVG', { desc = "Select all text" })
map('n', 'dl', '"_dd', { desc = "Delete line without copying" })
map('n', 'dw', '"_dw', { desc = "Delete word without copying" })

-- Toggle NERDTree
map("n", ",", ":NERDTreeToggle<CR>", opts)

-- Controls of bufferline
map('n', 'H', ':BufferLineCyclePrev<CR>', opts)
map('n', 'L', ':BufferLineCycleNext<CR>', opts)
map('n', '<leader>c', ':bdelete<CR>', opts)

-- Debugger SHORTCUTS

map("n", "<F5>", dap.continue)
map("n", "<F10>", dap.step_over)
map("n", "<F11>", dap.step_into)
map("n", "<F12>", dap.step_out)
map("n", "<Leader>b", dap.toggle_breakpoint)
map("n", "<Leader>dt", function()
  dap.terminate()
  dapui.close()
end)
map("n", "<Leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
map("n", "<Leader>du", dapui.toggle)

-- Local buffer search with Telescope

map('n', '<leader>fl', function()
  builtin.current_buffer_fuzzy_find({
    previewer = false, 
    layout_strategy = 'vertical', 
    winblend = 0, 
    border = true,  
    borderchars = { '─', '│', '─', '│', '┌', '┐', '└', '┘' }, 
  })
end, { desc = "Local Buffer Fuzzy Find" })

-- Search in general files
map('n', '<leader>ff', function()
  builtin.find_files({
    previewer = true, 
    layout_strategy = 'horizontal', 
    winblend = 20, 
    border = true, 
    borderchars = { '─', '│', '─', '│', '┌', '┐', '└', '┘' },
  })
end, { desc = "Find Files" })

-- Search with live grep
map('n', '<leader>fg', function()
  builtin.live_grep({
    previewer = true,
    layout_strategy = 'horizontal',
    winblend = 20,
    border = true,
    borderchars = { '─', '│', '─', '│', '┌', '┐', '└', '┘' },
  })
end, { desc = "Live Grep" })

-- Git Diff using Fugitive
map('n', '<leader>gc', ':Gdiffsplit<CR>', { desc = "Git Diff" })

-- Navigate to previous conflict in merge
map('n', '<leader>c[', ':Gdiffsplit<CR>', { desc = "Previous Conflict" })

-- Navigate to next conflict in merge
map('n', '<leader>c]', ':Gdiffsplit<CR>', { desc = "Next Conflict" })

-- Git Mergetool (use external merge tool)
map('n', '<leader>gm', ':!git mergetool<CR>', { desc = "Git Mergetool" })

-- LSP config
map('n', 'gd', vim.lsp.buf.definition, opts)
map('n', 'gdd', vim.lsp.buf.declaration, opts)
map('n', 'gr', vim.lsp.buf.references, opts)
map('n', 'gi', vim.lsp.buf.implementation, opts)
map('n', 'gk', vim.lsp.buf.hover, opts)
map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
map('n', '<C-n>', vim.diagnostic.goto_prev, opts)
map('n', '<C-p>', vim.diagnostic.goto_next, opts)
map('n', 'mm', vim.lsp.buf.rename, opts)
map('n', 'ge', vim.diagnostic.open_float, opts)
