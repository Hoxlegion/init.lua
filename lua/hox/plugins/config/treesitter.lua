-- Tel nvim-treesitter what to do
require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all"
    ensure_installed = { "lua", "c", "bash", "javascript", "typescript", "vimdoc", "c_sharp" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automaticcaly intall missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- Enable syntax highlighting
    highlight = {
        enable = true,
    },

    -- Enable indentation
    indent = {
        enable = true,
    },
})
