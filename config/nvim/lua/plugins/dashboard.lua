return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = {
        shortcut_type = "number",
        config = {
            header = {
                "████████╗██╗   ██╗███████╗    ██████╗ ██╗   ██╗ ██████╗ ███╗   ██╗ ██████╗ ",
                "╚══██╔══╝██║   ██║██╔════╝    ██╔══██╗██║   ██║██╔═══██╗████╗  ██║██╔════╝ ",
                "   ██║   ██║   ██║█████╗      ██║  ██║██║   ██║██║   ██║██╔██╗ ██║██║  ███╗",
                "   ██║   ██║   ██║██╔══╝      ██║  ██║██║   ██║██║   ██║██║╚██╗██║██║   ██║",
                "   ██║   ╚██████╔╝███████╗    ██████╔╝╚██████╔╝╚██████╔╝██║ ╚████║╚██████╔╝",
                "   ╚═╝    ╚═════╝ ╚══════╝    ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ",
            },
            shortcut = {
                { desc = "Find File",           key = "f", action = "Telescope find_files", group = "DashboardProjectTitle" },
                { desc = "Recently Used Files", key = "r", action = "Telescope oldfiles",   group = "DashboardProjectTitle" },
            },
            footer = { "Config cái đống neovim này mất thời gian vcl" },
        }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" }
}
