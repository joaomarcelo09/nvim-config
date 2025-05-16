local jdtls = require("jdtls")

-- Detect project name & folder
local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

-- Build config
local config = {
  cmd = { "jdtls" }, -- Mason installs jdtls binary, no need to mess with .jar paths
  root_dir = require("lspconfig").util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),

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

print("✅ Java LSP (jdtls) configured successfully.")
