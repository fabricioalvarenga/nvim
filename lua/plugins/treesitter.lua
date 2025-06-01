return {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",
    
    config = function()
        require("nvim-treesitter.configs").setup({
            ensurre_installed = {
                "swift",
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                use_languagetree = true, -- Force Treesitter to take priority over LSP highlight
            }
        })
    end,
}
