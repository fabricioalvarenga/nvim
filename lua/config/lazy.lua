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
        -- Add LazyVim 
        { "LazyVim/LazyVim", },

        -- Import plugins
        { import = "plugins.neoconf" }, -- Import always before LSP
        { import = "plugins.lsp.lsp" },
        { import = "plugins.codecompletion" },
        { import = "plugins.colorscheme" },
        { import = "plugins.lualine" },
        { import = "plugins.autopairs" },
        { import = "plugins.nvim-tree" },
        { import = "plugins.indentation" },
        { import = "plugins.comment" },
        { import = "plugins.spectre" },
        { import = "plugins.treesitter" },
        { import = "plugins.telescope" },
        { import = "plugins.tmux-navigator" },

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
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    checker = {
        enabled = true, -- check for plugin updates periodically
        notify = false, -- notify on update
    },
})

