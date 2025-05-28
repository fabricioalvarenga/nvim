return {
    -- catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({})
            
            vim.cmd [[colorscheme catppuccin-mocha]]
--            vim.cmd [[colorscheme catppuccin-latte]]

            -- 
            -- Begin Swift colors 
            --
            local xcode_colors = {
                dark = {
                    keyword = "#DD6E9E", -- Magenta
                    func = "#DFBEFF", -- Lilás claro
                    var = "#FFFFFF", -- Branco
                    string = "#D47063", -- Marron
                    number = "#CCBE77", -- Amarelo
                },
                light = {
                    keyword = "#DD6E9E", -- Magenta
                    func = "#DFBEFF", -- Lilás claro
                    var = "#FFFFFF", -- Branco
                    string = "#D47063", -- Marron
                    number = "#CCBE77", -- Amarelo
                },
            }

            local is_dark = vim.o.background == "dark"
            local colors = is_dark and xcode_colors.dark or xcode_colors.light

            local highlights = {
                ["@keyword"] = { fg = colors.keyword, bold = true },
                ["@keyword.import"] = { fg = colors.keyword, bold = true },
                ["@keyword.function"] = { fg = colors.keyword, bold = true },
                ["Keyword"] = { fg = colors.keyword, bold = true },
                ["@repeat"] = { fg = colors.keyword, bold = true },
                ["Repeat"] = { fg = colors.keyword, bold = true },
                ["@conditional"] = { fg = colors.keyword, bold = true },
                ["Conditional"] = { fg = colors.keyword, bold = true },
                ["@variable.builtin"] = { fg = colors.keyword, bold = true },
                ["@constructor"] = { fg = colors.keyword, bold = true },

                ["@function"] = { fg = colors.func },
                ["Function"] = { fg = colors.func },
                ["@type"] = { fg = colors.func },
                ["@attribute"] = { fg = colors.func },

                ["@variable"] = { fg = colors.var },
                ["@variable.member"] = { fg = colors.var },
                ["@variable.parameter"] = { fg = colors.var },
                
                ["@string"] = { fg = colors.string },
                ["String"] = { fg = colors.string },

                ["@number"] = { fg = colors.number },
                ["Number"] = { fg = colors.number },
           }

            local swift_highlight = function()
                for group, opts in pairs(highlights) do
                    vim.api.nvim_set_hl(0, group, opts)
                end
            end

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "swift",
                callback = swift_highlight,
            })
            -- 
            -- End Swift colors 
            --

        end,
    },
}
