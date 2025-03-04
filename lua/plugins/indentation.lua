return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},

        config = function()
            local indent = require("ibl")

            indent.setup({})
        end,
    }
}
