local M = {}
local function noop()
    print("NOOP")
end

local ok, builtin = pcall(require, "telescope.builtin")
if ok then
    M.open_recent = function()
        builtin.oldfiles()
    end
    M.find_files = function()
        builtin.find_files()
    end
    M.grep_string = function()
        builtin.grep_string()
    end
    M.live_grep = function()
        builtin.live_grep()
    end
    M.buffers = function()
        builtin.buffers()
    end
    M.help_tags = function()
        builtin.help_tags()
    end
else
    M.find_files = noop
end

return M
