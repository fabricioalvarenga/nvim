local LSP = {}

function LSP.setup(lspconfig)
    -- Configure Swift
    lspconfig.sourcekit.setup({
        cmd = { "sourcekit-lsp" },
        filetypes = { "swift", "objective-c", "objective-cpp" },
        root_dir = function(filename)
            return require("lspconfig.util").root_pattern(
                "*.xcworkspace",
                "*.xcodeproj",
                "Package.swift",
                ".git"
            )(filename)
        end,
        -- init_options = {
        --     compilationDatabase = vim.fn.getcwd() .. "/compile_commands.json"
        -- }, 
        settings = { 
            sourcekit_lsp = {
                index = {
                    enable = true,
                    store_in_memory = false,
                },
            },
        },
        capabilities = {
            workspace = {
                didChangeWatchedFiles = {
                    dynamicRegistration = true,
                },
            },
        },
    })
end

return LSP
