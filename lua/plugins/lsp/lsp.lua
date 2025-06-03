-- Hotkey configuration for LSP
-- local function setup_global_lsp_mappings()
--      vim.api.nvim_create_autocmd("LspAttach", {
--         desc = "LSP Actions",
--         callback = function(args)
--             vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true }) -- Shows information about what is under the cursor
--             vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true }) -- Go to definition
--         end,
--     })
-- end
-- setup_global_lsp_mappings()

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
