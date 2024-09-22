-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- Add LaxyVim 
        { "LazyVim/LazyVim" },

        -- Import your plugins
        { import = "plugins.lsp" },
        { import = "plugins.codecompletion" },
        { import = "plugins.colorscheme" },
        { import = "plugins.lualine" },

	-- Import any extras modules here
--	{ import = "lazyvim.plugins.extras.lang.json" },
--	{ import = "lazyvim.plugins.extras.lang.typescript" },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you known waht you're doing, you can set this to 'true' to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that suport versioning,
        -- have outdated releases, wich may break your Neovim install.
        version = false, -- Always use the latest git commit
        -- version = "*", -- Try installing the latest stable version for plugins that support semver
    },
    checker = {
        enabled = true, -- Check for plugin updates periodically
        notify = false, -- Notify on update
    },
})

-- Start lualine plugin (I couldn't start it from the lualine.lua file)
require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "material",
--        theme = "nightfly",
--        theme = "onedark",
--        theme = "palenight",
        component_separators = { left = "", right = ""},
        section_separators = { left = "", right = ""},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diagnostics" },
      lualine_c = { { "filename", path = 3 } },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { "filename", path = 3 } },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})
