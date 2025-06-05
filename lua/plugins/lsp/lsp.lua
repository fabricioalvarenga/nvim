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

return {
    "neovim/nvim-lspconfig",

    dependencies = { "folke/neoconf.nvim" },

    config = function()
        local lspconfig = require("lspconfig")

        require("plugins.lsp.lsp-lua").setup(lspconfig)
        require("plugins.lsp.lsp-c").setup(lspconfig)
        require("plugins.lsp.lsp-swift").setup(lspconfig)
        require("plugins.lsp.lsp-python").setup(lspconfig)
    end
}
