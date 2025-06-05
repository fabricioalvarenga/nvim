return {
    "folke/neoconf.nvim",

    lazy = false,

    config = function()
        -- Initialize neoconf before any LSP configuration
        require("neoconf").setup()
    end,
}
