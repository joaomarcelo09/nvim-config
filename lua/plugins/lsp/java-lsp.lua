print("Configuring jdtls for Java")

local config = {
    cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },  -- Corrigido caminho
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]) or vim.fn.getcwd(),  -- Garantindo o root_dir
}

require('jdtls').start_or_attach(config)

print("Success")
