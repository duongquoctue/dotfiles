-- Fetch and setup colorscheme if available, otherwise just return "default"
-- This should prevent Neovim from complaining about missing colorschemes on first boot
local function get_if_available(name)
    local lua_ok, _ = pcall(require, name)
    if lua_ok then
        return name
    end

    return "default"
end

return get_if_available("catppuccin")
