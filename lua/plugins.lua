local status, packer = pcall(require, 'packer')

if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'svrana/neosolarized.nvim',
        requires = { 'tjdevries/colorbuddy.nvim' }
    }
    use 'hoob3rt/lualine.nvim' -- Status line
    use 'windwp/nvim-autopairs'
    use 'norcalli/nvim-colorizer.lua'
end)
