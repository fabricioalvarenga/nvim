return {
    -- Autocompletion
    "hrsh7th/nvim-cmp",

    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- LSP support
        "hrsh7th/cmp-buffer", -- Completions based on buffer
        "hrsh7th/cmp-path", -- Suggestions on files paths
        "hrsh7th/cmp-cmdline", -- Suggestions on command mode
        "L3MON4D3/LuaSnip", -- Snippets
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim", -- Icons on autocompletion menu
    },

    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        cmp.setup({
            formatting = {
                format = lspkind.cmp_format({ width_text = true, maxwidth = 100 }),
                autocomplete = true,
            },

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
                { name = "luasnip" },
            }),
        })
    end,
}
