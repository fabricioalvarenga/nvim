return {
    "neovim/nvim-lspconfig",

    config = function()
        local lspconfig = require("lspconfig")

        -- Check if pyrhight is installed
        if vim.fn.executable("basedpyright") == 0 then
            vim.notify("basedpyright is not installed. Install it with: brew install basedpyright", vim.log.levels.WARN)
            return
        end

        -- Configure Pyright
        lspconfig.basedpyright.setup({
            filetypes = { "python" },
            settings = {
                basedpyright = {
                    analysis = {
                        diagnosticMode = "openFilesOnly",
                        inlayHints = {
                            callArgumentNames = true
                        }
                    }
                }
            }
        })
   end,
}
