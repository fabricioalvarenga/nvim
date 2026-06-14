return {
    "neovim/nvim-lspconfig",

    dependencies = { "folke/neoconf.nvim" },

    config = function()
        require("neoconf").setup()

        require("plugins.lsp.lsp-lua").setup()
        require("plugins.lsp.lsp-c").setup()
        require("plugins.lsp.lsp-swift").setup()
        require("plugins.lsp.lsp-python").setup()
    end
}

