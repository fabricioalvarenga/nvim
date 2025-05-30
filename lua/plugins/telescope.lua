return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        -- "nvim-telescope/telescope-file-browser.nvim",
    },

    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                respect_gitignore = false,
                hidden = true,
                grouped = true,
                previewer = false,
                initial_mode = "normal",

            },
        })
    end,

}
