-- Diagnostic visual settings
vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
        spacing = 2,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "∙",
            [vim.diagnostic.severity.INFO] = "i",
        },
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- local signs = { Error = "✘", Warn = "▲", Hint = "∙", Info = "i" }
-- for type, icon in pairs(signs) do
--     local hl = "DiagnosticSign" .. type
--     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

return {
    "neovim/nvim-lspconfig",

    config = function()
        local lspconfig = require("lspconfig")

        require("plugins.lsp.lsp-lua").setup(lspconfig)
        require("plugins.lsp.lsp-c").setup(lspconfig)
        require("plugins.lsp.lsp-swift").setup(lspconfig)
        require("plugins.lsp.lsp-python").setup(lspconfig)
    end
}
