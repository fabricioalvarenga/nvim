-- Hotkey configuration for LSP
local function setup_global_lsp_mappings()
     vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP Actions",
        callback = function(args)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true }) -- Shows information about what is under the cursor
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true }) -- Go to definition
        end,
    })
end
setup_global_lsp_mappings()

-- Loads LSP settings for each language separately
return {
    require("plugins.lsp.lsp-lua"),
    require("plugins.lsp.lsp-swift"),
    require("plugins.lsp.lsp-c"),
    require("plugins.lsp.lsp-python"),
}

