print("Configuring jdtls for Java")

local install_path = vim.fn.expand("~") .. "/fonte/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls"
local workspace_dir = vim.fn.expand("~") .. "/fonte/my-projects"  -- Caminho para o workspace
local lombok_jar = vim.fn.expand("~") .. "/.lombok/lombok"

print(lombok_jar)

local config = {
    cmd = {  install_path, "-data", workspace_dir, },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    settings = {
        java = {
            completion = {
                enabled = true,
                favoriteStaticMembers = { "org.junit.Assert.*", "org.mockito.Mockito.*" },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}}",
                },
            },
            diagnostics = {
                enabled = true,
                severityOverrides = {
                    ["deprecation"] = "warning",
                    ["unchecked"] = "error",
                },
            },
            edit = {
                organizeImports = true,
            }, 
        },
    },
}

require('jdtls').start_or_attach(config)
print("Success")
