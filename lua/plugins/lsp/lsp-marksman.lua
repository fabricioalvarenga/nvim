local LSP = {}

function LSP.setup(lspconfig)
    -- Check if marksman is installed
    if vim.fn.executable("marksman") == 0 then
        vim.notify("marksman is not installed. Install it using: brew install marksman", vim.log.levels.WARN)
        return
    end

    lspconfig.marksman.setup({
        cmd = { "marksman", "server" },
        filetypes = { "markdown", "markdown.mdx" },
        root_dir = lspconfig.util.root_pattern(".marksman.toml", ".git") or vim.fn.getcwd(),
    })
end

return LSP
