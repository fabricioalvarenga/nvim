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
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
    	require("catppuccin").setup({})
    	vim.cmd.colorscheme "catppuccin-mocha"
    	--vim.cmd.colorscheme "catppuccin-latte"
    end,
  },
}
