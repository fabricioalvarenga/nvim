return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    name="catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
    	require("catppuccin").setup({})
    	vim.cmd.colorscheme "catppuccin-mocha"
--    	vim.cmd.colorscheme "catppuccin-latte"
    end,
  },
}
