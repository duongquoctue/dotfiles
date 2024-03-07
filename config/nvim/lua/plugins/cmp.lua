return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig"
        },
        config = true,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "neovim/nvim-lspconfig",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                },
                mapping = cmp.mapping.preset.insert({
                    -- Enter key confirms completion item
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),

                    -- Ctrl + space triggers completion menu
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            })
        end
    }
}
