-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

local opts = {
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    expandtab = true,
    smartindent = true,
    wrap = false,
    termguicolors = true,
    number = true,
    relativenumber = true,
    incsearch = true,
    updatetime = 50,
    splitbelow = true,
    splitright = true,
    scrolloff = 8,
    signcolumn = "yes",
    clipboard = "unnamed,unnamedplus",
    cursorline = true,
    list = false,
    cmdheight = 0,
}

-- Set options from table
for opt, val in pairs(opts) do
    vim.o[opt] = val
end

-- Set colorscheme
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)
