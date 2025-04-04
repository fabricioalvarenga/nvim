return {
    "nvim-tree/nvim-tree.lua",

    dependencies = "nvim-tree/nvim-web-devicons",

    config = function()
        local nvimtree = require("nvim-tree")

        -- Recomended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            view = {
                width = 35, -- Default width of then file explorer
                relativenumber = true, -- Show relative numbers
            },
            -- Change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed =  "",
                            arrow_open = "",
                        },
                    },
                },
            },
            -- Disable window picker for explorer to work well with window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            -- Apply filters
            filters = {
                custom = { ".DS_Store" },
            },
            -- Show files that are ignored by git
            git = {
                ignore = false,
            },
        })
    end
}
