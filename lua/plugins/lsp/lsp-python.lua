local LSP = {}

function LSP.setup(lspconfig)
    -- Check if basedpyright is installed
    if vim.fn.executable("basedpyright") == 0 then
        vim.notify("basedpyright is not installed. Install it with: brew install basedpyright", vim.log.levels.WARN)
        return
    end

    -- Configure basedpyright
    lspconfig.basedpyright.setup({
        filetypes = { "python" },
        settings = {
            basedpyright = {
                analysis = {
                    diagnosticMode = "openFilesOnly",
                    typeCheckingMode = "basic",
--                    typeCheckinMode = "strict",
                    inlayHints = {
                        callArgumentNames = true
                    }
                }
            }
        }
    })
end

return LSP
