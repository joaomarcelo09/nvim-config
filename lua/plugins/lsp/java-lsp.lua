local jdtls = require("jdtls")

-- Detect project name & folder
local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

-- Define on_attach to adjust semantic token priority for Java LSP only
local on_attach = function(client, bufnr)
  -- Lower priority so Tree-sitter wins the syntax battle
  vim.highlight.priorities.semantic_tokens = 95
end

-- Build config
local config = {
  cmd = { "jdtls" },
  root_dir = require("lspconfig").util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),

  on_attach = on_attach, -- Attach our magic when LSP starts

  settings = {
    java = {
      format = { enabled = true },
      completion = { enabled = true },
      diagnostics = {
        enable = true,
        showInlayHints = true,
        checkOnSave = true,
      },
    },
  },

  init_options = {
    bundles = {}, -- You can add java-debug bundles here later
  },

  workspace_folders = {
    { name = project_name, uri = "file://" .. workspace_dir },
  },
}

-- Autocmd to attach jdtls only for Java files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    jdtls.start_or_attach(config)
  end,
})
