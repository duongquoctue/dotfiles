return {
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "ansiblels",                       -- Ansible
                    "bashls",                          -- Bash
                    "biome",                           -- Web-related languages
                    "cmake",                           -- CMake
                    "docker_compose_language_service", -- Docker Compose
                    "dockerls",                        -- Docker
                    "gopls",                           -- Go,
                    "helm_ls",                         -- Helm
                    "lua_ls",                          -- Lua
                    "marksman",                        -- Markdown
                    "pyright",                         -- Python
                    "rust_analyzer",                   -- Rust,
                },
                automatic_installation = true,
                handlers = {
                    require("helpers.lsp").setup_lsp
                }
            })
        end,
    },
}
