return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "frappe",
        integrations = {
            cmp = true,
            treesitter = true,
            gitsigns = true,
            dashboard = true,
            bufferline = true,
            barbar = true,
        }
    }
}
