local LSP = {}

function LSP.setup(lspconfig)
    -- Configure Swift
    lspconfig.sourcekit.setup({
        cmd = { "sourcekit-lsp" },
        filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },

        root_dir = function(filename)
            return require("lspconfig.util").root_pattern(
                "*.xcworkspace",
                "*.xcodeproj",
                "Package.swift",
                ".git"
            )(filename)
        end,

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

        -- Disable semantic highlighting, allowing Treesitter to perform highlighting
        on_attach = function(client, bufnr)
            client.server_capabilities.semanticTokensProvider = nil
        end,
    })
end

return LSP
