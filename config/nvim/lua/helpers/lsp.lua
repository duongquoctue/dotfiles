local function noop()
    print("NOOP")
end

local M = {}

local ok, cmp = pcall(require, "cmp_nvim_lsp")
if ok then
    local default_capabilities = cmp.default_capabilities()
    M.setup_lsp = function(server)
        local conf = {
            go = {
                capabilities = default_capabilities,
                filetypes = { "go", "gomod", "gowork" },
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                    },
                },
            },
        }

        if conf[server] then
            require("lspconfig")[server].setup(conf[server])
        else
            require("lspconfig")[server].setup({
                capabilities = default_capabilities,
            })
        end
    end
else
    M.lsp_capabilities = noop
end

return M
