local LSP = {}

function LSP.setup(lspconfig)
    -- Configure Swift
    lspconfig.sourcekit.setup({
        -- Set the project's root_dir dynamically
        root_dir = function(fname)
            return lspconfig.util.root_pattern("*.xcodeproj", "Package.swift", ".git")(fname) or lspconfig.util.path.dirname(fname)
        end,

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
