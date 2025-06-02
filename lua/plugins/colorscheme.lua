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
            -- vim.cmd [[colorscheme catppuccin-latte]]

            -- 
            -- Begin Swift colors 
            --
            local xcode_colors = {
                dark = {
                    vibrant_pink = "#EF74A8",
                    light_yellow = "#FFD580",
                    ligth_gray = "#ABB2BF",
                    satured_purple = "#C678DD",
                    dark_purple = "#8866B1",
                    light_blue = "#61AFEF",
                    pinkish_red = "#E06C75",
                    white = "#FFFFFF",
                    dull_gray = "#5C6370",
                    brown = "#C0685D",
                    light_green = "#98C379",
                },
                light = {
                     vibrant_pink = "#EF74A8",
                    light_yellow = "#FFD580",
                    ligth_gray = "#ABB2BF",
                    satured_purple = "#C678DD",
                    dark_purple = "#8866B1",
                    light_blue = "#61AFEF",
                    pinkish_red = "#E06C75",
                    white = "#FFFFFF",
                    dull_gray = "#5C6370",
                    brown = "#C0685D",
                    light_green = "#98C379",
               },
            }

            local is_dark = vim.o.background == "dark"
            local colors = is_dark and xcode_colors.dark or xcode_colors.light

            local highlights = {
                ["Conditional"] = { fg = colors.vibrant_pink, bold = true },
                ["@conditional"] = { fg = colors.vibrant_pink, bold = true },
                ["@constructor"] = { fg = colors.vibrant_pink, bold = true },
                ["Keyword"] = { fg = colors.vibrant_pink, bold = true },
                ["@keyword"] = { fg = colors.vibrant_pink, bold = true },
                ["@keyword.conditional"] = { fg = colors.vibrant_pink, bold = true },
                ["@keyword.exception"] = { fg = colors.vibrant_pink, bold = true },
                ["@keyword.function"] = { fg = colors.vibrant_pink, bold = true },
                ["@keyword.import"] = { fg = colors.vibrant_pink, bold = true },
                ["@keyword.repeat"] = { fg = colors.vibrant_pink, bold = true },
                ["@keyword.return"] = { fg = colors.vibrant_pink, bold = true },
                ["@boolean"] = { fg = colors.light_yellow },
                ["@keyword.directive"] = { fg = colors.light_yellow },
                ["Number"] = { fg = colors.light_yellow },
                ["@number"] = { fg = colors.light_yellow },
                ["@punctuation"] = { fg = colors.light_gray },
                ["@punctuation.bracket"] = { fg = colors.light_gray },
                ["@punctuation.delimiter"] = { fg = colors.light_gray },
                ["@punctuation.special"] = { fg = colors.light_gray },
                ["@parameter"] = { fg = colors.satured_purple },
                ["@variable.parameter"] = { fg = colors.satured_purple },
                ["@attribute"] = { fg = colors.satured_purple, bold = true },
                ["@variable.member"] = { fg = colors.dark_purple },
                ["Function"] = { fg = colors.light_blue },
                ["@function"] = { fg = colors.light_blue },
                ["@function.call"] = { fg = colors.light_blue },
                ["@exception"] = { fg = colors.pinkish_red },
                ["@variable.builtin"] = { fg = colors.pinkish_red },
                ["@operator"] = { fg = colors.white },
                ["@variable"] = { fg = colors.white },
                ["@comment"] = { fg = colors.dull_gray },
                ["@string"] = { fg = colors.brown },
                ["@type"] = { fg = colors.ligth_green },
                ["@character"] = { fg = "#FF0000" },
                ["@character.special"] = { fg = "#FF0000" },
                ["@comment.error"] = { fg = "#FF0000" },
                ["@comment.warning"] = { fg = "#FF0000" },
                ["@comment.note"] = { fg = "#FF0000" },
                ["@comment.todo"] = { fg = "#FF0000" },
                ["@conceal"] = { fg = "#FF0000" },
                ["@constant"] = { fg = "#FF0000" },
                ["@constant.macro"] = { fg = "#FF0000" },
                ["@debug"] = { fg = "#FF0000" },
                ["@define"] = { fg = "#FF0000" },
                ["@error"] = { fg = "#FF0000" },
                ["@field"] = { fg = "#FF0000" },
                ["@float"] = { fg = "#FF0000" },
                ["@function.builtin"] = { fg = "#FF0000" },
                ["@function.macro"] = { fg = "#FF0000" },
                ["@include"] = { fg = "#FF0000" },
                ["@keyword.debug"] = { fg = "#FF0000" },
                ["@keyword.operator"] = { fg = "#FF0000" },
                ["@label"] = { fg = "#FF0000" },
                ["@method"] = { fg = "#FF0000" },
                ["@method.call"] = { fg = "#FF0000" },
                ["@module"] = { fg = "#FF0000" },
                ["@namespace"] = { fg = "#FF0000" },
                ["@none"] = { fg = "#FF0000" },
                ["@preproc"] = { fg = "#FF0000" },
                ["@property"] = { fg = "#FF0000" },
                ["@repeat"] = { fg = "#FF0000" },
                ["@storageclass"] = { fg = "#FF0000" },
                ["@string.documentation"] = { fg = "#FF0000" },
                ["@string.escape"] = { fg = "#FF0000" },
                ["@string.regex"] = { fg = "#FF0000" },
                ["@string.special"] = { fg = "#FF0000" },
                ["@string.special.path"] = { fg = "#FF0000" },
                ["@string.special.symbol"] = { fg = "#FF0000" },
                ["@symbol"] = { fg = "#FF0000" },
                ["@tag"] = { fg = "#FF0000" },
                ["@tag.attribute"] = { fg = "#FF0000" },
                ["@tag.delimiter"] = { fg = "#FF0000" },
                ["@text"] = { fg = "#FF0000" },
                ["@text.danger"] = { fg = "#FF0000" },
                ["@text.diff.add"] = { fg = "#FF0000" },
                ["@text.diff.delete"] = { fg = "#FF0000" },
                ["@text.emphasis"] = { fg = "#FF0000" },
                ["@text.environment"] = { fg = "#FF0000" },
                ["@text.environment.name"] = { fg = "#FF0000" },
                ["@text.literal"] = { fg = "#FF0000" },
                ["@text.math"] = { fg = "#FF0000" },
                ["@text.note"] = { fg = "#FF0000" },
                ["@text.reference"] = { fg = "#FF0000" },
                ["@text.strike"] = { fg = "#FF0000" },
                ["@text.strong"] = { fg = "#FF0000" },
                ["@text.title"] = { fg = "#FF0000" },
                ["@text.todo"] = { fg = "#FF0000" },
                ["@text.underline"] = { fg = "#FF0000" },
                ["@text.uri"] = { fg = "#FF0000" },
                ["@text.warning"] = { fg = "#FF0000" },
                ["@type.builtin"] = { fg = "#FF0000" },
                ["@type.definition"] = { fg = "#FF0000" },
                ["@type.qualifier"] = { fg = "#FF0000" },
                ["@variable.global"] = { fg = "#FF0000" },
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

    -- solarized-osaka
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = true,
        priority = 1000,
        opts = function()
            return {
                transparent = true,
            }
        end,
    },
}
