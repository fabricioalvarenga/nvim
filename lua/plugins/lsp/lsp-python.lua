local LSP = {}

function LSP.setup()
    -- Check if basedpyright is installed
    if vim.fn.executable("basedpyright") == 0 then
        vim.notify("basedpyright is not installed. Install it with: brew install basedpyright", vim.log.levels.WARN)
        return
    end

    -- Configure basedpyright
    vim.lsp.config("basedpyright", {
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

    vim.lsp.enable("basedpyright")
end

return LSP
