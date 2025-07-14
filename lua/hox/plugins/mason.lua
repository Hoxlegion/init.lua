local lsp_config = require("hox.lsp")

return {
    {
        "williamboman/mason.nvim",
        config = function()
              require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            -- This is the key part that connects mason and lspconfig
            require("mason-lspconfig").setup({
                -- Alist of servers to automatically install if they're not already installed
                ensure_installed = { "csharp_ls", "ts_ls", "lua_ls" },

                -- This function is called for each server that is installed.
                -- It is in charge of calling lspconfig.SERVER.setup()
                handlers = {
                    -- This is the default handler. It will be called for all servers
                    -- that don't have a custom handler defined below.
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            on_attach = lsp_config.on_attach,
                            capabilities = lsp_config.capabilities,
                        })
                    end,

                    -- You can add custom handlers for specific servers here.
                    -- For example, if lua_ls needed special setting:
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup({
                            -- We'll add capabilities and on_attach here later
                            on_attach = lsp_config.on_attach,
                            capabilities = lsp_config.capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        -- Get the language servers to recognize "vim" as a global
                                        globals = { "vim" },
                                    },
                                },
                            },
                        })
                    end,
                },
            })
        end,
    },
    {
        -- This plugin shows LSP progress in the bottom right corner
        "j-hui/fidget.nvim",
        opts = {},
    },
}
