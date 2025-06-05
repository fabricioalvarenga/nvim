-- Check if xcode-build-servder is installed
if vim.fn.executable("xcode-build-server") == 0 then
    vim.notify("xcode-build-server is not installed. For sourcekit-lsp to work properly,\ninstall it using: brew install xcode-build-server", vim.log.levels.WARN)
    vim.notify("*** Then run 'xcode-build-server config -scheme MyScheme -project *.xcodeproj'\nin the project directory to generate buildServer.json the file ***", vim.log.levels.WARN)
end

local LSP = {}

function LSP.setup(lspconfig)
    -- Configure Swift
    lspconfig.sourcekit.setup({
        cmd = { "sourcekit-lsp" },

        filetypes = { "swift", "objective-c", "objective-cpp" },

        root_dir = function(filename)
            local util = require("lspconfig.util")
            return util.root_pattern("buildServer.json")(filename)
            or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
            or util.find_git_ancestor(filename)
            or util.root_pattern("Package.swift")(filename)
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
