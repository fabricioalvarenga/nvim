local LSP = {}

function LSP.setup()
   -- Check if clangd is installed
   if vim.fn.executable("clangd") == 0 then
        vim.notify("clangd is not installed. Download it from https://github.com/clangd/clangd/releases/", vim.log.levels.WARN)
        return
    end

    -- Configure clangd for C and C++
    vim.lsp.config("clangd", {
        cmd = { "clangd" },
    })
    vim.lsp.enable("clangd")
end

return LSP
