return {
    "neovim/nvim-lspconfig",

    config = function()
        local lspconfig = require("lspconfig")

       -- Check if clangd is installed
       if vim.fn.executable("clangd") == 0 then
            vim.notify("clangd is not installed. Download it from https://github.com/clangd/clangd/releases/", vim.log.levels.WARN)
            return
        end

        -- Configure clangd for C and C++
        lspconfig.clangd.setup({
            cmd = { "clangd" }, -- clangd path (define full path if necessary)
            filetypes = { "c", "cpp", "objc", "objcpp" },
            root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
            capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Enable autocompletion 
        })
    end,
}
