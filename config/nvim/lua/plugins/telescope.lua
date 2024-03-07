return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
    },
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            }
        }
    },
    config = function()
        -- Enable telescope fzf native
        require("telescope").load_extension("fzf")
    end,
}
