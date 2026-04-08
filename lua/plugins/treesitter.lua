return {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            ensurre_installed = { "swift", "markdown", "markdown_inline" },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
