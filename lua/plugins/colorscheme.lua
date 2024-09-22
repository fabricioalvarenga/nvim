return {
    -- tokyonight
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
        opts = { style = "moon" },
        config = function()
            vim.cmd [[colorscheme tokyonight]]
        end,
    },

    -- catppuccin
    {
        "catppuccin/nvim",
        name="catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({})
            vim.cmd [[colorscheme catppuccin-mocha]]
--            vim.cmd [[colorscheme catppuccin-latte]]
        end,
    },

    {
        "craftzdog/solarized-osaka.nvim",
        lazy = true,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd [[colorscheme solarized-osaka]]
        end,
    },
}
