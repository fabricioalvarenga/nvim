-- Check if sed command is installed
if vim.fn.executable("sed") == 0 then
    vim.notify("gnu-sed is not installed. To use Spectre, install it with: brew install gnu-sed", vim.log.levels.WARN)
    return {}
end

-- Check if ripgrep command is installed
if vim.fn.executable("rg") == 0 then
    vim.notify("ripgrep is not installed. To use Spectre, install it with: brew install ripgrep", vim.log.levels.WARN)
    return {}
end

return {
   "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim"},

    config = function()
        local spectre = require("spectre")

        spectre.setup({
            result_padding = "",
        })

        -- Set keymap to open Spectre
        local keymap = vim.keymap

        keymap.set("n", "<leader>ss", function()
            spectre.open()
        end, { desc = "Open Spectre"}
        )
    end,
}
