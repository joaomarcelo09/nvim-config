local jdtls = require("jdtls")

-- Detect project name & folder
local home = os.getenv("HOME")

-- Set up environment variable for JDTLS with lombok
vim.env.JDTLS_JVM_ARGS = "-javaagent:" .. home .. "/.local/share/java/lombok.jar"

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

-- Define on_attach to adjust semantic token priority for Java LSP only
local on_attach = function(client, bufnr)
  -- Lower priority so Tree-sitter wins the syntax battle
  vim.highlight.priorities.semantic_tokens = 95
end

cmd_config = {
  "java",
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.product=org.eclipse.jdt.ls.core.product",
  "-Dlog.protocol=true",
  "-Dlog.level=ALL",
  "-javaagent:" .. home .. "/.local/share/java/lombok.jar",
  "-Xms1g",
  "--add-modules=ALL-SYSTEM",
  "--add-opens", "java.base/java.util=ALL-UNNAMED",
  "--add-opens", "java.base/java.lang=ALL-UNNAMED",
  "-jar", vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"):gsub("\n", ""),
  "-configuration", home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
  "-data", workspace_dir
}

-- Build config
local config = {
  cmd = cmd_config,
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
