-- File: ~/.config/nvim/lua/hox/plugins/git.lua
return {
    -- Gitsigns: Add git decorations to the sign column
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                -- Leave empty to use defaults
            })
        end,
    },

    -- Fugitive: Git wrapper for Nvim
    {
        "tpope/vim-fugitive",
    },

    -- Undotree: A persistent undo history tree
    {
        "mbbill/undotree",
    },
}
