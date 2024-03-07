return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "catppuccin",
            component_separators = { left = "", right = "|" },
            section_separators = "",
            globalstatus = true,
        },
        extensions = {
            "nvim-tree",
            "toggleterm",
            "trouble",
            "mason",
            "nvim-dap-ui",
        }
    }
}
