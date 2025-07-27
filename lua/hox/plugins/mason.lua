-- File: ~/.config/nvim/lua/hox/plugins/mason.lua
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
            })
        end,
    },
    {
        -- This plugin shows LSP progress in the bottom right corner
        "j-hui/fidget.nvim",
        opts = {},
    },
}
