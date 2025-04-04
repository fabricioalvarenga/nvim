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

        -- Defines text color of search and replace
        -- Uses a small delay (100 miliseconds) to ensure that the colors will be set. Without this delay the colors were not changing.
        vim.defer_fn(function()
            vim.api.nvim_set_hl(0, "SpectreSearch", { fg = "#ffffff", bg = "#e74c3c", bold = true })
            vim.api.nvim_set_hl(0, "SpectreReplace", { fg = "#ffffff", bg = "#2ecc71", bold = true })
            vim.api.nvim_set_hl(0, "SpectreLine", { bg = "#2ecc71" })
        end, 100)

        spectre.setup({
            result_padding = "",

            -- Set text color of search and replace
            highlight = {
                search = "SpectreSearch",
                replace = "SpectreReplace",
                line = "SpectreLine",
            },
        })
    end,
}
