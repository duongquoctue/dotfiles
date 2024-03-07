-- Miscelaneous fun stuff
return {
    -- Comment with haste
    -- TODO: setup mappings
    {
        "numToStr/Comment.nvim",
        opts = {},
    },
    -- Move stuff with <M-j> and <M-k> in both normal and visual mode
    -- TODO: setup mappings and remove existing line movement mappings
    {
        "echasnovski/mini.move",
        opts = {},
    },
    -- Auto pairs
    {
        'echasnovski/mini.pairs',
        version = '*',
        config = true,
    },
    -- Wildmenu completion
    {
        "gelguy/wilder.nvim",
        version = "*",
        opts = {
            modes = {
                "/",
                "?",
                ":",
                "=",
            },
        }
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },
    "tpope/vim-sleuth",   -- Detect tabstop and shiftwidth automatically
    "tpope/vim-surround", -- Surround stuff with the ys-, cs-, ds- commands
}
