local M = {}

M.set_leader = function(key)
    vim.g.mapleader = key
    vim.g.maplocalleader = key
    M.map({ "n", "v" }, key, "<nop>")
end

M.map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

M.nvimtree_map = function(lhs, rhs, bufnr)
    vim.keymap.set("n", lhs, rhs,
        { buffer = bufnr, noremap = true, silent = true, nowait = true })
end

-- TODO: add LSP mappings
M.lsp_map = function(lhs, rhs, bufnr, desc)
    vim.keymap.set("n", lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
end

-- TODO: add DAP mappings
M.dap_map = function(mode, lhs, rhs, desc)
    M.map(mode, lhs, rhs, desc)
end

return M
