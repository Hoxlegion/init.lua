-- File: ~/.config/nvim/lua/hox/plugins/telescope.lua

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                -- Add extensive configuration here,
            })
        end,
    },
}
