return {
    {
        "neovim/nvim-lspconfig",

        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.sourcekit.setup({
                -- Set the project's root_dir dynamically
        		root_dir = lspconfig.util.root_pattern("*.xcodeproj", "Package.swift", ".git")(fname) or lspconfig.util.path.dirname(fname),

--                 -- Aditional configuration to include paths
--                on_attach = function(client, bufnr)
--                    local function buf_set_option(...)
--                        vim.api.nvim_buf_set_option(bufnr, ...)
--                    end
--                    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
--                end,

                capabilities = {
                    workspace = {
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    },
                },
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP Actions',
                callback = function(args)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {noremap = true, silent = true})
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {noremap = true, silent = true})
                end,
            })
        end, 
    }
}
