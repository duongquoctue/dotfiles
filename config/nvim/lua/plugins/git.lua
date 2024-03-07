-- Git related plugins
return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signcolumn = true,
            current_line_blame = true,
        },
    },
    -- TODO: add git resolve conflict plugins
}
