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

                },
                light = {
                },
            }

            local is_dark = vim.o.background == "dark"
            local colors = is_dark and xcode_colors.dark or xcode_colors.light

            local highlights = {
                -- ["@attribute"] = { fg = "#98C379" }, -- Verde claro

                ["Conditional"] = { fg = "#EF74A8", bold = true },          -- Rosa vibrante
                ["@conditional"] = { fg = "#EF74A8", bold = true },         -- Rosa vibrante
                ["@constructor"] = { fg = "#EF74A8", bold = true },         -- Rosa vibrante
                ["Keyword"] = { fg = "#EF74A8", bold = true },              -- Rosa vibrante
                ["@keyword"] = { fg = "#EF74A8", bold = true },             -- Rosa vibrante
                ["@keyword.conditional"] = { fg = "#EF74A8", bold = true }, -- Rosa vibrante
                ["@keyword.exception"] = { fg = "#EF74A8", bold = true },   -- Rosa vibrante
                ["@keyword.function"] = { fg = "#EF74A8", bold = true },    -- Rosa Vibrante
                ["@keyword.import"] = { fg = "#EF74A8", bold = true },      -- Rosa vibrante
                ["@keyword.repeat"] = { fg = "#EF74A8", bold = true },      -- Rosa Vibrante
                ["@keyword.return"] = { fg = "#EF74A8", bold = true },      -- Rosa Vibrante
                ["@boolean"] = { fg = "#FFD580" },                          -- Amarelo claro
                ["@keyword.directive"] = { fg = "#FFD580" },                -- Amarelo claro
                ["Number"] = { fg = "#FFD580" },                            -- Amarelo claro
                ["@number"] = { fg = "#FFD580" },                           -- Amarelo claro
                ["@punctuation"] = { fg = "#ABB2BF" },                      -- Cinza claro
                ["@punctuation.bracket"] = { fg = "#ABB2BF" },              -- Cinza claro
                ["@punctuation.delimiter"] = { fg = "#ABB2BF" },            -- Cinza claro
                ["@punctuation.special"] = { fg = "#ABB2BF" },              -- Cinza claro
                ["@parameter"] = { fg = "#C678DD" },                        -- Roxo saturado
                ["@variable.parameter"] = { fg = "#C678DD" },               -- Roxo saturado
                ["@attribute"] = { fg = "#C678DD", bold = true },           -- Roxo saturado
                ["@variable.member"] = { fg = "#8866B1" },                  -- Roxo escuro
                ["Function"] = { fg = "#61AFEF" },                          -- Azul claro
                ["@function"] = { fg = "#61AFEF" },                         -- Azul claro
                ["@function.call"] = { fg = "#61AFEF" },                    -- Azul claro
                ["@exception"] = { fg = "#E06C75" },                        -- Vermelho rosado
                ["@variable.builtin"] = { fg = "#E06C75" },                 -- Vermelho rosado
                ["@operator"] = { fg = "#FFFFFF" },                         -- Branco
                ["@variable"] = { fg = "#FFFFFF" },                         -- Branco
                ["@comment"] = { fg = "#5C6370" },                          -- Cinza opaco
                ["@string"] = { fg = "#C41A16" },                           -- Vermelho escuro
                ["@type"] = { fg = "#98C379" },                             -- Verde claro
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
