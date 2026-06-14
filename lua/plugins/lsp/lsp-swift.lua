local LSP = {}

function LSP.setup()
    -- Check if xcode-build-servder is installed
    if vim.fn.executable("xcode-build-server") == 0 then
        vim.notify("xcode-build-server is not installed. For sourcekit-lsp to work properly,\ninstall it using: brew install xcode-build-server", vim.log.levels.WARN)
        vim.notify("*** Then run 'xcode-build-server config -scheme MyScheme -project *.xcodeproj'\nin the project directory to generate buildServer.json the file ***", vim.log.levels.WARN)
        return
    end

    -- Configure Swift
    vim.lsp.config("sourcekit", {})
    vim.lsp.enable("sourcekit")
end

return LSP
