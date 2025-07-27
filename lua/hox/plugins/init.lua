return {
  -- Completion & Snippets
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },

  -- LSP & Tools
  {
    "neovim/nvim-lspconfig",
    config = function()
        require("hox.plugins.config.lspconfig")
    end,
  },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = "TSUpdate",
    config = function()
      require("hox.plugins.config.treesitter")
    end,
  },

  -- Fuzzy finder
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },

  -- Git and tools
  { "tpope/vim-fugitive" },
  { "mbbill/undotree" },
  { "lewis6991/gitsigns.nvim" },

  -- Appearance
  { "rose-pine/neovim", name = "rose-pine" },

  -- Navigation
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        require("hox.plugins.config.harpoon")
    end,
    },
}
